import 'package:flutter/material.dart';

import '../common/app_text.dart';

class Status extends StatefulWidget {
  Status({Key? key}) : super(key: key);

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Center(child: AppText(text:"status",color: Colors.white,),);
  }
}