import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/common/app_color.dart';
import 'package:state/providers/theme_provider.dart';
import 'package:state/views/sign_in.dart';

void main() {
  return  runApp(

    MultiProvider(providers: [
      ChangeNotifierProvider<Darkmode>(create: (context)=>Darkmode()),
      ChangeNotifierProvider<AppColor>(create: (context)=>AppColor()),
    ],
    child:MasterPlanApp() ,
    )
    );
}

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
