import 'package:flutter/material.dart';
import 'package:mowie/screens/movie-screen.dart';
import 'package:mowie/utilities/fetch-moviedata.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MovieScreenLoading extends StatefulWidget {
  static String id = 'movie-screen-loading';
  String imdbID;
  MovieScreenLoading({this.imdbID});
  @override
  _MovieScreenLoadingState createState() => _MovieScreenLoadingState();
}

class _MovieScreenLoadingState extends State<MovieScreenLoading> {
  @override
  void initState() {
    super.initState();
    loadSelectedMovieData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          child: Column(
            children: <Widget>[
              Expanded(
                child: SpinKitFadingCircle(
                  color: Colors.redAccent,
                  size: 60.0,
                ),
//                  child: CircularProgressIndicator(
//                    strokeWidth: 5,
//                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
//                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loadSelectedMovieData() async {
    var selectedMovieData = await getSelectedMovieData(widget.imdbID);
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieScreen(
          movieData: selectedMovieData,
        ),
      ),
    );
  }
}
