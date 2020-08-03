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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextField(
                    cursorColor: Colors.black,
                    enabled: true,
                    autofocus: true,
                    decoration: kInputFieldDecoration,
                    onChanged: (value) {
                      setState(
                        () {
                          value = value.replaceAll(',', '%2C');
                          movieName = value;
                          if (movieName == '' || movieName == null) {
                            setState(() {
                              movieResults = [];
                            });
                          } else {
                            print(movieName);
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
      ),
    );
  }

  void setDetails() async {
    bool connectedToNetwork = await isConnected();
    if (connectedToNetwork) {
      if (movieName != null) {
        print(movieName);
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
            print(tempMovie.movieName);
          }
        }
      }
    }
    setState(() {
      movieName += ' ';
      movieName = movieName.trim();
    });
  }
}
