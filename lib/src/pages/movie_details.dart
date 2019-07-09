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
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 10.0),
                _buildPosterTitle(context, movie),
                _buildDescription(movie),
                _buildDescription(movie),
                _buildDescription(movie),
                _buildDescription(movie),
                _buildDescription(movie),
                _buildDescription(movie),
              ]
            ),
          )
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

  Widget _buildPosterTitle(BuildContext context, Movie movie) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:  20.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
              child: Image(
              image: NetworkImage(movie.getPosterImage()),
              height: 150.0,
            ),
          ),
          SizedBox(width: 20.0,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start ,
              children: <Widget>[
                Text(movie.title, style: Theme.of(context).textTheme.title, overflow: TextOverflow.ellipsis),
                Text(movie.originalTitle, style: Theme.of(context).textTheme.subhead, overflow: TextOverflow.ellipsis),
                Row(
                  children: <Widget>[
                    Icon(Icons.star_border),
                    Text(movie.voteAverage.toString(), style: Theme.of(context).textTheme.subhead)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDescription(Movie movie) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,  
      ),
    );
  }
}