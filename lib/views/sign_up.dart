import "package:flutter/material.dart";
import 'package:state/common/app_button.dart';
import 'package:state/common/app_password_field.dart';
import 'package:state/common/app_textfield.dart';

import '../common/app_text.dart';
import 'sign_in.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool obscurity = false;

  void obscurityFun() {
    setState(() {
      obscurity = !obscurity;
    });
  }

  signUp() {
    setState(() {
      
    });
  }

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Form(
                child: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
              children: [
          
                Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape:BoxShape.circle,
                    // image: DecorationImage(image:AssetImage("/assets/images/sign_up_logo.png")
                    // )
                  )
                  ,
                  // child:Image(image:AssetImage("../../assets/images/signUp.png"))
                  ),
                  SizedBox(height: 20,),
                AppTextField(hint: "Name", controller: _name),
                SizedBox(height: 10,),
                AppTextField(hint: "email", controller: _email),
                SizedBox(height: 10,),
                AppPasswordField(
                    hint: "Password",
                    controller: _password,
                    obscurity: obscurity,
                    obscurityFun: obscurityFun,
                    icon: obscurity?Icon(Icons.visibility_off):Icon(Icons.visibility),
                    ),
                SizedBox(height: 10,),
                AppPasswordField(
                  hint: "confirm Password",
                   controller: _confirmPassword,
                    obscurityFun: obscurityFun,
                    obscurity: obscurity,
                    icon:obscurity?Icon(Icons.visibility_off):Icon(Icons.visibility),
                    ),
                SizedBox(height: 10,),
                AppButton(text: "Sign Up", onTap:(){}),
          
                SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context)=> SignIn()));
                    },
                    child: AppText(text: "Sign In"),
                  )
              ],
            )),
          ),
        ),
      )),
    );
  }
}
