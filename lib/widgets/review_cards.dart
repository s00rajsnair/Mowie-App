import 'package:flutter/material.dart';
import 'package:mowie/utilities/constants.dart';

class IMDbReviewCard extends StatelessWidget {
  final String reviewData;
  final bool tobeVisible;
  IMDbReviewCard({@required this.reviewData, @required this.tobeVisible});
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: tobeVisible,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        margin: EdgeInsets.only(right: 15),
        child: Card(
          color: Color(0xFFF6C800),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          elevation: 5,
          shadowColor: Color.fromARGB(100, 0, 0, 0),
          child: Container(
            padding: EdgeInsets.all(10),
            width: 140,
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 30,
                  child: Image.asset(
                    'images/imdb.png',
                    scale: 3,
                  ),
                  margin: EdgeInsets.only(bottom: 10),
                ),
                Text(
                  '$reviewData',
                  style: kMovieReviewDataStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RottenTomatoesReviewCard extends StatelessWidget {
  final String reviewData;
  final bool tobeVisible;

  RottenTomatoesReviewCard(
      {@required this.reviewData, @required this.tobeVisible});
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: tobeVisible,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        margin: EdgeInsets.only(right: 15),
        child: Card(
          color: Color(0xFFF23108),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          elevation: 5,
          shadowColor: Color.fromARGB(100, 0, 0, 0),
          child: Container(
            padding: EdgeInsets.all(10),
            width: 140,
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 30,
                  child: Image.asset(
                    'images/rottentomatoes.png',
                    scale: 3,
                  ),
                  margin: EdgeInsets.only(bottom: 10),
                ),
                Text(
                  '$reviewData',
                  style: kMovieReviewDataStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MetaCriticReviewCard extends StatelessWidget {
  final String reviewData;
  final bool tobeVisible;
  MetaCriticReviewCard({@required this.reviewData, @required this.tobeVisible});
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: tobeVisible,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        margin: EdgeInsets.only(right: 15),
        child: Card(
          color: Colors.black87,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          elevation: 5,
          shadowColor: Color.fromARGB(100, 0, 0, 0),
          child: Container(
            padding: EdgeInsets.all(10),
            width: 140,
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 30,
                  child: Image.asset(
                    'images/metacritic.png',
                    scale: 3,
                  ),
                  margin: EdgeInsets.only(bottom: 10),
                ),
                Text(
                  '$reviewData',
                  style: kMovieReviewDataStyle.copyWith(
                    color: Color(0XFFFFCC34),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
