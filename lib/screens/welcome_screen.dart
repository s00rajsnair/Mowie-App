import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mowie/screens/movie_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "welcome_screen.dart";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String moviename = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    top: 260,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              'mowie',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SourceSansPro',
                                shadows: [
                                  Shadow(
                                    offset: Offset(0, 1),
                                    blurRadius: 5.0,
                                    color: Color.fromARGB(50, 0, 0, 0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 70,
                            width: 300,
                            child: TextField(
                              enabled: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100.0)),
                                  borderSide: BorderSide(
                                    color: Colors.black54,
                                    width: 1,
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100.0),
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 0),
                                hintText: 'Enter a movie name ...',
                                hintStyle: TextStyle(
                                  color: Colors.black38,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                              ),
                              onChanged: (value) {
                                moviename = value;
                              },
                            ),
//                            margin: EdgeInsets.all(0),
                          ),
                          MaterialButton(
                            child: Container(
                              height: 50,
                              width: 140,
                              child: Center(
                                child: Text(
                                  'Enter',
                                  style: TextStyle(color: Colors.white),
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
                              var newMovieData = await getMovieData(moviename);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieScreen(
                                    movieData: newMovieData,
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getMovieData(String moviename) async {
    try {
      String url = 'http://www.omdbapi.com/?apikey=be44b129&t=$moviename';
      var response = await http.get(url);
      if (response.statusCode == 200) {
//        for (int i = 0; i < 3; i++) {
//          try {
//            print(map.containsKey(['Ratings'][i][0]));
//          } catch (e) {
//            print('false$i');
//          }
//        }
        return jsonDecode(response.body);
      }
//    print(response.statusCode.toString());
//    print(response.body.toString());
    } catch (e) {
      print(e);
    }
  }
}
