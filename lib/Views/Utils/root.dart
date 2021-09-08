import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Controller/auth_controller.dart';
import 'package:timemanagment/Controller/user_controller.dart';
import 'package:timemanagment/Views/LoginScreen/LoginScreen.dart';
import 'package:timemanagment/Views/welcomScreen/welcome_screen.dart';

class Root extends StatelessWidget {
  const Root({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(
      initState: (_){
       Get.put<UserController>(UserController());
      },
      builder: (_){
        if(Get.find<AuthController>().user != null){
          return WelcomeScreen();
        }else
          return LoginScreen();
      },
    );

  }
}
