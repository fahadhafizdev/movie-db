import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/models/movie_model.dart';

class FavoriteMovieProvider with ChangeNotifier {
  List<MovieModel> _movieList = [];

  List<MovieModel> get movieList => _movieList;

  set movieList(List<MovieModel> movieList) {
    _movieList = movieList;
    notifyListeners();
  }

  setMovieList(MovieModel movieList) {
    if (isWhistList(movieList)) {
      _movieList.removeWhere((element) => element.id == movieList.id);
    } else {
      _movieList.add(movieList);
    }
    notifyListeners();
  }

  isWhistList(MovieModel movieList) {
    if (_movieList.indexWhere((element) => element.id == movieList.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
