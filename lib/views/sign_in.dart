import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/common/app_text.dart';
import 'package:state/views/sign_up.dart';
import '../common/app_color.dart';
import '/common/app_button.dart';
import '/common/app_textfield.dart';
import '/common/app_password_field.dart';
import 'view_status.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool obscurity = false;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  signIn() {
    // sign in function goes here
  }

  void obscurityFun() {
    setState(() {
      obscurity = !obscurity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppColor>(builder: (context, darkMode, child) {
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
            color: darkWhite,
            padding: EdgeInsets.all(15),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                      // image: DecorationImage(image:AssetImage("/assets/images/sign_in_logo.png"))
                    ),
                    // child: Image(image: AssetImage("../../assets/images/signIn.png")),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    hint: "Email",
                    controller: _email,
                    borderColor: orangePrimary,
                    activeBorderColor: darkWhite,
                    textColor: orangePrimary,
                    cursorColor: orangePrimary,
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                        ,),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppButton(
                      text: "Sign In",
                      textColor: darkWhite,
                      color: orangePrimary,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Status()));
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: AppText(text: "Sign Up",color: whiteDark,),
                  )
                ],
              ),
            ),
          ),
        ),
      ));
    });
  }
}
