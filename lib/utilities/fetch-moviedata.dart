import 'dart:convert';

import 'package:http/http.dart' as http;

Future getMovieData(String movieName) async {
  try {
    String url = 'http://www.omdbapi.com/?apikey=be44b129&t=$movieName';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  } catch (e) {
    print(e);
  }
}

Future getSuggestedMovieData(String movieName) async {
  try {
    String url = 'http://www.omdbapi.com/?apikey=be44b129&s=$movieName&page=1';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  } catch (e) {
    print(e);
  }
}
