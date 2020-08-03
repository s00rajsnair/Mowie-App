import 'package:flutter/material.dart';
import 'package:mowie/utilities/constants.dart';

class ReviewCard extends StatelessWidget {
  final String reviewData;
  final bool tobeVisible;
  final String reviewCompany;
  final Color backgroundColor1;
  final Color backgroundColor2;
  ReviewCard({
    @required this.reviewData,
    @required this.tobeVisible,
    @required this.reviewCompany,
    @required this.backgroundColor1,
    @required this.backgroundColor2,
  });
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: tobeVisible,
      child: Container(
        width: 140,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        margin: EdgeInsets.symmetric(horizontal: 7.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [backgroundColor1, backgroundColor2],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 30,
              child: Image.asset(
                'images/$reviewCompany.png',
              ),
              margin: EdgeInsets.only(bottom: 10),
            ),
            Text(
              '$reviewData',
              style: kMovieReviewDataStyle.copyWith(
                color: (reviewCompany == 'imdb')
                    ? Colors.black
                    : (reviewCompany == 'rottentomatoes')
                        ? Colors.white
                        : Color(0xFFFFCC34),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
