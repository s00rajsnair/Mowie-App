import 'package:flutter/material.dart';
import 'package:mowie/screens/movie_screen.dart';
import 'package:mowie/utilities/constants.dart';
import 'package:mowie/utilities/fetch-moviedata.dart';
import 'package:mowie/utilities/network-connection.dart';
import 'package:mowie/widgets/snackbar.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "welcome_screen.dart";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String moviename = '';
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Stack(
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
          Container(
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
          Positioned(
            top: 250,
            child: Column(
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
                  height: 10,
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextField(
                    enabled: true,
                    autofocus: true,
                    decoration: kInputFieldDecoration,
                    onChanged: (value) {
                      moviename = value;
                      moviename = moviename.replaceAll(',', '%2C');
                      print(moviename);
                    },
                  ),
                ),
                MaterialButton(
                  child: Container(
                    height: 50,
                    width: 140,
                    child: Center(
                      child: Text(
                        'Search',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    bool connectedToNetwork = await isConnected();
                    if (connectedToNetwork) {
                      var newMovieData = await getMovieData(moviename);
                      if (newMovieData['Response'] == 'False') {
                        displaySnackBar(
                            'Movie not found', context, _scaffoldKey);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieScreen(
                              movieData: newMovieData,
                            ),
                          ),
                        );
                      }
                    } else {
                      displaySnackBar('Please check your internet connection',
                          context, _scaffoldKey);
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
