import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/common/app_text.dart';
import 'package:state/views/sign_up.dart';
import '../common/app_color.dart';
import '/common/app_button.dart';
import '/common/app_textfield.dart';
import '/common/app_password_field.dart';
import 'view_status.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  verticalDirection: VerticalDirection.down,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        // width: 170,
                        // height: 170,
                        // decoration: BoxDecoration(
                        //   color: Colors.grey,
                        //   shape: BoxShape.circle,
                        //   image: DecorationImage(image:AssetImage("assets/images/signIn.png"),fit: BoxFit.cover)
                        // ),
                        child: CircleAvatar(
                      radius: 70.0,
                      backgroundColor: Colors.white,
                      foregroundImage: AssetImage(
                        'assets/images/user.png',
                      ),
                      // backgroundImage: AssetImage(
                      //   'assets/images/user.png',
                      // ),
                    )),
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
                      cursorColor: darkMode.textFieldTextColor,
                      obscurity: obscurity,
                      icon: obscurity
                          ? Icon(
                              Icons.visibility_off,
                              color: darkMode.textFieldIconColor,
                            )
                          : Icon(
                              Icons.visibility,
                              color: darkMode.textFieldIconColor,
                            ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppButton(
                        text: "Sign In",
                        textColor: darkMode.buttonTextColor,
                        color: darkMode.buttonColor,
                        onTap: () async {
                          if (_email.text.length > 4 &&
                              _email.text.contains('@') &&
                              _email.text.contains('.') &&
                              _email.text.indexOf('@') <
                                  (_email.text.indexOf('.') - 1) &&
                              _password.text.length > 5) {
                            if (kDebugMode) {
                              print('email and password passed');
                            }
                            try {
                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .signInWithEmailAndPassword(
                                      email: _email.text,
                                      password: _password.text);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Status()));
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                if (kDebugMode) {
                                  print('No user found for that email.');
                                }
                                Fluttertoast.showToast(
                                    msg: "No user found for the email provided",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor:
                                        Color.fromRGBO(230, 57, 70, 1.0),
                                    textColor:
                                        Color.fromRGBO(241, 250, 238, 1.0),
                                    fontSize: 16.0);
                              } else if (e.code == 'wrong-password') {
                                if (kDebugMode) {
                                  print(
                                      'Wrong password provided for the user.');
                                }
                                Fluttertoast.showToast(
                                    msg:
                                        "Wrong password provided for that user",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor:
                                        Color.fromRGBO(230, 57, 70, 1.0),
                                    textColor:
                                        Color.fromRGBO(241, 250, 238, 1.0),
                                    fontSize: 16.0);
                              }
                            }
                          } else {
                            if (kDebugMode) {
                              print('didnt pass');
                            }
                            Fluttertoast.showToast(
                                msg: "Please make sure your inputs are valid",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor:
                                    Color.fromRGBO(230, 57, 70, 1.0),
                                textColor: Color.fromRGBO(241, 250, 238, 1.0),
                                fontSize: 16.0);
                          }
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: AppText(
                        text: "Sign Up",
                        color: darkMode.textFieldTextColor,
                      ),
                    ),
                    // Expanded(
                    //   child: SizedBox(),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      ));
    });
  }
}
