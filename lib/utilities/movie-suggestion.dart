import 'package:flutter/cupertino.dart';

class MovieSuggestion {
  final String posterUrl;
  final String movieName;
  final String yearOfRelease;
  final String imdbId;

  MovieSuggestion({
    @required this.posterUrl,
    @required this.movieName,
    @required this.yearOfRelease,
    @required this.imdbId,
  });
}
