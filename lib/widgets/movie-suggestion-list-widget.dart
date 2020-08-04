import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mowie/screens/movie-screen-loading.dart';
import 'package:mowie/utilities/constants.dart';
import 'package:mowie/utilities/movie-suggestion-list.dart';

class MovieSuggestionListWidget extends StatefulWidget {
  MovieSuggestionList movieSuggestionList = MovieSuggestionList();
  String moviename;
  MovieSuggestionListWidget({this.movieSuggestionList, this.moviename});
  @override
  _MovieSuggestionListWidgetState createState() =>
      _MovieSuggestionListWidgetState();
}

class _MovieSuggestionListWidgetState extends State<MovieSuggestionListWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, position) {
          return Container(
            height: 100,
            margin: EdgeInsets.only(bottom: 1),
            decoration: BoxDecoration(
              color: Color(0XFF383E56),
              border: Border(
                bottom: BorderSide(color: Colors.white, width: .3),
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
                          child: (widget.movieSuggestionList
                                      .suggestedMovieList[position].posterUrl !=
                                  "N/A")
                              ? Image.network(
                                  '${widget.movieSuggestionList.suggestedMovieList[position].posterUrl}',
                                  width: 60,
                                )
                              : kPlaceholderIcon,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        margin: EdgeInsets.only(right: 15),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
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
        itemCount:
            (widget.movieSuggestionList.suggestedMovieList.length == null)
                ? 0
                : widget.movieSuggestionList.suggestedMovieList.length,
      ),
    );
  }
}
