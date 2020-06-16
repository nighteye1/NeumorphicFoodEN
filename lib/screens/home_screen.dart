import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fooden/screens/donate_screen.dart';
import 'package:fooden/screens/event_screen.dart';
import 'package:fooden/screens/profile_screen.dart';
import 'package:fooden/screens/volunteer_screen.dart';
import 'package:flutter/services.dart';




class HomeScreen extends StatefulWidget {



  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  int _currentIndex;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  PageController _controller;

  List<Widget> _children;
  PageView pageView;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void initialize() {
    _currentIndex = 0;
    _children = [
      ProfileScreen(),
      VolunteerScreen(),
      DonateScreen(),
      EventScreen(),
    ];
    _controller = PageController(initialPage: _currentIndex);
    pageView = PageView(
      controller: this._controller,
      children: this._children,
      onPageChanged: (page) {
        setState(() {
          _currentIndex = page;
        });
      },
    );
  }

  void getCurrentUser() async {
    try {
      loggedInUser = await _auth.currentUser();
      if (loggedInUser != null) {
        print(loggedInUser.email);
      }
    } catch (e) {print("ABC");}
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: pageView,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          elevation: 0,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              this._controller.animateToPage(index,
                  duration: Duration(milliseconds: 300), curve: Curves.fastLinearToSlowEaseIn);
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Color(0xffdddddd),
              icon: NeumorphicIcon(
                Icons.person,
                size: 30,
                style: NeumorphicStyle(
                  depth: 10,
                  intensity: 0.7,
                  shape: NeumorphicShape.flat,
                  shadowDarkColor: Colors.black,
                  shadowLightColor: Colors.white,
                  color: Colors.black,
                ),
              ),
              title: NeumorphicText(
                'Profile',
                style: NeumorphicStyle(
                  color: Colors.black,
                  shadowDarkColor: Colors.black,
                ),
                textStyle: NeumorphicTextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto Slab",
                ),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xffdddddd),
              icon: NeumorphicIcon(
                Icons.map,
                size: 30,
                style: NeumorphicStyle(
                  depth: 10,
                  intensity: 0.7,
                  shape: NeumorphicShape.flat,
                  shadowDarkColor: Colors.black,
                  shadowLightColor: Colors.white,
                  color: Colors.black,
                ),
              ),
              title: NeumorphicText(
                'Volunteer',
                style: NeumorphicStyle(
                  color: Colors.black,
                  shadowDarkColor: Colors.black,
                ),
                textStyle: NeumorphicTextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto Slab",
                ),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xffdddddd),
              icon: NeumorphicIcon(
                Icons.attach_money,
                size: 30,
                style: NeumorphicStyle(
                  depth: 10,
                  intensity: 0.7,
                  shape: NeumorphicShape.flat,
                  shadowDarkColor: Colors.black,
                  shadowLightColor: Colors.white,
                  color: Colors.black,
                ),
              ),
              title: NeumorphicText(
                'Donate',
                style: NeumorphicStyle(
                  color: Colors.black,
                  shadowDarkColor: Colors.black,
                ),
                textStyle: NeumorphicTextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto Slab",
                ),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xffdddddd),
              icon: NeumorphicIcon(
                Icons.event,
                size: 30,
                style: NeumorphicStyle(
                  depth: 10,
                  intensity: 0.7,
                  shape: NeumorphicShape.flat,
                  shadowDarkColor: Colors.black,
                  shadowLightColor: Colors.white,
                  color: Colors.black,
                ),
              ),
              title: NeumorphicText(
                'Events',
                style: NeumorphicStyle(
                  color: Colors.black,
                  shadowDarkColor: Colors.black,
                ),
                textStyle: NeumorphicTextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto Slab",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
