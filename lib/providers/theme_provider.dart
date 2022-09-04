import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Darkmode with ChangeNotifier {
  bool state = false;
  changeMode(bool value) {
    state = value;
    notifyListeners();
  }
}
