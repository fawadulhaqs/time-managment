import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Controller/auth_controller.dart';
import 'package:timemanagment/Controller/user_controller.dart';
import 'package:timemanagment/Views/Userprofile/signle-user.dart';
import 'package:timemanagment/constans/Colors.dart';

class Userprofile extends GetWidget<AuthController> {
  const Userprofile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50),
                  color: CustomColors.white),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: CustomColors.myBlue,
                ),
                onPressed: () {
                  Get.back();
                },
              )),
        ),
        backgroundColor: CustomColors.white,
        elevation: 5.0,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(60))),
        title: Text(
          'User profile',
          style: TextStyle(color: CustomColors.myBlue, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GetX<UserController>(
                  init: Get.put<UserController>(UserController()),
                  builder: (UserController userController) {
                    if (userController != null && userController.user != null) {
                      return Container(
                        height: size.height / 1.2,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return SingleUser(
                                userModel: userController.user,
                              );
                            }),
                      );
                    } else {
                      return Text(
                        'Loading...',
                        style: TextStyle(fontSize: 20),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
