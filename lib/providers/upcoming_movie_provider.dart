import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/models/movie_model.dart';
import 'package:moviez_streaming_dark/services/movie_service.dart';

class UpComingMovieProvider with ChangeNotifier {
  List<MovieModel> _movies = [];

  List<MovieModel> get movies => _movies;

  set movies(List<MovieModel> movies) {
    _movies = movies;
    notifyListeners();
  }

  Future<void> getUpComingMovieList() async {
    try {
      List<MovieModel> movies = await MovieService().getUpComingMovieList();
      _movies = movies;
    } catch (e) {
      print(e);
    }
  }
}
