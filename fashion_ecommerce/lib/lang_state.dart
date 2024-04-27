import 'package:flutter/material.dart';

class LangState extends ChangeNotifier {
  LangState() {
    init();
  }

  String _lang = "tr";
  String get lang => _lang;

  void init() {}

  void changeLang(String val) {
    _lang = val;
    notifyListeners();
  }
}
