import 'package:flutter/material.dart';
import 'package:mowie/utilities/constants.dart';
import 'package:mowie/utilities/fetch-moviedata.dart';
import 'package:mowie/utilities/movie-suggestion-list.dart';
import 'package:mowie/utilities/movie-suggestion.dart';
import 'package:mowie/utilities/network-connection.dart';
import 'package:mowie/widgets/movie-suggestion-list-widget.dart';

class SearchScreen extends StatefulWidget {
  static String id = "search-screen";
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String movieName;
  List<MovieSuggestion> movieResults = [];
  bool isMovieDataLoading = false;
  bool networkConnected = true;
  bool isUserTyping = false;
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx > 0) {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
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
                    controller: myController,
                    cursorColor: Colors.white,
                    enabled: true,
                    autofocus: true,
                    decoration: kInputFieldDecoration.copyWith(
                      suffix: Container(
                        height: 19,
                        child: Visibility(
                          visible: isUserTyping,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                movieName = '';
                                myController.text = '';
                                movieResults = [];
                                isUserTyping = false;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              child: Icon(
                                Icons.close,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      setState(
                        () {
                          isUserTyping = true;
                          value = value.replaceAll(',', '%2C');
                          movieName = value;
                          if (movieName == '' ||
                              movieName == null ||
                              value == null) {
                            setState(() {
                              movieResults = [];
                              isUserTyping = false;
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
                  movieName: movieName,
                  isLoading: isMovieDataLoading,
                  networkConnected: networkConnected,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setDetails() async {
    setState(() {
      isMovieDataLoading = true;
    });
    bool connectedToNetwork = await isConnected();
    if (connectedToNetwork) {
      setState(() {
        networkConnected = true;
      });
      if (movieName != null) {
        var newMovieData = await getSuggestedMovieData(
          movieName.trim(),
        );
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
    } else {
      setState(() {
        networkConnected = false;
      });
    }
    setState(() {
      movieName = movieName;
      isMovieDataLoading = false;
    });
  }
}
