import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooden/components/rounded_button.dart';
import 'package:fooden/constants.dart';
import 'package:fooden/screens/alert_dialog_with_message.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";

  bool isValidPassword = true;
  bool showSpinner = false;

  double firstOffset = 5.0;
  double secondOffset = -5.0;

  BorderRadius borderRadius = BorderRadius.circular(20);

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFDDDDDD),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Container(
                  height: 200.0,
                  child: Neumorphic(
                    drawSurfaceAboveChild: true,
                    style: NeumorphicStyle(
                      depth: 10,
                      surfaceIntensity: 1,
                      color: Color(0xffdddddd),
                      shape: NeumorphicShape.convex,
                      boxShape: NeumorphicBoxShape.circle(),
                    ),
                    child: Hero(
                      tag: "logo",
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              Neumorphic(
                style: NeumorphicStyle(
                  color: Color(0XffDDDDDD),
                  depth: -10,
                  intensity: 0.2,
                  surfaceIntensity: 0.1,
                  boxShape: NeumorphicBoxShape.roundRect(borderRadius),
                  shape: NeumorphicShape.convex,
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Enter Your Email",
                      counterText: "",
                      errorText: isValidPassword
                          ? null
                          : "Please Enter password between 6-30 characters",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: "Roboto Slab",
                      ),
                      filled: true,
                      fillColor: Color(0xffB3B9BA)
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: "Roboto Slab",
                  ),
                  cursorColor: Colors.white,
                  onChanged: (value){
                    email = value;
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
//              TextField(
//                onChanged: (value) {
//                  email = value;
//                },
//                textAlign: TextAlign.center,
//                decoration: kInputDecoration,
//                keyboardType: TextInputType.emailAddress,
//              ),
              SizedBox(
                height: 8.0,
              ),
              Neumorphic(
                style: NeumorphicStyle(
                  color: Color(0XffDDDDDD),
                  depth: -10,
                  intensity: 0.2,
                  surfaceIntensity: 0.1,
                  boxShape: NeumorphicBoxShape.roundRect(borderRadius),
                  shape: NeumorphicShape.convex,
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Enter Your Password",
                      counterText: "",
                      errorText: isValidPassword
                          ? null
                          : "Please Enter password between 6-30 characters",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: "Roboto Slab",
                      ),
                      filled: true,
                      fillColor: Color(0xffB3B9BA)
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: "Roboto Slab",
                  ),
                  cursorColor: Colors.white,
                  onChanged: (value){
                    password = value;
                  },
                  textAlign: TextAlign.center,
                  obscureText: true,
                  maxLength: 30,
                  maxLengthEnforced: true,
                ),
              ),
              SizedBox(height: 8),
//              TextField(
//                onChanged: (value) {
//                  password = value;
//                },
//                textAlign: TextAlign.center,
//                obscureText: true,
//                maxLength: 30,
//                maxLengthEnforced: true,
//                decoration: kInputDecoration.copyWith(
//                  hintText: "Enter Your Password",
//                  errorText: isValidPassword
//                      ? null
//                      : "Please Enter password between 6-30 characters",
//                ),
//              ),
              SizedBox(
                height: 24.0,
              ),
              _neuButton("Login"),
//              RoundedButton(
//                text: "Login",
//                color: Colors.lightBlueAccent,
//                onPressed: () async {
//                  if (password.length < 6) {
//                    setState(() {
//                      isValidPassword = false;
//                    });
//                    return;
//                  }
//                  setState(() {
//                    showSpinner = true;
//                  });
//                  try {
//                    final newUser = await _auth.signInWithEmailAndPassword(
//                      email: this.email,
//                      password: this.password,
//                    );
//                    if (newUser != null) {
//                      Navigator.pushNamed(context, 'home_screen');
//                    }
//                    setState(() {
//                      showSpinner = false;
//                    });
//                  } catch (e) {
//                    setState(() {
//                      showSpinner = false;
//                    });
//                    await showDialog(
//                      context: context,
//                      builder: (context) => AlertDialogWithMessage(
//                        title: "Register Exception",
//                        message: 'Message: ${e.message}',
//                      ),
//                    );
//                    Navigator.pop(context);
//                  }
//                },
//              ),
//              SizedBox(height: 5),
//              Neumorphic(
//                style: NeumorphicStyle(
//                  color: Color(0XffDDDDDD),
//                  depth: -10,
//                  intensity: 0.2,
//                  surfaceIntensity: 0.1,
//                  boxShape: NeumorphicBoxShape.roundRect(borderRadius),
//                  shape: NeumorphicShape.convex,
//                ),
//                child: TextField(
//                  decoration: InputDecoration(
//                    border: UnderlineInputBorder(
//                      borderSide: BorderSide.none,
//                    ),
//                    hintText: "Enter",
//                    hintStyle: TextStyle(
//                      color: Colors.white,
//                      fontWeight: FontWeight.bold,
//                      fontSize: 20,
//                    ),
//                    filled: true,
//                    fillColor: Color(0xffB3B9BA)
//                  ),
//                  style: TextStyle(
//                    color: Colors.white,
//                  ),
//                  cursorColor: Colors.white,
//                ),
//              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _neuButton(String text) {
    double width;
    if(text == "Register"){
      width = 200;
    }else{
      width = 150;
    }
    return GestureDetector(
      child: Neumorphic(
        style: NeumorphicStyle(
          depth: 10,
          shape: NeumorphicShape.flat,
          intensity: 0.7,
          surfaceIntensity: 0.1,
          shadowDarkColor: Colors.black,
          boxShape: NeumorphicBoxShape.roundRect(borderRadius),
          color: Color(0xffdddddd),
        ),
        child: Center(
          child: NeumorphicText(
            text,
            textStyle: NeumorphicTextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              fontFamily: "Roboto Slab",
            ),
            style: NeumorphicStyle(
              color: Color(0xffdddddd),
              shape: NeumorphicShape.flat,
              depth: 3,
              intensity: 0.8,
              surfaceIntensity: 0.5,
              boxShape: NeumorphicBoxShape.roundRect(borderRadius),
              shadowDarkColor: Colors.black,
              shadowLightColor: Color(0xffdddddd),
            ),
          ),
//            Text(
//              text,
//              style: TextStyle(
//                color: Colors.white38,
//                fontSize: 15,
//                fontWeight: FontWeight.bold,
//              ),
//            ),
        ),
      ),
      onTap: () async {
        if (password.length < 6) {
          setState(() {
            isValidPassword = false;
          });
          return;
        }
        setState(() {
          showSpinner = true;
        });
        try {
          final newUser = await _auth.signInWithEmailAndPassword(
            email: this.email,
            password: this.password,
          );
          if (newUser != null) {
            Navigator.pushNamed(context, 'home_screen');
          }
          setState(() {
            showSpinner = false;
          });
        } catch (e) {
          setState(() {
            showSpinner = false;
          });
          await showDialog(
            context: context,
            builder: (context) => AlertDialogWithMessage(
              title: "Register Exception",
              message: 'Message: ${e.message}',
            ),
          );
          Navigator.pop(context);
        }
      },
    );
  }
}
