import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mowie/screens/movie-screen-loading.dart';
import 'package:mowie/screens/search-screen.dart';
import 'screens/welcome-screen.dart';
import 'screens/movie-screen.dart';

void main() {
  runApp(MowieApp());
}

class MowieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        MovieScreen.id: (context) => MovieScreen(),
        SearchScreen.id: (context) => SearchScreen(),
        MovieScreenLoading.id: (context) => MovieScreenLoading(),
      },
    );
  }
}
