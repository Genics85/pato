import 'package:flutter/material.dart';

import 'app_color.dart';

class AppButton extends StatelessWidget {
  VoidCallback onTap;
  double width;
  String text;
  AppButton({Key? key,
   required this.text, 
   this.width = 100,
   required this.onTap
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColor.primaryColor),
          ),
          onPressed:onTap,
          child: Text(text)),
    );
  }
}
