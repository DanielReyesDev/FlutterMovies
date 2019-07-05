import 'dart:convert';

import 'package:flutter_movies/src/models/movie.dart';
import 'package:http/http.dart' as http;

class MoviesProvider {
  String _apiKey = "e3a571f83a863929459331c18c9ffe67";
  String _url = "api.themoviedb.org";
  String _language = "es-ES";



  Future<List<Movie>> getNowPlaying() async {
    final url = Uri.https(_url, "3/movie/now_playing",{
      'api_key': _apiKey,
      'language': _language
    });
    return await _excecuteRequest(url);
  }

   Future<List<Movie>> getPopulars() async {
    final url = Uri.https(_url, "3/movie/popular",{
      'api_key': _apiKey,
      'language': _language,
      'page': '1'
    });
    return await _excecuteRequest(url);
  }


  Future<List<Movie>> _excecuteRequest(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final movies = Movies.fromJsonList(decodedData['results']);
    return movies.movies;
  }

}