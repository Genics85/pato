import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/common/app_button.dart';
import 'package:state/common/app_color.dart';
import 'package:state/views/history.dart';
import 'package:state/views/notification.dart';
import 'package:state/views/settings.dart';
import '../common/app_text.dart';

class Status extends StatefulWidget {
  Status({Key? key}) : super(key: key);

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppColor>(builder: (context, darkMode, child) {
      return Center(
          child: Container(
        width: MediaQuery.of(context).size.width,
        color: darkMode.appBackgrounds,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
                text: "Notification",
                textColor: darkMode.buttonTextColor,
                color: darkMode.buttonColor,
                width: 200,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationPage()));
                }),
            // AppButton(
            //     text: "History",
            //     textColor: darkMode.buttonTextColor,
            //     color: darkMode.buttonColor,
            //     width: 200,
            //     onTap: () {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => HistoryPage()));
            //     }),
            AppButton(
                text: "Settings",
                textColor: darkMode.buttonTextColor,
                color: darkMode.buttonColor,
                width: 200,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings()));
                })
          ],
        ),
      ));
    });
  }
}
