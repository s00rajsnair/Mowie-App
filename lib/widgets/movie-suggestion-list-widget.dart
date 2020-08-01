import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mowie/utilities/constants.dart';
import 'package:mowie/utilities/movie-suggestion-list.dart';

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
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => MovieScreen(
//                    movieData:
//                        widget.movieSuggestionList.suggestedMovieList[position],
//                  ),
//                ),
//              );
            },
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 100,
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
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
