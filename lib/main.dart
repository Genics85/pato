import 'package:flutter/material.dart';
import 'package:state/views/sign_in.dart';

void main() => runApp(MasterPlanApp());
class MasterPlanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return 
       MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        home: SignIn(),
      );
    
  }
}
