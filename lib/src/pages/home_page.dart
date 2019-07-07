import 'package:flutter/material.dart';
import 'package:flutter_movies/src/providers/movies_provider.dart';
import 'package:flutter_movies/src/widgets/movies_horizontal_page_view.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _swipeCards(),
              _footer(context) 
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


  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 16.0),
            child: Text("Popular", style: Theme.of(context).textTheme.subhead,)

          ),
          SizedBox(height: 8.0,),
          FutureBuilder(
            future: _moviesProvider.getPopular(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return MoviesHorizontalPageView(movies: snapshot.data);
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }





}
