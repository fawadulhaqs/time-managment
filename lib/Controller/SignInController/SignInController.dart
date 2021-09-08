import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Controller/user_controller.dart';
import 'package:timemanagment/Services/mydb.dart';
import 'package:timemanagment/Views/welcomScreen/welcome_screen.dart';

class SignInController extends GetxController {
  TextEditingController emailSignIn = TextEditingController();
  TextEditingController passwordSignIn = TextEditingController();
  final auth = FirebaseAuth.instance;
  final firstore = FirebaseFirestore.instance;

  String validateUserName(String value) {
    if (!value.isEmail) {
      return 'Enter valid email';
    } else if (value == null) {
      return "Email cant't be Empty";
    } else {
      return null;
    }
  }

  String validatePassword(String value) {
    if (value.length < 4) {
      return 'Password must be greater then 4';
    } else if (value == null) {
      return "Email cant't be Empty";
    } else {
      return null;
    }
  }

  void onLoginIn(_formkey) {
    final isvalid = _formkey.currentState.validate();
    if (!isvalid) {
      return;
    } else {
      login(emailSignIn.text, passwordSignIn.text);
    }
    _formkey.currentState.save;
  }

  login(String email, String password) async {
    try {
      UserCredential _authresult = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.put<UserController>(UserController()).user = await MyDatabase()
          .getUser(_authresult.user.uid)
          .then((value) => Get.to(WelcomeScreen()));

      Get.snackbar('Success', 'Login Success Fully');
    } catch (e) {
      print(e);
      Get.snackbar('Erorr', e.toString());
    }
  }
}
