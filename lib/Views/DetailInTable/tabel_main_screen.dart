import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Controller/CollectiveController/CollectiveController.dart';
import 'package:timemanagment/constans/Colors.dart';

import 'Widgets/tabel_widget.dart';

class TableMianScreen extends StatelessWidget {
  const TableMianScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        actions: <Widget>[
          IconButton(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              icon: Icon(
                Icons.share,
                color: CustomColors.myBlue,
              ),
              onPressed: () async {
                // var excel = Excel.createExcel();           //create an excel sheet
                //Sheet sheetObject = excel['SheetName'];

                // QuerySnapshot _qs =
                //(await _firestore.collection('logSheetInfo').doc(uid).get()) as QuerySnapshot;

                //for (int i = 0; i < _qs.docs.length; i++) {
                //var cell = sheetObject.cell(CellIndex.indexByString("A" + '$i'));   //i+1 means when the loop iterates every time it will write values in new row, e.g A1, A2, ...
                //cell.value =  _qs.docs[i].data()['names']; // Insert value to selected cell;
//}
              })
        ],
        centerTitle: true,
      ),
      body: GetX<CollectiveController>(
        init: Get.put<CollectiveController>(CollectiveController()),
        builder: (CollectiveController collectiveController) {
          if (collectiveController != null &&
              collectiveController.log != null) {
            return Container(
              height: size.height / 1.1,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return DetailsInTabel(
                      model: collectiveController.log[index],
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
    );
  }
}
