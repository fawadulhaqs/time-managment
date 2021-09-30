import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Views/Analytics/Analytics.dart';
import 'package:timemanagment/Controller/CollectiveController/CollectiveController.dart';
import 'package:timemanagment/Views/NewUi/SecondUi.dart';
import 'package:timemanagment/Views/SelectSheetToView/slect_sheet_to_view.dart';
import 'package:timemanagment/Views/welcomScreen/widget/drawers.dart';
import 'package:timemanagment/constans/Colors.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

final collectiveControlar = Get.put(CollectiveController());

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Theme(
        data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent,
        shadowColor: Colors.black26),
    child: MyDrawer(),
    ),
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
        //drawer: navigationDrawer(),
        drawerScrimColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.fromLTRB(16,0,16,0),
          child: ListView(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                borderOnForeground: true,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 180.0,
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Image.asset(
                              'assets/images/logsheet.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 16.0,
                            left: 16.0,
                            right: 16.0,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'LOG SHEETS',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ButtonBar(
                      buttonHeight: 100.0,
                      alignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            collectiveControlar.getlist();
                            Get.to(()=> SelectSheetToView());
                            //  Get.snackbar('Lets Go', 'Have a Look at Logs');
                          },
                          child: const Text('VIEW LOGS',style: TextStyle(color: CustomColors.myBlue)),
                        ),
                        TextButton(
                          onPressed: () {
                            //Get.put(CollectiveController());
                            Get.to(() =>SecondUi());
                          },
                          child: const Text('CREATE LOG',style: TextStyle(color: CustomColors.myBlue)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
                height: 40,
                thickness: 1,
                indent: 9,
                endIndent: 9,
                color: Colors.black45),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 180.0,
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Image.asset(
                              'assets/images/new.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            bottom: 16.0,
                            left: 16.0,
                            right: 16.0,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'TIME ANALYSIS',
                                style: TextStyle(color: Colors.black,backgroundColor: Colors.white,fontSize: 25)
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ButtonBar(
                      buttonHeight: 100.0,
                      alignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            collectiveControlar.getlist();
                            Get.to(()=>Analytics());
                          },
                          child: const Text('VIEW ANALYSIS',style: TextStyle(color: CustomColors.myBlue)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
