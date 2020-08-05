import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mowie/screens/search-screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:mowie/utilities/constants.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "welcome-screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF383E56),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 300,
            ),
            TyperAnimatedTextKit(
              speed: Duration(milliseconds: 200),
              text: ['mowie'],
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontFamily: 'SourceSansPro',
                shadows: [
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 5.0,
                    color: Color.fromARGB(50, 0, 0, 0),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Container(
                width: 150,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.all(color: Colors.white)
//                    color: Colors.white.withOpacity(0.1),
                    ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Swipe Left ',
                        style: TextStyle(fontFamily: 'NotoSans', fontSize: 15),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 15,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
