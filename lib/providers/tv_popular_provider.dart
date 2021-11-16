import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/models/tv_model.dart';
import 'package:moviez_streaming_dark/services/tv_service.dart';

class TvPopularProvider with ChangeNotifier {
  List<TvModel> _tv;

  List<TvModel> get tv => _tv;

  setTv(List<TvModel> tv) {
    _tv = tv;
    notifyListeners();
  }

  Future<void> getTvPopular() async {
    try {
      List<TvModel> tv = await TvService().getTvPopular();
      _tv = tv;
    } catch (e) {
      print(e);
    }
  }
}
