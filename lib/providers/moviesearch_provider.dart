import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/models/movie_model.dart';
import 'package:moviez_streaming_dark/services/movie_service.dart';

class MovieSearchProvider with ChangeNotifier {
  List<MovieModel> _movies = [];

  List<MovieModel> get movies => _movies;

  set movies(List<MovieModel> movies) {
    _movies = movies;
    notifyListeners();
  }

  Future<void> getSearchMovie(String input) async {
    try {
      List<MovieModel> movie = await MovieService().getSearchMovie(input);
      _movies = movie;
    } catch (e) {
      print(e);
    }
  }

  resetSearchMovie() async {
    _movies = [];
    notifyListeners();
  }
}
