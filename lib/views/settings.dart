import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/common/app_color.dart';
import 'package:state/common/app_text.dart';

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
      return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              iconTheme: IconThemeData(color: darkMode.appBarTextColor),
              title: AppText(
                text: "Settings",
                color: darkMode.appBarTextColor,
              ),
              backgroundColor: darkMode.appBarColor,
            ),
            body: Container(
              color: darkMode.appBackgrounds,
              child: ListView(
                children: [
                  ListTile(
                    tileColor: Colors.red,
                    leading: Icon(
                      Icons.settings,
                      color: darkMode.iconsColor,
                    ),
                    title: AppText(
                      text: "Dark mode",
                      color: darkMode.tileTextColor,
                    ),
                    trailing: Switch(
                      value: darkMode.darkmode,
                      onChanged: (bool value) {
                        darkMode.darkmode
                            ? darkMode.changeToLight(value)
                            : darkMode.changeToDark(value);
                      },
                      activeColor: darkMode.iconsColor,
                    ),
                  )
                ],
              ),
            )),
      );
    });
  }
}
