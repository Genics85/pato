import 'package:flutter/material.dart';
import '/common/app_color.dart';

class AppPasswordField extends StatelessWidget {
  TextEditingController controller;
  bool obscurity;
  String hint;
  VoidCallback obscurityFun;
  Icon icon;
  AppPasswordField({
    Key? key,
    required this.hint,
    required this.controller,
    required this.obscurity,
    required this.obscurityFun,
    required this.icon
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
      obscureText: obscurity,
      enableSuggestions: false,
      autocorrect: false,
      style: TextStyle(
        color: AppColor.primaryColor,
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
            borderSide: BorderSide(width: 2, color: AppColor.primaryColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Colors.white)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Colors.white)),
        hintStyle: TextStyle(color: AppColor.primaryColor),
        hintText: hint,
      ),
    );
  }
}
