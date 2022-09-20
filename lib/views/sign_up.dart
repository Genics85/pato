import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:state/common/app_button.dart';
import 'package:state/common/app_password_field.dart';
import 'package:state/common/app_textfield.dart';

import '../common/app_color.dart';
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
    return Consumer<AppColor>(builder:(context,darkMode,child){
      return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          color: darkMode.appBackgrounds,
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
                    color: Colors.white,
                    shape:BoxShape.circle,
                    image: DecorationImage(image:AssetImage("assets/images/signUp.png"),fit: BoxFit.cover
                    )
                  )
                  ,
                  ),
                  SizedBox(height: 20,),
                AppTextField(hint: "Name",
                    controller: _name,
                    borderColor: darkMode.textFieldColor,
                    activeBorderColor: darkMode.textFieldColor,
                    textColor: darkMode.textFieldTextColor,
                    cursorColor: darkMode.textFieldTextColor,),
                SizedBox(height: 10,),
                AppTextField(hint: "Email",
                    controller: _email,
                    borderColor: darkMode.textFieldColor,
                    activeBorderColor: darkMode.textFieldColor,
                    textColor: darkMode.textFieldTextColor,
                    cursorColor: darkMode.textFieldTextColor,),
                SizedBox(height: 10,),
                AppPasswordField(
                    hint: "Password",
                    controller: _password,
                    obscurityFun: obscurityFun,
                    textColor: darkMode.textFieldTextColor,
                    borderColor: darkMode.textFieldColor,
                    activeBorderColor:darkMode.textFieldColor,
                    cursorColor:darkMode.textFieldTextColor,
                    obscurity: obscurity,
                    
                    icon: obscurity
                        ? Icon(Icons.visibility_off,color: darkMode.textFieldIconColor,)
                        : Icon(Icons.visibility,color: darkMode.textFieldIconColor
                        ,),),
                SizedBox(height: 10,),
                AppPasswordField(
                  hint: "Confirm Password",
                    controller: _confirmPassword,
                    obscurityFun: obscurityFun,
                    textColor: darkMode.textFieldTextColor,
                    borderColor: darkMode.textFieldColor,
                    activeBorderColor:darkMode.textFieldColor,
                    cursorColor:darkMode.textFieldTextColor,
                    obscurity: obscurity,
                    
                    icon: obscurity
                        ? Icon(Icons.visibility_off,color: darkMode.textFieldIconColor,)
                        : Icon(Icons.visibility,color: darkMode.textFieldIconColor
                        ,),),
                SizedBox(height: 10,),
                AppButton(text: "Sign Up", onTap:(){},textColor: darkMode.buttonTextColor,
                      color: darkMode.buttonColor,),
          
                SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context)=> SignIn()));
                    },
                    child: AppText(text: "Sign In",color: darkMode.textFieldTextColor,),
                  )
              ],
            )),
          ),
        ),
      )),
    );
    });
    
    
  }
}
