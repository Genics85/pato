import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/app_color.dart';
import '../common/app_text.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppColor>(
      builder: (context, darkMode, child) {
        Color darkOrange = darkMode.darkmode ? AppColor.orange : AppColor.dark;
      Color orangeDark = darkMode.darkmode ? AppColor.dark : AppColor.orange;
      Color orangePrimary =
          darkMode.darkmode ? AppColor.orange : AppColor.primaryColor;
      Color darkWhite=darkMode.darkmode?AppColor.dark:AppColor.white;
        return SafeArea(
            child: Center(
          child: AppText(text: "History Area"),
        ));
      },
    );
  }
}
