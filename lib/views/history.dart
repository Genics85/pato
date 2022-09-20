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
        return SafeArea(
            child: Container(
              alignment: Alignment.center,
              color: darkMode.appBackgrounds,
          child: AppText(text: "History Area",color: darkMode.textFieldTextColor,),
        ));
      },
    );
  }
}
