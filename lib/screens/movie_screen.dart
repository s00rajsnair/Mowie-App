import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mowie/screens/poster_screen.dart';
import 'package:mowie/utilities/constants.dart';
import 'package:mowie/widgets/movie_detail.dart';
import 'package:mowie/widgets/review_cards.dart';

class MovieScreen extends StatelessWidget {
  static final String id = "movie_screen";
  final movieData;
  List<dynamic> reviewValues;
  bool gotImdbReview = false;
  bool gotRottenTomatoesReview = false;
  bool gotMetaCriticReview = false;
  String imbdValue;
  String rottenTomatoesValue;
  String metaCriticValue;

  MovieScreen({this.movieData});

  void checkWhetherReviewsExist() {
    reviewValues = movieData['Ratings'];
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

  @override
  Widget build(BuildContext context) {
    checkWhetherReviewsExist();
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  if (movieData['Poster'] != 'N/A') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PosterScreen(
                          posterUrl: '${movieData['Poster']}',
                        ),
                      ),
                    );
                  }
                },
                padding: EdgeInsets.all(0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        '${movieData['Poster']}',
                      ),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.darken),
                    ),
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
                        if (movieData['Poster'] != 'N/A') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PosterScreen(
                                posterUrl: '${movieData['Poster']}',
                              ),
                            ),
                          );
                        }
                      },
                      child: Text(
                        (movieData['Poster'] != 'N/A')
                            ? 'Tap to view'
                            : 'Sorry, no poster found',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SourceSansPro',
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                                '${movieData['Title']}',
                                style: kMovieNameStyle,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: MovieDetailWidget(
                                  detailIcon: Icons.scatter_plot,
                                  movieDetail: '${movieData['Genre']}',
                                ),
                              ),
                              MovieDetailWidget(
                                detailIcon: Icons.access_time,
                                movieDetail: '${movieData['Runtime']}',
                              ),
                              MovieDetailWidget(
                                detailIcon: Icons.date_range,
                                movieDetail: '${movieData['Released']}',
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: MovieDetailWidget(
                                  detailIcon: Icons.language,
                                  movieDetail: '${movieData['Language']}',
                                ),
                              ),
                              MovieDetailWidget(
                                detailIcon: Icons.videocam,
                                movieDetail: '${movieData['Director']}',
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: MovieDetailWidget(
                                  detailIcon: Icons.person_outline,
                                  movieDetail: '${movieData['Actors']}',
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
                            visible:
                                (movieData['Plot'] != 'N/A') ? true : false,
                            child: Text(
                              "${movieData['Plot']}",
                              style: kMoviePlotStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            thickness: 1,
                          ),
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
}
