import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Controller/SignInController/SignInController.dart';
import 'package:timemanagment/Controller/user_controller.dart';
import 'package:timemanagment/Views/SignUpScreen/SignUpScreen.dart';
import 'package:timemanagment/constans/Colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key key}) : super(key: key);
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final userController=Get.put<UserController>(UserController());
  @override
  Widget build(BuildContext context) {
    final validateController = Get.put(SignInController());
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _globalKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 200,
                          width: 300,
                          child: SvgPicture.asset('assets/images/uniii.svg')),
                      Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8.0, left: 6.0, right: 6.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,

                            controller: validateController.emailSignIn,
                            decoration: const InputDecoration(
                                icon: Icon(CupertinoIcons.person_alt_circle),
                                hintText: 'Username',
                                labelText: 'Name *',
                                labelStyle: TextStyle(fontSize: 18)),
                            validator: (String value) {
                              return validateController.validateUserName(value);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8.0, left: 6.0, right: 6.0),
                          child: TextFormField(
                            controller: validateController.passwordSignIn,
                            decoration: const InputDecoration(
                                icon: Icon(CupertinoIcons.padlock),
                                hintText: 'Password',
                                labelText: 'Password *',
                                labelStyle: TextStyle(fontSize: 18)),
                            validator: (String value) {
                              return validateController.validatePassword(value);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Create new Account!'),
                MaterialButton(
                  onPressed: () {
                    Get.to(SignUpScreen());
                  },
                  child: Text(
                    'Register ?',
                    style: TextStyle(color: CustomColors.myBlue),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                width: 200,
                height: 45,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                    child: Text("Login".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            CustomColors.myBlue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side: BorderSide(
                                        color: Colors.white, width: 2)))),
                    onPressed: () {
                      validateController.onLoginIn(_globalKey);
                    }))
          ],
        )),
      ),
    );
  }
}
