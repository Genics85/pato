import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppColor with ChangeNotifier {
  bool darkmode = false;

  changeToLight(bool value) {
    darkmode = false;
    buttonColor = Color.fromARGB(255, 65, 105, 225);
    buttonTextColor = Colors.white;
    appBarColor = Color.fromARGB(255, 65, 105, 225);
    iconsColor = Color.fromARGB(255, 29, 29, 29);
    appBarTextColor = Colors.white;
    appBackgrounds = Colors.white;
    textFieldColor = Color.fromARGB(255, 65, 105, 225);
    textFieldTextColor = Color.fromARGB(255, 65, 105, 225);
    textFieldIconColor = Color.fromARGB(255, 65, 105, 225);
    tileTextColor = Color.fromARGB(255, 29, 29, 29);
    notifyListeners();
  }

  changeToDark(bool value) {
    darkmode = true;
    appBarColor = Colors.orange;
    buttonColor = Colors.orange;
    appBarTextColor = Color.fromARGB(255, 29, 29, 29);
    buttonTextColor = Color.fromARGB(255, 29, 29, 29);
    appBackgrounds = Color.fromARGB(255, 29, 29, 29);
    iconsColor = Colors.orange;
    textFieldColor = Colors.orange;
    textFieldTextColor = Colors.orange;
    textFieldIconColor = Colors.orange;
    tileTextColor = Colors.orange;
    notifyListeners();
  }

  Color buttonColor = Color.fromARGB(255, 65, 105, 225);
  Color buttonTextColor = Colors.white;
  Color appBarColor = Color.fromARGB(255, 65, 105, 225);
  Color iconsColor = Color.fromARGB(255, 29, 29, 29);
  Color appBarTextColor = Colors.white;
  Color appBackgrounds = Colors.white;
  Color textFieldColor = Color.fromARGB(255, 65, 105, 225);
  Color textFieldTextColor = Color.fromARGB(255, 65, 105, 225);
  Color textFieldIconColor = Color.fromARGB(255, 65, 105, 225);
  Color tileTextColor = Color.fromARGB(255, 29, 29, 29);
  static const Color primaryColor = Color.fromARGB(255, 65, 105, 225);

  //  Color darkOrange = darkMode.darkmode ? AppColor.orange : AppColor.dark;
  //     Color orangeDark = darkMode.darkmode ? AppColor.dark : AppColor.orange;
  //     Color orangePrimary =
  //         darkMode.darkmode ? AppColor.orange : AppColor.primaryColor;
  //     Color darkWhite=darkMode.darkmode?AppColor.dark:AppColor.white;

}
