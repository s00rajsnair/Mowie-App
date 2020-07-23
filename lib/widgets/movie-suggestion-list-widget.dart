import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mowie/screens/movie_screen.dart';
import 'package:mowie/utilities/movie-suggestion-list.dart';
import 'package:mowie/utilities/movie-suggestion.dart';

class MovieSuggestionListWidget extends StatefulWidget {
  MovieSuggestionList movieSuggestionList = MovieSuggestionList();
  MovieSuggestionListWidget({this.movieSuggestionList});
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
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieScreen(
                    movieData:
                        widget.movieSuggestionList.suggestedMovieList[position],
                  ),
                ),
              );
            },
            child: Card(
              color: Colors.grey.withOpacity(0.1),
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: ClipRRect(
                          child: (widget.movieSuggestionList
                                      .suggestedMovieList[position].posterUrl !=
                                  "N/A")
                              ? Image.network(
                                  '${widget.movieSuggestionList.suggestedMovieList[position].posterUrl}',
                                  scale: 5,
                                )
                              : Text('Poster Not Found'),
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        margin: EdgeInsets.only(right: 15),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${widget.movieSuggestionList.suggestedMovieList[position].movieName}',
                            style: TextStyle(
                              fontSize: 15,
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
                ),
              ),
            ),
          );
        },
        itemCount: widget.movieSuggestionList.suggestedMovieList.length,
      ),
    );
  }
}
