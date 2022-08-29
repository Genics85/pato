import 'package:flutter/material.dart';
import 'package:state/common/app_text.dart';
import 'package:state/views/sign_up.dart';
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
    print("this is the sign in function");
  }

  void obscurityFun() {
    setState(() {
      obscurity = !obscurity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 170,
                  height: 170,
                  decoration:
                      BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                        // image: DecorationImage(image:AssetImage("/assets/images/sign_in_logo.png"))
                        ),
                        child: Image(image: AssetImage("/assets/images/sign_in_png")),
                ),
                SizedBox(
                  height: 20,
                ),
                AppTextField(hint: "Email", controller: _email),
                SizedBox(
                  height: 20,
                ),
                AppPasswordField(
                  hint: "Password",
                  controller: _password,
                  obscurityFun: obscurityFun,
                  obscurity: obscurity,
                  icon: obscurity
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
                SizedBox(
                  height: 10,
                ),
                AppButton(
                    text: "Sign In",
                    onTap: () {
                      Navigator.pushReplacement(context,
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
                  child: AppText(text: "Sign Up"),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
