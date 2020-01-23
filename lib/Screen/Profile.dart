import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/Design/Design.dart';
import 'package:test_app/Dimension/Dimension.dart';
import 'package:test_app/Loading_Button/loading_button.dart';
import 'package:test_app/Theme/Themes.dart';
import 'package:test_app/URL/URL.dart';
import 'package:test_app/main.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _formkey_Profile = GlobalKey<FormState>();
  TextEditingController f_name = new TextEditingController();
  TextEditingController l_name = new TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey_Profile =
      new GlobalKey<ScaffoldState>();

  bool button_state = false;
  TextStyle textStyle =
      TextStyle(color: Themes.Text_Color, fontSize: Dimension.Text_Size);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    f_name.text = user['f_name'];
    l_name.text = user['l_name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey_Profile,
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      backgroundColor: Themes.Background,
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Form(
              key: _formkey_Profile,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimension.Padding, right: Dimension.Padding),
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
                                "First Name",
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
                                  controller: f_name,
                                  style: textStyle,
                                  keyboardType: TextInputType.text,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'First Name is Required!';
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
                                'Last Name',
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
                                  controller: l_name,
                                  style: textStyle,
                                  keyboardType: TextInputType.text,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Last Name is Required!';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                FlatButton.icon(
                                    onPressed: () {
                                      LogOut(context);
                                    },
                                    icon: Icon(
                                      Icons.all_out,
                                      color: Themes.Icon_Color,
                                    ),
                                    label: Text(
                                      'LOGOUT',
                                      style: textStyle,
                                    )),
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: Dimension.Padding),
                                  child: LoadingButton(
                                      onPressed: () {
                                        if (_formkey_Profile.currentState
                                            .validate()) {
                                          if (button_state == false) {
                                            button_state = true;
                                            setState(() {});
                                            GO();
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
                                        width: 120,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Update",
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void GO() async {
    var p = await request_Login();

    button_state = false;
    setState(() {});
    Map<String, dynamic> js = p;
    if (js.containsKey('id')) {
      Show_Snackbar('Profile updated successfully', _scaffoldKey_Profile);
      Store(p, p, context);
    }
  }

  Future request_Login() async {
    final response =
        await http.post(URL.Main_Url + 'profileUpdate/${user['id']}', body: {
      'f_name': f_name.text,
      'l_name': l_name.text,
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
  }
}
