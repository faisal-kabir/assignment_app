import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/Class/Save.dart';
import 'package:test_app/Route/Route.dart';

import '../main.dart';

class AnimatedSplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((pr) {
      Save.prefs = pr;
    });
    animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1500));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  var _visible = true;

  startTime() async {
    var _duration = new Duration(milliseconds: 3500);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    //Save.prefs.clear();
    if (Save.prefs.containsKey('user')) {
      user = json.decode(Save.prefs.getString('user'));
      Navigator.of(context).pushReplacementNamed(PROFILE);
    } else {
      Navigator.of(context).pushReplacementNamed(LOGIN);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/banner.jpg',
              width: animation.value * 300,
              height: animation.value * 300,
            ),
          ),
        ],
      )),
    );
  }
}
