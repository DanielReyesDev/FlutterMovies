import 'package:flutter/material.dart';
import 'package:flutter_movies/src/pages/home_page.dart';
import 'package:flutter_movies/src/pages/movie_details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Movies",
      initialRoute: "/",
      routes: {
        "/" : (BuildContext context) => HomePage(),
        "details" : (BuildContext context) => MovieDetailsPage(),
      },
    );
  }
}