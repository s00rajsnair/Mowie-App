import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mowie/screens/poster-screen.dart';
import 'package:mowie/utilities/constants.dart';
import 'package:mowie/utilities/conversion.dart';
import 'package:mowie/widgets/movie-detail.dart';
import 'package:mowie/widgets/review-card.dart';

class MovieScreen extends StatefulWidget {
  static final String id = "movie-screen";
  final movieData;

  MovieScreen({this.movieData});

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  List<dynamic> reviewValues;

  bool gotImdbReview = false;

  bool gotRottenTomatoesReview = false;

  bool gotMetaCriticReview = false;

  String imbdValue;

  String rottenTomatoesValue;

  String metaCriticValue;
  @override
  void initState() {
    super.initState();
    widget.movieData['Runtime'] =
        changeRuntimeFormat(widget.movieData['Runtime']);
    checkWhetherReviewsExist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            FlatButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                viewPoster();
              },
              padding: EdgeInsets.all(0),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      '${widget.movieData['Poster']}',
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 150,
                  child: Center(
                    child: MaterialButton(
                      onPressed: () {
                        viewPoster();
                      },
                      child: Text(
                        (widget.movieData['Poster'] != 'N/A')
                            ? 'Tap to view'
                            : 'No poster available',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFF383E56),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: ListView(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${widget.movieData['Title']}',
                                style: kMovieNameStyle,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: MovieDetailWidget(
                                  detailIcon: Icons.scatter_plot,
                                  movieDetail: '${widget.movieData['Genre']}',
                                ),
                              ),
                              MovieDetailWidget(
                                detailIcon: Icons.access_time,
                                movieDetail: '${widget.movieData['Runtime']}',
                              ),
                              MovieDetailWidget(
                                detailIcon: Icons.date_range,
                                movieDetail: '${widget.movieData['Released']}',
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: MovieDetailWidget(
                                  detailIcon: Icons.language,
                                  movieDetail:
                                      '${widget.movieData['Language']}',
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: MovieDetailWidget(
                                  detailIcon: Icons.videocam,
                                  movieDetail:
                                      '${widget.movieData['Director']}',
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: MovieDetailWidget(
                                  detailIcon: Icons.person_outline,
                                  movieDetail: '${widget.movieData['Actors']}',
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                          Visibility(
                            visible: gotMetaCriticReview ||
                                gotRottenTomatoesReview ||
                                gotImdbReview,
                            child: Container(
                              padding: EdgeInsets.only(bottom: 20),
                              height: 180,
                              child: ListView(
                                padding: EdgeInsets.only(bottom: 20),
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  ReviewCard(
                                    reviewCompany: 'imdb',
                                    tobeVisible: gotImdbReview,
                                    reviewData: '$imbdValue',
                                    backgroundColor1: Colors.yellow,
                                    backgroundColor2: Color(0xFFF6C800),
                                  ),
                                  ReviewCard(
                                    reviewCompany: 'rottentomatoes',
                                    tobeVisible: gotRottenTomatoesReview,
                                    reviewData: '$rottenTomatoesValue',
                                    backgroundColor1: Colors.pinkAccent,
                                    backgroundColor2: Colors.red,
                                  ),
                                  ReviewCard(
                                    reviewCompany: 'metacritic',
                                    tobeVisible: gotMetaCriticReview,
                                    reviewData: '$metaCriticValue',
                                    backgroundColor1: Colors.blueGrey,
                                    backgroundColor2: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: (widget.movieData['Plot'] != 'N/A')
                                ? true
                                : false,
                            child: Text(
                              "${widget.movieData['Plot']}",
                              style: kMoviePlotStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
//                          SizedBox(
//                            height: 20,
//                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void checkWhetherReviewsExist() {
    reviewValues = widget.movieData['Ratings'];
    print(reviewValues.length);
    for (int i = 0; i < reviewValues.length; i++) {
      if (reviewValues[i]['Source'] == 'Internet Movie Database') {
        gotImdbReview = true;
        imbdValue = reviewValues[i]['Value'];
      } else if (reviewValues[i]['Source'] == 'Rotten Tomatoes') {
        gotRottenTomatoesReview = true;
        rottenTomatoesValue = reviewValues[i]['Value'];
      } else if (reviewValues[i]['Source'] == 'Metacritic') {
        gotMetaCriticReview = true;
        metaCriticValue = reviewValues[i]['Value'];
      }
    }
  }

  void viewPoster() {
    if (widget.movieData['Poster'] != 'N/A') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PosterScreen(
            posterUrl: '${widget.movieData['Poster']}',
          ),
        ),
      );
    }
  }
}
