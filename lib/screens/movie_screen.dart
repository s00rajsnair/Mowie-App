import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mowie/utilities/consants.dart';
import 'package:mowie/widgets/movie_detail.dart';

class MovieScreen extends StatefulWidget {
  static String id = "movie_screen";

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://i.pinimg.com/564x/92/c8/e0/92c8e00b34fcfdeaf605a0647c21adb3.jpg'),
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
                      onPressed: () {},
                      child: Text(
                        'Tap to view',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'NotoSans',
                          fontSize: 20,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Avengers: Endgame',
                            style: kMovieNameStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MovieDetailWidget(
                            detailIcon: Icons.scatter_plot,
                            movieDetail: 'Action, Adventure, Drama, Sci-Fi',
                          ),
                          MovieDetailWidget(
                            detailIcon: Icons.access_time,
                            movieDetail: '181 min',
                          ),
                          MovieDetailWidget(
                            detailIcon: Icons.calendar_today,
                            movieDetail: '26 Apr 2019',
                          ),
                          MovieDetailWidget(
                            detailIcon: Icons.language,
                            movieDetail: 'English, Japanese, Xhosa, German',
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
