import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mowie/utilities/constants.dart';
import 'package:mowie/utilities/fetch-moviedata.dart';
import 'package:mowie/utilities/movie-suggestion-list.dart';

import '../screens/movie_screen.dart';

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
          return InkWell(
            onTap: () async {
              print("clicked $position");
              var selectedMovieData = await getSelectedMovieData(widget
                  .movieSuggestionList.suggestedMovieList[position].imdbId);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieScreen(
                    movieData: selectedMovieData,
                  ),
                ),
              );
            },
            child: Container(
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 1),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Color(0xFFececec),
              ),
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
