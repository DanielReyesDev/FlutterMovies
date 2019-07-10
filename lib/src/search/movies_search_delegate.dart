import 'package:flutter/material.dart';
import 'package:flutter_movies/src/models/movie.dart';
import 'package:flutter_movies/src/providers/movies_provider.dart';

class MoviesSearchDelegate extends SearchDelegate{

  String selection = "";
  final moviesProvider = new MoviesProvider();

  final movies = [
    "Spiderman",
    "Aquaman",
    "Batman",
    "Shazam!"
  ];

  final recentMovies = [
    "Spiderman",
    "Avengers"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // All actions of the Searchbar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icon at the left of the Searchbar 
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Creates the results to display
    return Center(
      child: Container( 
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(selection),
      ),
    );
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty) {
      return Container();
    }
    return FutureBuilder(
      future: moviesProvider.searchMovie(query),
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot ){
        if (snapshot.hasData) {

          final movies = snapshot.data;

          return ListView(
            children: movies.map((movie){
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(movie.getPosterImage()),
                  placeholder: AssetImage("assets/img/no-image.jpg"),
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                title: Text(movie.title),
                subtitle: Text(movie.originalTitle),
                onTap: (){
                  close(context, null);
                  movie.uniqueId = '';
                  Navigator.pushNamed(context, "details", arguments: movie);
                },
              );
            }).toList()
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   // Creates the suggestions


  //   final suggestedList = (query.isEmpty)
  //                           ? recentMovies
  //                           : movies.where(
  //                             (p) => p.toLowerCase().startsWith(query.toLowerCase())
  //                           ).toList();


  //   return ListView.builder(
  //     itemCount: suggestedList.length,
  //     itemBuilder: (context, i){
  //       return ListTile(
  //         leading: Icon(Icons.movie),
  //         title: Text(suggestedList[i]),
  //         onTap: (){
  //           selection = suggestedList[i];
  //           showResults(context);
  //         },

  //       );
  //     },
  //   );
  // }
  
}