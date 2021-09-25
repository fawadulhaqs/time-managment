import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Controller/LogOutController/logout_controller.dart';
import 'package:timemanagment/Controller/user_controller.dart';
import 'package:timemanagment/Models/user_model.dart';
import 'package:timemanagment/Services/mydb.dart';
import 'package:timemanagment/Views/SelectSheetToView/slect_sheet_to_view.dart';
import 'package:timemanagment/Views/Userprofile/user-file.dart';
import 'package:timemanagment/Views/welcomScreen/welcome_screen.dart';

class MyDrawer extends StatelessWidget {
  final UserModel userModel;

  MyDrawer({Key key, this.userModel}) : super(key: key);
  final logoutController = Get.put(LogOutController());
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Drawer(
        child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1),
                // border: Border.all(color: Colors.black26)
              ),
              child: Column(
                children: [
                  Container(
                    height: 250,
                    color: Colors.transparent,
                    child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.5),
                      ),
                      accountName: GetX<UserController>(
                        initState: (_) async {
                          Get.find<UserController>().user = await MyDatabase()
                              .getUser(Get.find<UserController>().users.uid);
                        },
                        builder: (_) {
                          if (_.user.name != null) {
                            return Text("Welcome " + _.user.name);
                          } else {
                            return Text("loading...");
                          }
                        },
                      ),
                      accountEmail: GetX<UserController>(
                        initState: (_) async {
                          Get.find<UserController>().user = await MyDatabase().getUser(
                              Get.put<UserController>(UserController()).users.uid);
                        },
                        builder: (_) {
                          if (_.user.email != null) {
                            return Text(_.user.email);
                          } else {
                            return Text("loading...");
                          }
                        },
                      ),
                      currentAccountPicture: GetX<UserController>(
                        initState: (_) async {
                          Get.find<UserController>().user = await MyDatabase().getUser(
                              Get.put<UserController>(UserController()).users.uid);
                        },
                        builder: (_) {
                          if (_.user.image != null) {
                            return CircleAvatar(
                              backgroundImage: NetworkImage(_.user.image, scale: 1.0),
                            );
                          } else {
                            return CircleAvatar(
                              backgroundColor: Colors.black45,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person_pin),
                    title: const Text('View profile'),
                    onTap: () {
                      Get.to(() => Userprofile());
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.list),
                    title: const Text('View Logs'),
                    onTap: (){
                      collectiveControlar.getlist();
                      Get.to(() => SelectSheetToView());
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: const Text('LogOut'),
                    onTap: () {
                      logoutController.signOut();
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text('App version 1.0.0'),
                    onTap: () {},
                  ),
                ],
              ),
            ),

        ),
      ),
    );
  }
}
