import 'package:flutter/material.dart';

const kMovieNameStyle = TextStyle(
  fontFamily: 'NotoSans',
  fontSize: 30,
  fontWeight: FontWeight.bold,
);

const kMovieDetailsStyle = TextStyle(
    fontWeight: FontWeight.bold, fontSize: 15, fontFamily: 'NotoSans');

const kMoviePlotStyle = TextStyle(
    fontFamily: 'NotoSans', letterSpacing: .5, fontWeight: FontWeight.normal);

const kMovieReviewDataStyle = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

const kInputFieldDecoration = InputDecoration(
  isDense: true,
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide(
      color: Color(0xFFe5e5e5),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide(
      color: Color(0xFFe5e5e5),
    ),
  ),
  hintText: 'Enter a movie name ...',
  filled: true,
//  fillColor: Color(0xFFe5e5e5),
  fillColor: Color(0XFF383E56),

  prefixIcon: Icon(
    Icons.search,
    color: Colors.white,
    size: 20,
  ),
);

const kPlaceholderIcon = Icon(
  Icons.local_movies,
  size: 60,
  color: Colors.grey,
);
