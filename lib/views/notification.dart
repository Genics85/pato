import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:state/common/app_color.dart';
import 'package:state/common/app_text.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppColor>(
      builder: (context, darkMode, child) {
        return SafeArea(
            child: Container(
              color: darkMode.appBackgrounds,
              alignment: Alignment.center,
          child: AppText(text: "Notification Area",color: darkMode.textFieldTextColor,),
        ));
      },
    );
  }
}
