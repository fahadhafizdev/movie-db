import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/models/people_model.dart';
import 'package:moviez_streaming_dark/services/tv_service.dart';

class PeoplePopularProvider with ChangeNotifier {
  List<PeopleModel> _people;
  List<PeopleModel> get people => _people;
  set people(List<PeopleModel> people) {
    _people = people;
    notifyListeners();
  }

  Future<void> getPeoplePopular() async {
    try {
      List<PeopleModel> people = await TvService().getPeoplePopular();
      _people = people;
    } catch (e) {
      print(e);
    }
  }
}
