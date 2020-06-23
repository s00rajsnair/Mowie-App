import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/movie_screen.dart';

void main() {
  runApp(MowieApp());
}

class MowieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        MovieScreen.id: (context) => MovieScreen(),
      },
    );
  }
}
