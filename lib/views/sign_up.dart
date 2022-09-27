import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:state/common/app_button.dart';
import 'package:state/common/app_password_field.dart';
import 'package:state/common/app_textfield.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/authservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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
    setState(() {});
  }

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AppColor>(builder: (context, darkMode, child) {
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
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/user.png"),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    hint: "Name",
                    controller: _name,
                    borderColor: darkMode.textFieldColor,
                    activeBorderColor: darkMode.textFieldColor,
                    textColor: darkMode.textFieldTextColor,
                    cursorColor: darkMode.textFieldTextColor,
                  ),
                  SizedBox(
                    height: 10,
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
                    height: 10,
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
                  AppPasswordField(
                    hint: "Confirm Password",
                    controller: _confirmPassword,
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
                    text: "Sign Up",
                    onTap: () async {
                      if (_name.text.length > 2 &&
                          _email.text.length > 4 &&
                          _email.text.indexOf('@') <
                              (_email.text.indexOf('.') - 1) &&
                          _email.text.contains('@') &&
                          _email.text.contains('.') &&
                          _password.text.length > 5 &&
                          _password.text == _confirmPassword.text) {
                        if (kDebugMode) {
                          print('passed');
                        }
                        // AuthServices().singUp(_email.text, _password.text);
                        //
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                                  email: _email.text, password: _password.text);
                          try {
                            //if (userCredential.user!.uid != null) {
                            if (kDebugMode) {
                              print(userCredential.user!.uid);
                            }
                            //}
                          } catch (e) {
                            if (kDebugMode) {
                              print('cathe null uid');
                            }
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignIn()));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            if (kDebugMode) {
                              print('The password provided is too weak.');
                            }
                            Fluttertoast.showToast(
                                msg: "The password provided is too weak",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor:
                                    Color.fromRGBO(230, 57, 70, 1.0),
                                textColor: Color.fromRGBO(241, 250, 238, 1.0),
                                fontSize: 16.0);
                          } else if (e.code == 'email-already-in-use') {
                            if (kDebugMode) {
                              print(
                                  'The account already exists for that email.');
                            }
                            Fluttertoast.showToast(
                                msg:
                                    "The account already exists for that email",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor:
                                    Color.fromRGBO(230, 57, 70, 1.0),
                                textColor: Color.fromRGBO(241, 250, 238, 1.0),
                                fontSize: 16.0);
                          }
                        } catch (e) {
                          if (kDebugMode) {
                            print('sign up error');
                            print(e);
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
                            backgroundColor: Color.fromRGBO(230, 57, 70, 1.0),
                            textColor: Color.fromRGBO(241, 250, 238, 1.0),
                            fontSize: 16.0);
                      }
                    },
                    textColor: darkMode.buttonTextColor,
                    color: darkMode.buttonColor,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: AppText(
                      text: "Sign In",
                      color: darkMode.textFieldTextColor,
                    ),
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
