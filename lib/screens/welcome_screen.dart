import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "welcome_screen.dart";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xFFFF9966),
                        Color(0xFFFF5E62),
                      ], stops: [
                        .3,
                        1
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.1), BlendMode.dstIn),
                          image: AssetImage(
                            'images/doodle.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
