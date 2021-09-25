import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Controller/CollectiveController/CollectiveController.dart';
import 'package:timemanagment/constans/Colors.dart';

import 'Widgets/tabel_widget.dart';

class TableMianScreen extends StatelessWidget {
  TableMianScreen({Key key}) : super(key: key);
   final collectiveController = Get.put(CollectiveController());

  @override
  Widget build(BuildContext context) {
     collectiveController.per=0.0;
     collectiveController.noDelay=0;
     collectiveController.delay=0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: CustomColors.myBlue),
        backgroundColor: CustomColors.white,
        elevation: 2.0,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(60))),
        title: Text(
          'Welcome',
          style: TextStyle(color: CustomColors.myBlue, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: GetX<CollectiveController>(
        init: Get.put<CollectiveController>(CollectiveController()),
        builder: (CollectiveController collectiveController)
        {
          if (collectiveController != null &&
              collectiveController.log != null) {
            return Container(
              height: size.height / 1.1,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                     print('percentage issssssssss ${collectiveController.per}');
                    return DetailsInTabel(
                      model: collectiveController.log[index]);

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
    );
  }
}
