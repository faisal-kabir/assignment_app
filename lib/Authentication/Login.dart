import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/Design/Design.dart';
import 'package:test_app/Dimension/Dimension.dart';
import 'package:test_app/Loading_Button/loading_button.dart';
import 'package:test_app/Route/Route.dart';
import 'package:test_app/Theme/Themes.dart';
import 'package:test_app/URL/URL.dart';
import 'package:test_app/main.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Show_Login();
  }
}

class Show_Login extends State<Login> {
  var _formkey_login = GlobalKey<FormState>();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool _obscureText = true;

  final GlobalKey<ScaffoldState> _scaffoldKey_login =
      new GlobalKey<ScaffoldState>();

  bool button_state = false;
  TextStyle textStyle =
      TextStyle(color: Themes.Text_Color, fontSize: Dimension.Text_Size);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        key: _scaffoldKey_login,
        backgroundColor: Themes.Background,
        body: Container(
          padding: EdgeInsets.only(
              left: Dimension.Padding, right: Dimension.Padding),
          child: Center(
              child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Form(
                key: _formkey_login,
                child: Container(
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: Dimension.Padding,
                                    top: Dimension.Padding),
                                child: Text(
                                  "Username",
                                  style: TextStyle(color: Themes.Text_Color),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: Dimension.Padding,
                                    right: Dimension.Padding,
                                    top: 10),
                                padding: EdgeInsets.only(left: 10),
                                decoration: new BoxDecoration(
                                    color: Themes.Primary_Accent.withAlpha(
                                        Dimension.Alpha),
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                  child: TextFormField(
                                    controller: email,
                                    style: textStyle,
                                    keyboardType: TextInputType.text,
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'Username is Required!';
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      suffixIcon: Icon(
                                        Icons.person,
                                        color: Themes.Icon_Color,
                                      ),
                                      errorStyle: TextStyle(
                                          color: Colors.red,
                                          fontSize:
                                              Dimension.Text_Size_Small_Extra),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: Dimension.Padding,
                                    top: Dimension.Padding),
                                child: Text(
                                  'Password',
                                  style: TextStyle(color: Themes.Text_Color),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: Dimension.Padding,
                                    right: Dimension.Padding,
                                    top: 10),
                                padding: EdgeInsets.only(left: 10),
                                decoration: new BoxDecoration(
                                    color: Themes.Primary_Accent.withAlpha(
                                        Dimension.Alpha),
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                  child: TextFormField(
                                    obscureText: _obscureText,
                                    controller: password,
                                    style: textStyle,
                                    keyboardType: TextInputType.text,
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'Password is Required!';
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                        child: Icon(
                                          _obscureText
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          semanticLabel: _obscureText
                                              ? 'show password'
                                              : 'hide password',
                                          color: Themes.Icon_Color,
                                        ),
                                      ),
                                      errorStyle: TextStyle(
                                          color: Colors.red,
                                          fontSize:
                                              Dimension.Text_Size_Small_Extra),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  LoadingButton(
                                      onPressed: () {
                                        if (_formkey_login.currentState
                                            .validate()) {
                                          if (button_state == false) {
                                            button_state = true;
                                            GO();
                                            setState(() {});
                                          }
                                        }
                                      },
                                      backgroundColor: Themes.Primary_Lite,
                                      isLoading: button_state,
                                      loadingWidget: SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.white),
                                          ),
                                        ),
                                      ),
                                      child: Container(
                                        height: 35,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                84,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "SignIn",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: Dimension.Text_Size,
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Themes.Primary_Lite,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Themes.Primary_Lite
                                                    .withAlpha(Dimension.Alpha),
                                                offset: Offset(1, -2),
                                                blurRadius: 5),
                                            BoxShadow(
                                                color: Themes.Primary_Lite
                                                    .withAlpha(Dimension.Alpha),
                                                offset: Offset(-1, 2),
                                                blurRadius: 5)
                                          ])),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                right: Dimension.Padding,
                                bottom: Dimension.Padding,
                                top: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text('Create an Account',
                                    style: TextStyle(
                                        color: Themes.Text_Color,
                                        fontSize:
                                            Dimension.Text_Size_Small_Extra)),
                                Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(SIGNUP);
                                      },
                                      child: Text('Signup',
                                          style: TextStyle(
                                              color: Themes.Primary_Lite,
                                              fontSize:
                                                  Dimension.Text_Size_Small,
                                              fontWeight: FontWeight.bold)),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
        ));
  }

  void GO() async {
    var p = await request_Login();

    button_state = false;
    setState(() {});
    Map<String, dynamic> js = p;
    if (js.containsKey('error')) {
      Show_Snackbar(p['error'], _scaffoldKey_login);
    } else {
      Store(p['user'], p, context);
    }
  }

  Future request_Login() async {
    final response = await http.post(URL.Main_Url + 'login', body: {
      'username': email.text,
      'password': password.text,
    });
    print(response.body.toString());
    return json.decode(response.body);
  }

  Store(var data, var p, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', json.encode(data));
    user = data;

    button_state = false;
    setState(() {});
    Navigator.of(context)
        .pushNamedAndRemoveUntil(PROFILE, (Route<dynamic> route) => false);
  }
}
