import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String text;
  Message({this.text});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$text',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15,
          fontFamily: 'NotoSans',
        ),
      ),
    );
  }
}
