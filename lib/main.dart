import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/Authentication/Registration.dart';

import 'Authentication/Login.dart';
import 'Class/Save.dart';
import 'Route/Custom_Transaction.dart';
import 'Route/Route.dart';
import 'Screen/Profile.dart';
import 'Screen/Splash_screen.dart';
import 'Theme/Themes.dart';

void main() => runApp(MyApp());
var user;

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Show_MyApp();
  }
}

class Show_MyApp extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Themes.Primary,
        accentColor: Themes.Primary_Lite,
        primaryColorDark: Themes.Primary,
        primaryColorLight: Themes.Primary_Lite,
        backgroundColor: Themes.Background,
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: Custom_SizeTransition(),
          TargetPlatform.android: Custom_SizeTransition(),
        }),
      ),
      routes: <String, WidgetBuilder>{
        LOGIN: (BuildContext context) => Login(),
        SIGNUP: (BuildContext context) => Registration(),
        SPLASH: (BuildContext context) => AnimatedSplashScreen(),
        PROFILE: (BuildContext context) => Profile(),
      },
      initialRoute: SPLASH,
    );
  }
}

Future<bool> LogOut(BuildContext context) async {
  await Save.prefs.clear();
  Navigator.of(context, rootNavigator: true).pushNamed(LOGIN);
  return true;
}
