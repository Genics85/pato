import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:state/common/app_color.dart';
import 'package:state/common/app_text.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
          child: AppText(text: "Notification Area"),
        ));
      },
    );
  }
}
