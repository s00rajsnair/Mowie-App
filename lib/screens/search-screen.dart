import 'package:flutter/material.dart';
import 'package:mowie/utilities/constants.dart';
import 'package:mowie/utilities/fetch-moviedata.dart';
import 'package:mowie/utilities/movie-suggestion-list.dart';
import 'package:mowie/utilities/movie-suggestion.dart';
import 'package:mowie/utilities/network-connection.dart';
import 'package:mowie/widgets/movie-suggestion-list-widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchScreen extends StatefulWidget {
  static String id = "search-screen";
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String movieName;
  List<MovieSuggestion> movieResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('search'),
      backgroundColor: Color(0XFF383E56),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: TextField(
                  cursorColor: Colors.white,
                  enabled: true,
                  autofocus: true,
                  decoration: kInputFieldDecoration,
                  onChanged: (value) {
                    setState(
                      () {
                        value = value.replaceAll(',', '%2C');
                        movieName = value;
                        if (movieName == '' ||
                            movieName == null ||
                            value == null) {
                          setState(() {
                            movieResults = [];
                          });
                        } else {
                          setDetails();
                        }
                      },
                    );
                  },
                ),
              ),
              MovieSuggestionListWidget(
                movieSuggestionList:
                    MovieSuggestionList(suggestedMovieList: movieResults),
                moviename: movieName,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setDetails() async {
    bool connectedToNetwork = await isConnected();
    if (connectedToNetwork) {
      if (movieName != null) {
        var newMovieData = await getSuggestedMovieData(movieName);
        if (newMovieData['Response'] == "True") {
          movieResults.clear();
          for (int i = 0; i < newMovieData['Search'].length; i++) {
            MovieSuggestion tempMovie = MovieSuggestion(
              posterUrl: newMovieData['Search'][i]['Poster'],
              movieName: newMovieData['Search'][i]['Title'],
              yearOfRelease: newMovieData['Search'][i]['Year'],
              imdbId: newMovieData['Search'][i]['imdbID'],
            );
            movieResults.add(tempMovie);
          }
        }
      }
    }
    setState(() {
      movieName = movieName;
      movieResults = movieResults;
    });
  }
}
