import 'package:flutter/material.dart';
import 'package:mowie/screens/search-screen.dart';
import 'package:mowie/screens/welcome-screen.dart';

class LandingPage extends StatefulWidget {
  static String id = "landing-screen";
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final controller = PageController(initialPage: 0);
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      children: <Widget>[WelcomeScreen(), SearchScreen()],
    );
  }
}
