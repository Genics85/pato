import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/common/app_color.dart';
import 'package:state/views/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppColor>(create: (context) => AppColor()),
    ],
    child: MasterPlanApp(),
  ));
}

class MasterPlanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: SignIn(),
    );
  }
}
