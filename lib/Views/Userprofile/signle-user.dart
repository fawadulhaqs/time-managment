import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:timemanagment/Controller/user_controller.dart';
import 'package:timemanagment/Models/user_model.dart';
import 'package:timemanagment/Services/mydb.dart';


class SingleUser extends StatefulWidget {
  const SingleUser({Key key, this.userModel}) : super(key: key);
  final UserModel userModel;
  @override
  _SingleUserState createState() => _SingleUserState(userModel);
}

class _SingleUserState extends State<SingleUser> {
  final UserModel userModel;

  _SingleUserState(this.userModel);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.only(top: size.height / 4.5),
        height: size.height / 1.23,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Stack(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    child: GetX<UserController>(
                      initState: (_) async {
                        Get.find<UserController>().user = await MyDatabase()
                            .getUser(Get.put<UserController>(UserController())
                                .users
                                .uid);
                      },
                      builder: (_) {
                        if (_.user.image != null) {
                          return CircleAvatar(
                            backgroundImage:
                                NetworkImage(_.user.image, scale: 1.0),
                          );
                        } else {
                          return CircleAvatar(
                            backgroundColor: Colors.black45,
                          );
                        }
                      },
                    ),
                  ),
                  // Positioned(
                  //     bottom: 0,
                  //     right: 0,
                  //     child: Container(
                  //         decoration: BoxDecoration(
                  //             color: CustomColors.myBlue,
                  //             borderRadius: BorderRadius.circular(35)),
                  //         child: IconButton(
                  //           icon: Icon(
                  //             Icons.camera_alt,
                  //             size: 27,
                  //             color: Colors.white,
                  //           ),
                  //           onPressed: () {},
                  //         )))
                ],
              ),
            ),
            Column(
              // physics: BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 24),
                buildName(userModel),
                const SizedBox(height: 24),
                buildAbout(userModel),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildName(UserModel user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            'Email : ${user.email}',
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildAbout(UserModel user) => Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Phone No : ${user.phoneNo}',
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
        ],
      ));
}
