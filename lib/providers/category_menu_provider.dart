import 'package:flutter/material.dart';

class CategoryMenuProvider with ChangeNotifier {
  String _categorySelected = 'Popular';

  String get categorySelected => _categorySelected;

  set categorySelected(String categorySelected) {
    _categorySelected = categorySelected;
    notifyListeners();
    print(_categorySelected);
  }
}
