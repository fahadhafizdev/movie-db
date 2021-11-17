import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moviez_streaming_dark/models/people_model.dart';
import 'package:moviez_streaming_dark/models/tv_model.dart';

class TvService {
  String key = "2443a5d0bd7fff1591d6b0726e1af9dc";

  Future<List<TvModel>> getTvAiringToday() async {
    var url =
        'https://api.themoviedb.org/3/tv/airing_today?api_key=${key}&language=en-US&page=2';
    var response = await http.get(Uri.parse(url));

    print('${response.statusCode}');
    print('${response.body}');

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<TvModel> tv =
          data.map<TvModel>((item) => TvModel.fromJson(item)).toList();

      return tv;
    } else {
      throw Exception('Data tv gagal didapatkan');
    }
  }

  Future<List<TvModel>> getTvTopRated() async {
    var url =
        'https://api.themoviedb.org/3/tv/top_rated?api_key=${key}&language=en-US';
    var response = await http.get(Uri.parse(url));

    print('${response.statusCode}');
    print('${response.body}');

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<TvModel> tv =
          data.map<TvModel>((item) => TvModel.fromJson(item)).toList();

      return tv;
    } else {
      throw Exception('Data tv gagal didapatkan');
    }
  }

  Future<List<TvModel>> getTvOnTheAir() async {
    var url =
        'https://api.themoviedb.org/3/tv/on_the_air?api_key=${key}&language=en-US&page=3';
    var response = await http.get(Uri.parse(url));

    print('${response.statusCode}');
    print('${response.body}');

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<TvModel> tv =
          data.map<TvModel>((item) => TvModel.fromJson(item)).toList();

      return tv;
    } else {
      throw Exception('Data tv gagal didapatkan');
    }
  }

  Future<List<TvModel>> getTvPopular() async {
    var url =
        'https://api.themoviedb.org/3/tv/popular?api_key=${key}&language=en-US';
    var response = await http.get(Uri.parse(url));

    print('${response.statusCode}');
    print('${response.body}');

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<TvModel> tv =
          data.map<TvModel>((item) => TvModel.fromJson(item)).toList();

      return tv;
    } else {
      throw Exception('Data tv gagal didapatkan');
    }
  }

  Future<List<PeopleModel>> getPeoplePopular() async {
    var url =
        'https://api.themoviedb.org/3/person/popular?api_key=${key}&language=en-US';
    var response = await http.get(Uri.parse(url));

    print('${response.statusCode}');
    print('${response.body}');

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<PeopleModel> people =
          data.map<PeopleModel>((item) => PeopleModel.fromJson(item)).toList();

      return people;
    } else {
      throw Exception('Data people gagal didapatkan');
    }
  }
}
