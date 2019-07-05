import 'package:flutter/material.dart';
import 'package:flutter_movies/src/providers/movies_provider.dart';
import '../widgets/card_swiper.dart';

class HomePage extends StatelessWidget {

  MoviesProvider _moviesProvider = MoviesProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movies"),
          backgroundColor: Colors.indigoAccent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){},
            )
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              _swipeCards()
            ],
          ),
        )
      );
  }


  Widget _swipeCards() {

    return FutureBuilder(
      future: _moviesProvider.getNowPlaying(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if(snapshot.hasData) {
          return CardSwiper( movies: snapshot.data );
        } else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
            )
          );
        }
      },
    );
  }





}
