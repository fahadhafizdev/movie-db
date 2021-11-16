import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  set currentPage(int currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }
}
