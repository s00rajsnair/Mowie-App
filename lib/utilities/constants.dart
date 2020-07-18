import 'package:flutter/material.dart';

const kMovieNameStyle = TextStyle(
  fontFamily: 'NotoSans',
  fontSize: 30,
  fontWeight: FontWeight.bold,
);

const kMovieDetailsStyle = TextStyle(
  color: Colors.grey,
  fontWeight: FontWeight.bold,
  fontSize: 15,
);

const kMoviePlotStyle = TextStyle(
    fontFamily: 'NotoSans', letterSpacing: .5, fontWeight: FontWeight.normal);

const kMovieReviewDataStyle = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

const kInputFieldDecoration = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(100.0),
    ),
    borderSide: BorderSide(
      color: Colors.black,
    ),
  ),
  contentPadding: EdgeInsets.symmetric(
    vertical: 0,
  ),
  hintText: 'Enter a movie name ...',
  hintStyle: TextStyle(
    color: Colors.black38,
    fontSize: 15,
  ),
  filled: true,
  fillColor: Colors.white,
  prefixIcon: Icon(
    Icons.search,
    color: Colors.black,
  ),
);
