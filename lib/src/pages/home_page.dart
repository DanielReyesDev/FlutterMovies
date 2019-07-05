import 'package:flutter/material.dart';
import '../widgets/card_swiper.dart';

class HomePage extends StatelessWidget {
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
    return CardSwiper(
      movies: [1,2,3,4,5],
    );
  }





}
