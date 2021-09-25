import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Controller/user_controller.dart';
import 'package:timemanagment/Models/user_model.dart';
import 'package:timemanagment/Services/mydb.dart';

class SignUpController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController emailSignUp = TextEditingController();
  TextEditingController phoneSignUp = TextEditingController();
  TextEditingController passwordSignUp = TextEditingController();
  File userImage;
  final auth = FirebaseAuth.instance;

  String validateEmail(String value) {
    if (!value.isEmail) {
      return 'Enter valid email';
    } else if (value == null) {
      return "Email cant't be Empty";
    } else {
      return null;
    }
  }

  String validatePassword(String value) {
    if (value == null) {
      return "Email cant't be Empty";
    } else if (value.length < 4) {
      return "Password must be greater then 4";
    } else {
      return null;
    }
  }

  String validateUsername(String value) {
    if (value == null) {
      return "UserName cant't be Empty";
    } else if (value.length < 4) {
      return "UserName must be greater then 4";
    } else {
      return null;
    }
  }

  String validatePhone(String value) {
    if (value.length < 11) {
      return 'Invalid Phone Number';
    } else if (value == null) {
      return "Please enter a phone number";
    } else {
      return null;
    }
  }

  void onSignUp(_formkey) {
    final isvalid = _formkey.currentState.validate();
    if (userImage == null) {
      Get.snackbar('Error', 'We could found the image');
      return;
    }
    if (!isvalid) {
      Get.snackbar('Error', 'Form is incomplete');
      return;
    } else {
      signUp(emailSignUp.text, passwordSignUp.text, username.text,
          phoneSignUp.text);
      // Get.back();
    }
    _formkey.currentState.save;
  }

  signUp(String email, String password, String name, String phoneNo) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      UserModel userModel = UserModel(
          id: result.user.uid,
          name: name,
          email: email,
          password: password,
          phoneNo: phoneNo);
      Get.back();
      // if (userImage = null) {
      //   Get.snackbar('No Image', ' No Image found');
      // }
      if (await MyDatabase().createUser(userModel)) {
        Get.find<UserController>().user = userModel;
      }

      Get.snackbar('Success', 'Account created Successfully');
    } catch (e) {
      print(e);
    }
  }
}
