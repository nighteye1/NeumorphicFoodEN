import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fooden/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  BorderRadius borderRadius = BorderRadius.circular(10);

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();

    controller.addListener(
          () {
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdddddd),
      //backgroundColor: Color(0XFF2e2e2e),
      //backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: Neumorphic(
                    drawSurfaceAboveChild: true,
                    style: NeumorphicStyle(
                      surfaceIntensity: 1,
                      depth: 10,
                      shape: NeumorphicShape.concave,
                      boxShape: NeumorphicBoxShape.circle(),
                    ),
                    child: Hero(
                      tag: "logo",
                      child: Image.asset("images/logo.png"),
                    ),
                  ),
                ),
                NeumorphicText(
                  "FoodEN",
                  textStyle: NeumorphicTextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                    fontFamily: "Roboto Slab",
                  ),
                  style: NeumorphicStyle(
                    color: Color(0xffdddddd),
                    shape: NeumorphicShape.flat,
                    depth: 3,
                    intensity: 0.8,
                    surfaceIntensity: 0.5,
                    lightSource: LightSource.top,
                    shadowDarkColor: Colors.black,
                    shadowLightColor: Color(0xffdddddd),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 55.0,
            ),
            _neuButton("Login"),
            SizedBox(height: 50),

            _neuButton("Register"),
//            SizedBox(height: 10),
//            NeumorphicText(
//              "FLUTTER",
//              textStyle: NeumorphicTextStyle(
//                fontSize: 80,
//                fontWeight: FontWeight.w900,
//                letterSpacing: 1,
//              ),
//              style: NeumorphicStyle(
//                color: Color(0xffdddddd),
//                shape: NeumorphicShape.flat,
//                depth: 2,
//                intensity: 0.8,
//                surfaceIntensity: 0.5,
//              ),
//            ),
          ],
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
        //padding: EdgeInsets.all(10),
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
              fontSize: 40,
              fontWeight: FontWeight.w800,
              fontFamily: "Roboto Slab"
            ),
            style: NeumorphicStyle(
              color: Color(0xffdddddd),
              shape: NeumorphicShape.flat,
              depth: 3,
              intensity: 0.8,
              surfaceIntensity: 0.5,
              boxShape: NeumorphicBoxShape.roundRect(borderRadius),
              shadowDarkColor: Colors.black,
              //shadowLightColor: Color(0xffdddddd),
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
      onTap: (){
        if(text == "Login"){
          Navigator.pushNamed(context, 'login_screen');
        }else{
          Navigator.pushNamed(context, 'registration_screen');
        }
      },
    );
  }
}
