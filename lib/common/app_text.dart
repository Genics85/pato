import "package:flutter/material.dart";

class AppText extends StatelessWidget {
  String text;
  Color color;
  AppText({Key? key, required this.text, this.color=Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, color:color),
    );
  }
}
