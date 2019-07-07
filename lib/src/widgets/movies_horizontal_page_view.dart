import 'package:flutter/material.dart';
import 'package:flutter_movies/src/models/movie.dart';

class MoviesHorizontalPageView extends StatelessWidget {

  final List<Movie> movies;
  final Function nextPage;

  MoviesHorizontalPageView({ @required this.movies, @required this.nextPage });

  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.3
  );

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener((){
      if(_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200) {
        nextPage();
      }
    });

    return Container(
      height: _screenSize.height * 0.25,
      width: _screenSize.width,
      child: PageView.builder( // with builder, the objects are created on demand and not retain eveything
        pageSnapping: false,
        controller: _pageController,
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int i) => _buildCard(context, movies[i])
      ),
    );
  }


  Widget _buildCard(BuildContext context, Movie movie) {
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
  }
}