import 'package:flutter/material.dart';
import '/common/app_color.dart';

class AppPasswordField extends StatelessWidget {
  TextEditingController controller;
  bool obscurity;
  String hint;
  Color textColor;
  Color borderColor;
  Color cursorColor;
  Color activeBorderColor;
  VoidCallback obscurityFun;
  Icon icon;
  AppPasswordField(
      {Key? key,
      required this.hint,
      required this.controller,
      required this.obscurity,
      required this.obscurityFun,
      this.cursorColor=AppColor.primaryColor,
      this.borderColor = AppColor.primaryColor,
      this.activeBorderColor = Colors.white,
      this.textColor = AppColor.primaryColor,
      required this.icon})
      : super(key: key);

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
      obscureText: obscurity,
      enableSuggestions: false,
      autocorrect: false,
      style: TextStyle(
        color: textColor,
        decoration: TextDecoration.none,
      ),
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: icon,
          onPressed: obscurityFun,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: borderColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: activeBorderColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: activeBorderColor)),
        hintStyle: TextStyle(color: textColor),
        hintText: hint,
      ),
    );
  }
}
