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
     
      return Scaffold(
          body: SafeArea(
        child: Center(
          child: Container(
            color: darkMode.appBackgrounds,
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
                      image: DecorationImage(image:AssetImage("assets/images/signIn.png"),fit: BoxFit.cover)
                    ),
                    
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    hint: "Email",
                    controller: _email,
                    borderColor: darkMode.textFieldColor,
                    activeBorderColor: darkMode.textFieldColor,
                    textColor: darkMode.textFieldTextColor,
                    cursorColor: darkMode.textFieldTextColor,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppPasswordField(
                    hint: "Password",
                    controller: _password,
                    obscurityFun: obscurityFun,
                    textColor: darkMode.textFieldTextColor,
                    borderColor: darkMode.textFieldColor,
                    activeBorderColor: darkMode.textFieldColor,
                    cursorColor:darkMode.textFieldTextColor,
                    obscurity: obscurity,
                    
                    icon: obscurity
                        ? Icon(Icons.visibility_off,color: darkMode.textFieldIconColor,)
                        : Icon(Icons.visibility,color: darkMode.textFieldIconColor
                        ,),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppButton(
                      text: "Sign In",
                      textColor: darkMode.buttonTextColor,
                      color: darkMode.buttonColor,
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
                    child: AppText(text: "Sign Up",color: darkMode.textFieldTextColor,),
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
