import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Controller/CollectiveController/CollectiveController.dart';
import 'package:timemanagment/Models/CollectiveModel.dart';
import 'package:timemanagment/Views/welcomScreen/widget/drawers.dart';

import '../../constans/Colors.dart';
import 'TestCard.dart';
import 'Widget/singleItem.dart';

class DetailCardScreen extends StatefulWidget {
  DetailCardScreen({Key key}) : super(key: key);

  @override
  _DetailCardScreenState createState() => _DetailCardScreenState();
}

class _DetailCardScreenState extends State<DetailCardScreen> {
  final collectiveController = Get.put(CollectiveController());

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
        elevation: 3,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(60))),
        title: Text(
          'Detail',
          style: TextStyle(color: CustomColors.myBlue, fontSize: 25),
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body:
      // ListPage()


      SingleChildScrollView(
        child: Column(
          children: [
            GetX<CollectiveController>(
              init: Get.put<CollectiveController>(CollectiveController()),
              builder: (CollectiveController collectiveController) {
                if (collectiveController != null &&
                    collectiveController.log != null) {
                  return SingleChildScrollView(
                    child: Container(
                      height: size.height / 1.2,
                      child: Scrollbar(
                        showTrackOnHover: true,
                        thickness: 10,
                        hoverThickness: 10,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: collectiveController.log.length,
                            itemBuilder: (context, index) {
                              return MyCard(
                                collectiveModel: collectiveController.log[index],

                              );
                            }),
                      ),
                    ),
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
    );
  }
}

