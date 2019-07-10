import 'package:flutter/material.dart';
import 'package:flutter_movies/src/models/movie.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {

  final List<Movie> movies;

  CardSwiper({ @required this.movies});

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index){
          String uniqueId = '${movies[index].id}-card';
          movies[index].uniqueId = uniqueId;
          return Container(
              // tag: movies[index].uniqueId,
              child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, "details", arguments: movies[index]),
                  child: FadeInImage(
                  image: NetworkImage(movies[index].getPosterImage()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover,
                ),
              )
            ),
          );
        },
        itemCount: 3,
      ),
    );
  }
}