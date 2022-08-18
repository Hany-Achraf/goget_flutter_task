import 'package:flutter/material.dart';

class BottomNavbarProvider extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  void changeIndex({required int index}) {
    _index = index;
    notifyListeners();
  }
}
