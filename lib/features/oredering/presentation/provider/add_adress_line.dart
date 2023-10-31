import 'package:flutter/material.dart';

class AddAdressLine extends ChangeNotifier {
  bool _visible = false;

  bool get visble => _visible;

  void addAdressLine() {
    _visible = true;
    notifyListeners();
  }
}
