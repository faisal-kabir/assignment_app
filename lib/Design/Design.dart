import 'package:flutter/material.dart';
import 'package:test_app/Class/Save.dart';

void Show_Snackbar(String data, var key) {
  key.currentState.showSnackBar(SnackBar(
    content: Text(data),
    duration: Duration(seconds: Save.delay),
  ));
}
