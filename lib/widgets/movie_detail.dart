import 'package:flutter/material.dart';
import 'package:mowie/utilities/constants.dart';

class MovieDetailWidget extends StatelessWidget {
  final String movieDetail;
  final IconData detailIcon;
  MovieDetailWidget({@required this.detailIcon, @required this.movieDetail});
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: (movieDetail != 'N/A') ? true : false,
      child: Container(
        child: Row(
          children: <Widget>[
            Icon(
              detailIcon,
              size: 20,
              color: Colors.redAccent,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '$movieDetail',
              style: kMovieDetailsStyle,
            ),
          ],
        ),
        padding: EdgeInsets.only(bottom: 10),
      ),
    );
  }
}
