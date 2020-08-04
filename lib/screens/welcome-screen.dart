import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mowie/screens/movie-screen.dart';
import 'package:mowie/screens/search-screen.dart';
import 'package:mowie/utilities/constants.dart';
import 'package:mowie/utilities/fetch-moviedata.dart';
import 'package:mowie/utilities/network-connection.dart';
import 'package:mowie/widgets/snackbar.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "welcome-screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF383E56),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'mowie',
              style: TextStyle(
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
              height: 100,
            ),
            InkWell(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              onTap: () {
                Navigator.pushNamed(context, SearchScreen.id);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
//                    color: Colors.white.withOpacity(0.1),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
