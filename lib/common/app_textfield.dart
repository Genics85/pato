import 'package:flutter/material.dart';
import '/common/app_color.dart';

class AppTextField extends StatelessWidget {
  TextEditingController controller;
  String hint;
  Color cursorColor;
  Color textColor;
  Color borderColor;
  Color activeBorderColor;
  AppTextField({
    Key? key,
    required this.hint,
    required this.controller,
    this.cursorColor=AppColor.primaryColor,
    this.borderColor = AppColor.primaryColor,
    this.activeBorderColor = AppColor.white,
    this.textColor = AppColor.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) {
        if (val == null || val.isEmpty) {
          return "Enter your $hint";
        }
        return null;
      },
      cursorColor: cursorColor,
      enableSuggestions: false,
      autocorrect: false,
      style: TextStyle(
        color: textColor,
        decoration: TextDecoration.none,
      ),
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: borderColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: activeBorderColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: borderColor)),
        hintStyle: TextStyle(color: textColor),
        hintText: hint,
      ),
    );
  }
}
