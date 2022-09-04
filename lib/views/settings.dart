import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/common/app_color.dart';
import 'package:state/common/app_text.dart';
import 'package:state/providers/theme_provider.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool state = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppColor>(builder: (context, darkMode, child) {
      Color darkOrange = darkMode.darkmode ? AppColor.orange : AppColor.dark;
      Color orangeDark = darkMode.darkmode ? AppColor.dark : AppColor.orange;
      Color orangePrimary =
          darkMode.darkmode ? AppColor.orange : AppColor.primaryColor;
      Color darkWhite=darkMode.darkmode?AppColor.dark:AppColor.white;
      return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              iconTheme: IconThemeData(color: darkWhite),
              title: AppText(
                text: "Settings",
                color: darkWhite,
              ),
              backgroundColor: orangePrimary,
            ),
            body: Container(
              color: darkMode.darkmode ? AppColor.dark : AppColor.white,
              child: ListView(
                children: [
                  ListTile(
                    tileColor: Colors.red,
                    leading: Icon(
                      Icons.settings,
                      color: darkOrange,
                    ),
                    title: AppText(
                      text: "Dark mode",
                      color: darkOrange,
                    ),
                    trailing: Switch(
                      value: darkMode.darkmode,
                      onChanged: (bool value) {
                        darkMode.changeMode(value);
                      },
                      activeColor: orangePrimary,
                    ),
                  )
                ],
              ),
            )),
      );
    });
  }
}
