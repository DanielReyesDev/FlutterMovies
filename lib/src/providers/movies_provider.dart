import 'dart:convert';

import 'package:flutter_movies/src/models/movie.dart';
import 'package:http/http.dart' as http;

class MoviesProvider {
  String _apiKey = "e3a571f83a863929459331c18c9ffe67";
  String _url = "api.themoviedb.org";
  String _language = "es-ES";

  // https://api.themoviedb.org/3/movie/now_playing?api_key=e3a571f83a863929459331c18c9ffe67&language=en-US&page=1
  Future<List<Movie>> getNowPlaying() async {
    final url = Uri.https(_url, "3/movie/now_playing",{
      'api_key': _apiKey,
      'language': _language
    });
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final movies = Movies.fromJsonList(decodedData['results']);
    return movies.movies;
  }

}