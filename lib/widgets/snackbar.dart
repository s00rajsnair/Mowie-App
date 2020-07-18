import 'package:flutter/material.dart';

displaySnackBar(String message, BuildContext context, var scaffoldKey) {
  final snackBar = SnackBar(
    content: Text('$message'),
    duration: Duration(seconds: 1),
  );
  scaffoldKey.currentState.showSnackBar(snackBar);
}
