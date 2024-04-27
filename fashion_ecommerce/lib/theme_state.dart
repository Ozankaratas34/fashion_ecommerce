import 'package:flutter/material.dart';

class ThemeState extends ChangeNotifier {
  ThemeState() {
    init();
  }

  bool _isLight = true;
  bool get isLight => _isLight;
  void init() {}

  void changeTheme() {
    _isLight = !_isLight;
    notifyListeners();
  }
}
