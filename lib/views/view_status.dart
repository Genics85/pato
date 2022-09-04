import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/common/app_button.dart';
import 'package:state/common/app_color.dart';
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
    return Consumer<AppColor>(builder:(context,darkMode,child){
      Color darkOrange = darkMode.darkmode ? AppColor.orange : AppColor.dark;
      Color orangeDark = darkMode.darkmode ? AppColor.dark : AppColor.orange;
      Color orangePrimary =
          darkMode.darkmode ? AppColor.orange : AppColor.primaryColor;
      Color darkWhite=darkMode.darkmode?AppColor.dark:AppColor.white;
      return  Center(child:Container(
      width: MediaQuery.of(context).size.width,
      color: darkWhite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppButton(text:"Notification",textColor: darkWhite,color: orangePrimary, width: 200, onTap: (){}),
          AppButton(text: "History",textColor: darkWhite,color:orangePrimary,width: 200, onTap: (){}),
          AppButton(text: "Settings",textColor: darkWhite,color: orangePrimary,width: 200, onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Settings()));
          })
        ],
      ),
    ));
    });
  }
}