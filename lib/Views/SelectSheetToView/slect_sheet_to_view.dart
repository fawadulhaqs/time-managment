import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Views/DetailCardScreen/detail_card_screen.dart';
import 'package:timemanagment/Views/DetailInTable/tabel_main_screen.dart';
import 'package:timemanagment/Views/welcomScreen/welcome_screen.dart';
import 'package:timemanagment/Views/welcomScreen/widget/drawers.dart';
import 'package:timemanagment/constans/Colors.dart';

class SelectSheetToView extends StatelessWidget {
  const SelectSheetToView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: CustomColors.myBlue),
        backgroundColor: CustomColors.white,
        elevation: 2.0,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(60))),
        title: Text(
          'Click to view',
          style: TextStyle(color: CustomColors.myBlue, fontSize: 25),
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 7,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ))),
                  onPressed: () {
                    Get.to(() => TableMianScreen());
                  },
                  child: Text('View Data in Sheet',
                      style: TextStyle(fontSize: 18))),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
              width: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 7,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ))),
                  onPressed: () {
                    Get.to(() => DetailCardScreen());
                  },
                  child: Text('View Data in card',
                      style: TextStyle(fontSize: 18))),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
              width: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 7,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ))),
                  onPressed: () {
                    Get.off(() => WelcomeScreen());
                  },
                  child: Text(
                    'Return to MainScreen',
                    style: TextStyle(fontSize: 18),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
