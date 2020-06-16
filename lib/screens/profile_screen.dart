import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fooden/components/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fooden/screens/DetailForm.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  //ProfileScreen({this.firstName, this.lastName, this.email, this.password, this.phoneNumber});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String firstName = "";
  String lastName = "";
  String password = "";
  String email = "";
  String phoneNumber = "";
  String downloadURL = "";

  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;

  BorderRadius borderRadius = BorderRadius.circular(20);

  FirebaseUser loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getUserData();
  }

  void getCurrentUser() async {
    try {
      loggedInUser = await _auth.currentUser();
      if (loggedInUser != null) {
        print(loggedInUser.email);
        setState(() {});
      }
    } catch (e) {
      print("ABC");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffdddddd),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffdddddd),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailForm(
                          comingFrom: "profile",
                          firstName: this.firstName,
                          lastName: this.lastName,
                          email: this.email,
                          password: this.password,
                          phoneNumber: this.phoneNumber,
                          downloadURL: this.downloadURL,
                        )));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: NeumorphicIcon(
              Icons.edit,
              //color: Colors.black,
              size: 40,
              style: NeumorphicStyle(
                color: Color(0xff2d2d2d),
                depth: 10,
                intensity: 0.7,
                shadowDarkColor: Colors.black,
              ),
            ),
          ),
          //Icon(Icons.edit),
        ),
        body: getProfileData(),
      ),
    );
  }

  Padding getProfileData() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: NeumorphicText(
                    "Profile",
                    style: NeumorphicStyle(
                      depth: 3,
                      intensity: 0.8,
                      surfaceIntensity: 0.5,
                      shape: NeumorphicShape.flat,
                      color: Color(0xffdddddd),
                      shadowLightColor: Color(0xffdddddd),
                      shadowDarkColor: Colors.black,
                    ),
                    textStyle: NeumorphicTextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto Slab",
                    ),
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Neumorphic(
                      padding: EdgeInsets.all(10),
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.convex,
                        color: Color(0xffdddddd),
                        depth: 5,
                        intensity: 0.7,
                        boxShape: NeumorphicBoxShape.circle(),
                        shadowDarkColor: Colors.black,
                      ),
                      child: NeumorphicIcon(
                        Icons.exit_to_app,
                        //color: Colors.black,
                        size: 40,
                        style: NeumorphicStyle(
                          color: Color(0xff2d2d2d),
                        ),
                      ),
                    ),
                  ),
                ],
            ),
            Flexible(
              child: Neumorphic(
                  drawSurfaceAboveChild: false,
                  style: NeumorphicStyle(
                    depth: 10,
                    surfaceIntensity: 1,
                    color: Color(0xffdddddd),
                    shape: NeumorphicShape.convex,
                    shadowDarkColor: Colors.black,
                    boxShape: NeumorphicBoxShape.circle(),
                  ),
                child: ClipOval(
                  child: downloadURL.isEmpty
                      ? Image.asset("images/placeholder.png")
                      : FadeInImage.assetNetwork(
                          placeholder: "images/placeholder.png",
                          image: downloadURL,
                          fit: BoxFit.fill,
                          height: 200,
                          width: 200,
                        ),
                  ),
                ),
              ),
            SizedBox(
              height: 20.0,
            ),
            NeumorphicText(
              "$firstName $lastName",
              style: NeumorphicStyle(
                depth: 3,
                intensity: 0.8,
                surfaceIntensity: 0.5,
                shape: NeumorphicShape.flat,
                color: Color(0xffdddddd),
                shadowLightColor: Color(0xffdddddd),
                shadowDarkColor: Colors.black,
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: "Roboto Slab",
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Neumorphic(
                    padding: EdgeInsets.all(10),
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.convex,
                      color: Color(0xffdddddd),
                      depth: 5,
                      intensity: 0.7,
                      boxShape: NeumorphicBoxShape.circle(),
                      shadowDarkColor: Colors.black,
                    ),
                    child: NeumorphicIcon(
                      Icons.phone,
                      //color: Colors.black,
                      size: 30,
                      style: NeumorphicStyle(
                        color: Color(0xff2d2d2d),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Neumorphic(
                    padding: EdgeInsets.all(10),
                    style: NeumorphicStyle(
                      depth: 10,
                      shape: NeumorphicShape.convex,
                      intensity: 0.7,
                      shadowDarkColor: Colors.black,
                      boxShape: NeumorphicBoxShape.roundRect(borderRadius),
                      color: Color(0xffdddddd),
                    ),
                    child: NeumorphicText(
                      "$phoneNumber",
                      textStyle: NeumorphicTextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto Slab",
                      ),
                      style: NeumorphicStyle(
                        color: Color(0xff2d2d2d),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Neumorphic(
                    padding: EdgeInsets.all(10),
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.convex,
                      color: Color(0xffdddddd),
                      depth: 5,
                      intensity: 0.7,
                      boxShape: NeumorphicBoxShape.circle(),
                      shadowDarkColor: Colors.black,
                    ),
                    child: NeumorphicIcon(
                      Icons.email,
                      //color: Colors.black,
                      size: 30,
                      style: NeumorphicStyle(
                        color: Color(0xff2d2d2d),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Neumorphic(
                    padding: EdgeInsets.all(10),
                    style: NeumorphicStyle(
                      depth: 10,
                      shape: NeumorphicShape.convex,
                      intensity: 0.7,
                      shadowDarkColor: Colors.black,
                      boxShape: NeumorphicBoxShape.roundRect(borderRadius),
                      color: Color(0xffdddddd),
                    ),
                    child: NeumorphicText(
                      "$email",
                      textStyle: NeumorphicTextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto Slab",
                      ),
                      style: NeumorphicStyle(
                        color: Color(0xff2d2d2d),
                      ),
                    ),
                  ),
                ),
              ],
            ),
//            CustomCard(
//              text: phoneNumber,
//              icon: Icons.phone,
//            ),
//            CustomCard(
//              text: email,
//              icon: Icons.email,
//            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

//  edit(BuildContext context){
//    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailForm(
//      email: this.email,
//      password: this.password,
//      comingFrom: 'home',
//      firstName: this.firstName,
//      lastName: this.lastName,
//      phoneNumber: this.phoneNumber,
//    )));
//  }

  void getUserData() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await _firestore
        .collection('user')
        .document(firebaseUser.uid)
        .get()
        .then((value) {
      print(value.data);

      setState(() {
        this.firstName = value.data['firstName'];
        this.lastName = value.data['lastName'];
        this.email = value.data['email'];
        this.password = value.data['password'];
        this.phoneNumber = value.data['phoneNumber'];
        this.downloadURL = value.data['url'];
      });
    });
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    print(FirebaseAuth.instance.currentUser().toString());
    Navigator.pushReplacementNamed(context, 'welcome_screen');
  }
}
