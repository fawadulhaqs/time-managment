import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Controller/SinUpController/SigUpController.dart';
import 'package:timemanagment/Views/LoginScreen/LoginScreen.dart';
import 'package:timemanagment/Views/SignUpScreen/widget/user-image-picker.dart';
import 'package:timemanagment/constans/Colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
    final validateController = Get.put(SignUpController());
    void _pickedImage(File image) {
      validateController.userImage = image;
    }

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
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            height: 50,
                            width: 70,
                            child: SvgPicture.asset('assets/images/uniii.svg')),
                      ),
                      UserImagePicker(
                        imagePickedFn: _pickedImage,
                      ),
                      Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8.0, left: 6.0, right: 6.0),
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            controller: validateController.username,
                            decoration: const InputDecoration(
                                icon: Icon(CupertinoIcons.person_alt_circle),
                                hintText: 'UserName',
                                labelText: 'username *',
                                labelStyle: TextStyle(fontSize: 18)),
                            validator: (String value) {
                              return validateController.validateUsername(value);
                            },
                          ),
                        ),
                      ),
                      Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8.0, left: 6.0, right: 6.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: validateController.emailSignUp,
                            decoration: const InputDecoration(
                                icon: Icon(CupertinoIcons.mail),
                                hintText: 'Email',
                                labelText: 'Email *',
                                labelStyle: TextStyle(fontSize: 18)),
                            validator: (String value) {
                              return validateController.validateEmail(value);
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
                            keyboardType: TextInputType.phone,
                            controller: validateController.phoneSignUp,
                            decoration: const InputDecoration(
                                icon: Icon(CupertinoIcons.phone_fill),
                                hintText: 'phone No',
                                labelText: 'Phone No *',
                                labelStyle: TextStyle(fontSize: 18)),
                            validator: (String value) {
                              return validateController.validatePhone(value);
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
                            obscureText: true,
                            controller: validateController.passwordSignUp,
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
                Text('Already have an Account?'),
                MaterialButton(
                  onPressed: () {
                    Get.to(LoginScreen());
                  },
                  child: Text(
                    'Login',
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
                    child: Text("Register".toUpperCase(),
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
                      validateController.onSignUp(_globalKey);
                    }))
          ],
        )),
      ),
    );
  }
}
