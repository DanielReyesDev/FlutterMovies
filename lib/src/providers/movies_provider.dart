import 'dart:async';
import 'dart:convert';

import 'package:flutter_movies/src/models/actor.dart';
import 'package:flutter_movies/src/models/movie.dart';
import 'package:http/http.dart' as http;

class MoviesProvider {
  String _apiKey = "e3a571f83a863929459331c18c9ffe67";
  String _url = "api.themoviedb.org";
  String _language = "es-ES";

  int _popularPage = 0;
  bool _isLoading = false;
  List<Movie> _popular = new List();
  final _popularStreamController = StreamController<List<Movie>>.broadcast();

  // Agregar películas al Stream
  Function(List<Movie>) get popularSink => _popularStreamController.sink.add;
  // Escuchar películas del Stream
  Stream<List<Movie>> get popularStream => _popularStreamController.stream;

  void disposeStreams() {
    _popularStreamController?.close();
  }

  Future<List<Movie>> getNowPlaying() async {
    final url = Uri.https(_url, "3/movie/now_playing",{
      'api_key': _apiKey,
      'language': _language
    });
    return await _excecuteRequest(url);
  }

   Future<List<Movie>> getPopular() async {

    if (_isLoading) return [];
    _isLoading = true;
    _popularPage++;

    final url = Uri.https(_url, "3/movie/popular",{
      'api_key': _apiKey,
      'language': _language,
      'page': _popularPage.toString()
    });

    final resp = await _excecuteRequest(url);
    _popular.addAll(resp);
    popularSink(_popular);
    _isLoading = false;
    return resp;
  }

  Future<List<Movie>> _excecuteRequest(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final movies = Movies.fromJsonList(decodedData['results']);
    return movies.movies;
  }

  Future<List<Actor>> getCast(String movieId ) async {
    final url = Uri.https(_url, '3/movie/$movieId/credits', {
      'api_key': _apiKey,
      'language': _language,
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final cast = new Cast.fromJsonList(decodedData["cast"]);
    return cast.actors;
  }


}