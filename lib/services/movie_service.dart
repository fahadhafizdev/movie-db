import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moviez_streaming_dark/models/movie_model.dart';

class MovieService {
  String key = "2443a5d0bd7fff1591d6b0726e1af9dc";

  Future<List<MovieModel>> getTopMovieList() async {
    var url =
        "https://api.themoviedb.org/3/movie/top_rated?api_key=${key}&language=en-US";
    var response = await http.get(Uri.parse(url));

    print('${response.statusCode}');
    print('${response.body}');

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<MovieModel> movie = data
          .map<MovieModel>(
            (item) => MovieModel.fromJson(item),
          )
          .toList();
      return movie;
    } else {
      throw Exception('data movie gagal');
    }
  }

  Future<List<MovieModel>> getPopularMovieList() async {
    var url =
        "https://api.themoviedb.org/3/movie/popular?api_key=${key}&language=en-US";
    var response = await http.get(Uri.parse(url));

    print('${response.statusCode}');
    print('${response.body}');

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<MovieModel> movie = data
          .map<MovieModel>(
            (item) => MovieModel.fromJson(item),
          )
          .toList();
      return movie;
    } else {
      throw Exception('data movie gagal');
    }
  }

  Future<List<MovieModel>> getUpComingMovieList() async {
    var url =
        "https://api.themoviedb.org/3/movie/upcoming?api_key=${key}&language=en-US";
    var response = await http.get(Uri.parse(url));

    print('${response.statusCode}');
    print('${response.body}');

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<MovieModel> movie = data
          .map<MovieModel>(
            (item) => MovieModel.fromJson(item),
          )
          .toList();
      return movie;
    } else {
      throw Exception('data movie gagal');
    }
  }
}
