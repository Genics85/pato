import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppColor with ChangeNotifier {
  bool darkmode = false;

  changeMode(bool value) {
    darkmode = !darkmode;
    notifyListeners();
  }

  static const Color primaryColor = Color.fromARGB(255, 65, 105, 225);
  static const Color secondaryColor = Color.fromARGB(255, 117, 230, 219);
  static const Color white = Colors.white;
  static const Color orange = Colors.orange;
  static const Color dark = Color.fromARGB(255, 29, 29, 29);
}
