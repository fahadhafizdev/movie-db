import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moviez_streaming_dark/models/tv_model.dart';

class TvService {
  String key = "2443a5d0bd7fff1591d6b0726e1af9dc";

  Future<List<TvModel>> getTvAiringToday() async {
    var url =
        'https://api.themoviedb.org/3/tv/airing_today?api_key=${key}&language=en-US';
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
}
