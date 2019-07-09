import 'package:flutter/material.dart';
import 'package:flutter_movies/src/models/movie.dart';

class MovieDetailsPage extends StatelessWidget {

  // final Movie movie;

  // MovieDetailsPage();

  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context).settings.arguments;


    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _buildAppbar(movie),
        ],
      )
    );
  }

  Widget _buildAppbar(Movie movie) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          movie.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0
          ),
        ),
        background: FadeInImage(
          image: NetworkImage( movie.getBackgroundImage() ),
          placeholder: AssetImage("assets/img/loading.gif"),
          fadeInDuration: Duration(microseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}