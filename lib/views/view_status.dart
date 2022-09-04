import 'package:flutter/material.dart';
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
    return Center(child:Container(
      width: MediaQuery.of(context).size.width,
      color: AppColor.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppButton(text:"Notification", width: 200, onTap: (){}),
          AppButton(text: "History",width: 200, onTap: (){}),
          AppButton(text: "Settings",width: 200, onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Settings()));
          })
        ],
      ),
    ));
  }
}