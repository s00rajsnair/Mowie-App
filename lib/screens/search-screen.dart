import 'package:flutter/material.dart';
import 'package:mowie/screens/movie_screen.dart';
import 'package:mowie/utilities/constants.dart';
import 'package:mowie/utilities/fetch-moviedata.dart';
import 'package:mowie/utilities/movie-suggestion-list.dart';
import 'package:mowie/utilities/movie-suggestion.dart';
import 'package:mowie/utilities/network-connection.dart';
import 'package:mowie/widgets/movie-suggestion-list-widget.dart';

class SearchScreen extends StatefulWidget {
  static String id = "search-screen.dart";
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String movieName = "";
  var currentMovieData;
  int searchItemCount;
  List<MovieSuggestion> movieResults = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: TextField(
                    enabled: true,
                    autofocus: true,
                    decoration: kInputFieldDecoration,
                    onChanged: (value) {
                      setState(
                        () async {
                          movieName = value;
                          movieName = movieName.replaceAll(',', '%2C');
                          print(movieName);
                          bool connectedToNetwork = await isConnected();
                          if (connectedToNetwork) {
                            var newMovieData =
                                await getSuggestedMovieData(movieName);
                            if (newMovieData['Response'] == "True") {
                              currentMovieData = newMovieData;
                              searchItemCount =
                                  await currentMovieData['Search'].length;
                              print(searchItemCount);
                              movieResults.clear();
                              for (int i = 0; i < searchItemCount; i++) {
                                MovieSuggestion tempMovie = MovieSuggestion(
                                  posterUrl: currentMovieData['Search'][i]
                                      ['Poster'],
                                  movieName: currentMovieData['Search'][i]
                                      ['Title'],
                                  yearOfRelease: currentMovieData['Search'][i]
                                      ['Year'],
                                  imdbId: currentMovieData['Search'][i]
                                      ['imdbID'],
                                );
                                movieResults.add(tempMovie);
                              }
                            }
                          }
                        },
                      );
                    },
                  ),
                ),
                MovieSuggestionListWidget(
                  movieSuggestionList:
                      MovieSuggestionList(suggestedMovieList: movieResults),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
