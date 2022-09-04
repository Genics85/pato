import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  VoidCallback onTap;
  double width;
  String text;
  Color color;
  Color textColor;
  AppButton(
      {Key? key,
      required this.text,
      this.color = AppColor.primaryColor,
      this.textColor=AppColor.white,
      this.width = 100,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      width: width,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
          ),
          onPressed: onTap,
          child: AppText(text:text,color: textColor,)),
    );
  }
}
