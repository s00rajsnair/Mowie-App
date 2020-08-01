import 'movie-suggestion.dart';

class MovieSuggestionList {
  List<MovieSuggestion> suggestedMovieList = List<MovieSuggestion>();
  MovieSuggestionList({this.suggestedMovieList});

  void clear() {
    suggestedMovieList.clear();
  }

  void add(MovieSuggestion newMovie) {
    suggestedMovieList.add(newMovie);
  }
}
