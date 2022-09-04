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

      Color darkOrange = darkMode.darkmode ? AppColor.orange : AppColor.dark;
      Color orangeDark = darkMode.darkmode ? AppColor.dark : AppColor.orange;
      Color orangePrimary =
          darkMode.darkmode ? AppColor.orange : AppColor.primaryColor;
      Color darkWhite = darkMode.darkmode ? AppColor.dark : AppColor.white;
      Color primaryOrange =
          darkMode.darkmode ? AppColor.primaryColor : AppColor.orange;
      Color whiteDark = darkMode.darkmode ? AppColor.white : AppColor.dark;

      return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          color: darkWhite,
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
                AppTextField(hint: "Name",
                    controller: _name,
                    borderColor: orangePrimary,
                    activeBorderColor: darkWhite,
                    textColor: orangePrimary,
                    cursorColor: orangePrimary,),
                SizedBox(height: 10,),
                AppTextField(hint: "Email",
                    controller: _email,
                    borderColor: orangePrimary,
                    activeBorderColor: darkWhite,
                    textColor: orangePrimary,
                    cursorColor: orangePrimary,),
                SizedBox(height: 10,),
                AppPasswordField(
                    hint: "Password",
                    controller: _password,
                    obscurityFun: obscurityFun,
                    textColor: orangePrimary,
                    borderColor: orangePrimary,
                    activeBorderColor: darkWhite,
                    cursorColor:orangePrimary,
                    obscurity: obscurity,
                    
                    icon: obscurity
                        ? Icon(Icons.visibility_off,color: orangePrimary,)
                        : Icon(Icons.visibility,color: orangePrimary
                        ,),),
                SizedBox(height: 10,),
                AppPasswordField(
                  hint: "Confirm Password",
                    controller: _confirmPassword,
                    obscurityFun: obscurityFun,
                    textColor: orangePrimary,
                    borderColor: orangePrimary,
                    activeBorderColor: darkWhite,
                    cursorColor:orangePrimary,
                    obscurity: obscurity,
                    
                    icon: obscurity
                        ? Icon(Icons.visibility_off,color: orangePrimary,)
                        : Icon(Icons.visibility,color: orangePrimary
                        ,),),
                SizedBox(height: 10,),
                AppButton(text: "Sign Up", onTap:(){},textColor: darkWhite,
                      color: orangePrimary,),
          
                SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context)=> SignIn()));
                    },
                    child: AppText(text: "Sign In",color: whiteDark,),
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
