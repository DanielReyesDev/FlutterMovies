import 'package:flutter/material.dart';
import 'package:flutter_movies/src/models/movie.dart';

class MoviesHorizontalPageView extends StatelessWidget {

  final List<Movie> movies;

  MoviesHorizontalPageView({ @required this.movies });

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height * 0.2,
      width: _screenSize.width,
      child: PageView(
        children: _cards(),
      ),
    );
  }

  List<Widget> _cards() {
    return movies.map((movie){
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            FadeInImage(
              image: NetworkImage(movie.getPosterImage()),
              placeholder: AssetImage("assets/img/no-image.jpg"),
              fit: BoxFit.cover,
              height: 160,
            )
          ],
        ),
      );
    }).toList();
  }
}