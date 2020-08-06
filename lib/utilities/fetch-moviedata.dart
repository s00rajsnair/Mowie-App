import 'dart:convert';

import 'package:http/http.dart' as http;

Future getSuggestedMovieData(String movieName) async {
  try {
    String url;
    if (movieName != '') {
      url = 'http://www.omdbapi.com/?apikey=be44b129&s=$movieName&page=1';
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } else {
      return null;
    }
  } catch (e) {
    print(e);
  }
}

Future getSelectedMovieData(String imdbID) async {
  try {
    String url = 'http://www.omdbapi.com/?apikey=be44b129&i=$imdbID';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  } catch (e) {
    print(e);
  }
}
