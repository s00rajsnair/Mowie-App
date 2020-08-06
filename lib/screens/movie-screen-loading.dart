import 'package:flutter/material.dart';
import 'package:mowie/screens/movie-screen.dart';
import 'package:mowie/utilities/fetch-moviedata.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mowie/utilities/network-connection.dart';
import 'package:mowie/widgets/message.dart';
import 'package:mowie/widgets/movie-suggestion-list-widget.dart';

class MovieScreenLoading extends StatefulWidget {
  static String id = 'movie-screen-loading';
  String imdbID;
  MovieScreenLoading({this.imdbID});
  @override
  _MovieScreenLoadingState createState() => _MovieScreenLoadingState();
}

class _MovieScreenLoadingState extends State<MovieScreenLoading> {
  bool networkConnected = true;
  @override
  void initState() {
    super.initState();
    loadSelectedMovieData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF383E56),
      body: Center(
        child: Container(
          height: 200,
          child: Column(
            children: <Widget>[
              Expanded(
                child: (networkConnected)
                    ? SpinKitRipple(
                        color: Color(0XFFDF0054),
                        size: 150.0,
                        borderWidth: 10,
                      )
                    : Message(
                        text:
                            'Not connected to internet.\n Please check your connection.',
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loadSelectedMovieData() async {
    bool connectedToNetwork = await isConnected();
    if (connectedToNetwork) {
      var selectedMovieData = await getSelectedMovieData(widget.imdbID);
      setState(() {
        networkConnected = true;
      });
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieScreen(
            movieData: selectedMovieData,
          ),
        ),
      );
    } else {
      setState(() {
        networkConnected = false;
      });
    }
  }
}
