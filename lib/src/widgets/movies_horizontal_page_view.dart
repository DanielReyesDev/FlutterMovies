import 'package:flutter/material.dart';
import 'package:flutter_movies/src/models/movie.dart';

class MoviesHorizontalPageView extends StatelessWidget {

  final List<Movie> movies;

  MoviesHorizontalPageView({ @required this.movies });

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height * 0.25,
      width: _screenSize.width,
      child: PageView(
        pageSnapping: false,
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3
        ),
        children: _cards(context),
      ),
    );
  }

  List<Widget> _cards(BuildContext context) {
    return movies.map((movie){
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(movie.getPosterImage()),
                placeholder: AssetImage("assets/img/no-image.jpg"),
                fit: BoxFit.cover,
                height: 160,
              ),
            ),
            SizedBox(height: 5.0,),
            Text(
              movie.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      );
    }).toList();
  }
}