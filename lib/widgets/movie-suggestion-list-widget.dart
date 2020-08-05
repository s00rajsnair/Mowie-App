import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mowie/screens/movie-screen-loading.dart';
import 'package:mowie/utilities/constants.dart';
import 'package:mowie/utilities/movie-suggestion-list.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MovieSuggestionListWidget extends StatefulWidget {
  MovieSuggestionList movieSuggestionList = MovieSuggestionList();
  String movieName;
  bool isLoading;
  bool networkConnected;
  MovieSuggestionListWidget(
      {this.movieSuggestionList,
      this.movieName,
      this.isLoading,
      this.networkConnected});
  @override
  _MovieSuggestionListWidgetState createState() =>
      _MovieSuggestionListWidgetState();
}

class _MovieSuggestionListWidgetState extends State<MovieSuggestionListWidget> {
  bool moviesFound = false;
  @override
  Widget build(BuildContext context) {
    if (widget.movieSuggestionList.suggestedMovieList.length > 0)
      moviesFound = true;
    else
      moviesFound = false;
    return Expanded(
      child: (widget.networkConnected)
          ? (widget.isLoading)
              ? SpinKitDualRing(
                  size: 50,
                  color: Colors.grey,
                  lineWidth: 3,
                )
              : (moviesFound)
                  ? ListView.builder(
                      itemBuilder: (context, position) {
                        return Container(
                          height: 100,
                          margin: EdgeInsets.only(bottom: 1),
                          decoration: BoxDecoration(
                            color: Color(0XFF383E56),
                            border: Border(
                              bottom:
                                  BorderSide(color: Colors.white, width: .3),
                            ),
                          ),
                          child: FlatButton(
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieScreenLoading(
                                    imdbID: widget.movieSuggestionList
                                        .suggestedMovieList[position].imdbId,
                                  ),
                                ),
                              );
                            },
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: ClipRRect(
                                        clipBehavior: Clip.hardEdge,
                                        child: (widget
                                                    .movieSuggestionList
                                                    .suggestedMovieList[
                                                        position]
                                                    .posterUrl !=
                                                "N/A")
                                            ? Image.network(
                                                '${widget.movieSuggestionList.suggestedMovieList[position].posterUrl}',
                                                width: 60,
                                              )
                                            : kPlaceholderIcon,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                      margin: EdgeInsets.only(right: 15),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Wrap(
                                          direction: Axis.vertical,
                                          children: <Widget>[
                                            Text(
                                              '${widget.movieSuggestionList.suggestedMovieList[position].movieName}',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'NotoSans',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '${widget.movieSuggestionList.suggestedMovieList[position].yearOfRelease}',
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: (widget.movieSuggestionList.suggestedMovieList
                                  .length ==
                              null)
                          ? 0
                          : widget
                              .movieSuggestionList.suggestedMovieList.length,
                    )
                  : Message(
                      text:
                          'No movie found \n(Please make sure that you have entered \natleast three characters of the movie name)')
          : Message(
              text:
                  'Not connected to internet.\n Please check your connection.',
            ),
    );
  }
}

class Message extends StatelessWidget {
  final String text;
  Message({this.text});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$text',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15,
          fontFamily: 'NotoSans',
        ),
      ),
    );
  }
}
