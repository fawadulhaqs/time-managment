import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Controller/CollectiveController/CollectiveController.dart';
import 'package:timemanagment/constans/Colors.dart';

class SecondUi extends StatefulWidget {
  const SecondUi({Key key}) : super(key: key);

  @override
  _SecondUiState createState() => _SecondUiState();
}

class _SecondUiState extends State<SecondUi> {
  final GlobalKey<FormState> _myKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final collectiveController = Get.put(CollectiveController());
    print(collectiveController.sapstartingDate);
    print(collectiveController.sapendingDate);

    final sapDifference = collectiveController.sapendingDate
        .difference(collectiveController.sapstartingDate)
        .inMinutes;

    String stdTime1 = '180';
    collectiveController.sapDiff = sapDifference;
    int sapActual = sapDifference;

    print(collectiveController.cirstartingDate);
    print(collectiveController.cirendingDate);
    final cirDifference = collectiveController.cirendingDate
        .difference(collectiveController.cirstartingDate)
        .inMinutes;
    String stdTime2 = '90';
    collectiveController.cirDiff = cirDifference;
    int cirActual = cirDifference;

    final timeTaken = collectiveController.logendingDate
        .difference(collectiveController.logstartingDate)
        .inMinutes;
    collectiveController.overallTime = timeTaken;


    String water = 'Water';
    String costic = 'Caustic';
    String palm = 'Palm Oil';
    String hard = 'Hard ST';
    String dfa = 'Lauric/DFA';
    String pko = 'PKO';
    String lab = 'Labsa';
    String salt = 'Salt';
    String sv = 'Sodium Versence';
    String tur = 'Turpinol';

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: CustomColors.myBlue),
        backgroundColor: CustomColors.white,
        elevation: 2.0,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(60))),
        title: Text(
          'Log Sheet',
          style: TextStyle(color: CustomColors.myBlue, fontSize: 25),
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.fromLTRB(0, 0, 70, 0),
            icon: Icon(
              Icons.cleaning_services_rounded,
              size: 40,
              color: CustomColors.myBlue,
            ),
            onPressed: () {
              collectiveController.clearfield();
            },
          ),
          IconButton(
            padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
            icon: Icon(
              Icons.save,
              size: 40,
              color: CustomColors.myBlue,
            ),
            tooltip: 'Tap To Clear All Fields',
            onPressed: () {
              collectiveController.onContinue(formKey: _myKey);
              print(collectiveController.waterAll);
              //Get.back();
            },
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Column(children: [
            Form(
              key: _myKey,
              child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Column(children: [
                    Container(
                      child: Text(
                        "LOG's",
                        style:
                        TextStyle(color: CustomColors.myBlue, fontSize: 25),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                style: TextStyle(fontSize: 15),
                                focusNode: AlwaysDisabledFocusNode(),
                                controller: collectiveController.logDate,
                                validator: (value) {
                                  return collectiveController
                                      .validateDate(value);
                                },
                                onTap: () {
                                  collectiveController.selectDate(context);
                                },
                                decoration: InputDecoration(
                                    labelText: 'Date:',
                                    labelStyle: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    border: UnderlineInputBorder()),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                style: TextStyle(fontSize: 15),
                                validator: (value) {
                                  return collectiveController
                                      .validateStartTime(value);
                                },
                                focusNode: AlwaysDisabledFocusNode(),
                                controller: collectiveController.logStartTime,
                                onTap: () {
                                  collectiveController.logstartTime(context);
                                },
                                decoration: InputDecoration(
                                    labelText: 'Start Time:',
                                    labelStyle: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    border: UnderlineInputBorder()),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                style: TextStyle(fontSize: 15),
                                validator: (value) {
                                  return collectiveController
                                      .validateEndingTime(value);
                                },
                                focusNode: AlwaysDisabledFocusNode(),
                                controller: collectiveController.logEndTime,
                                onTap: () async {
                                  collectiveController.logendTime(context);
                                },
                                decoration: InputDecoration(
                                    labelText: 'End Time:',
                                    labelStyle: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    border: UnderlineInputBorder()),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Shift:',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  DropdownButtonFormField(
                                    hint: collectiveController.shiftValue ==
                                        null
                                        ? Text('Select Shift')
                                        : Text(
                                      collectiveController
                                          .shiftValue.value,
                                      style:
                                      TextStyle(color: Colors.black),
                                    ),
                                    isExpanded: true,
                                    iconSize: 20.0,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    items: ['A', 'B', 'C'].map(
                                          (val) {
                                        return DropdownMenuItem<String>(
                                          value: val,
                                          child: Text(val),
                                        );
                                      },
                                    ).toList(),
                                    validator: (value) {
                                      return collectiveController
                                          .validateShift(value);
                                    },
                                    onChanged: (val) {
                                      collectiveController.shiftValue.value =
                                          val;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'Base:',
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  DropdownButtonFormField(
                                    hint: collectiveController.baseValue == null
                                        ? Text('Select Base')
                                        : Text(
                                      collectiveController
                                          .baseValue.value,
                                      style:
                                      TextStyle(color: Colors.black),
                                    ),
                                    isExpanded: true,
                                    iconSize: 20.0,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    items: ['Lux', 'LifeBoy White','LifeBoy Red'].map(
                                          (val) {
                                        return DropdownMenuItem<String>(
                                          value: val,
                                          child: Text(val),
                                        );
                                      },
                                    ).toList(),
                                    validator: (value) {
                                      return collectiveController
                                          .validateBase(value);
                                    },
                                    onChanged: (val) {
                                      collectiveController.baseValue.value =
                                          val;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Boil No.',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    controller: collectiveController.logBoiler,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Boile No:',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    validator: (value) {
                                      return collectiveController
                                          .validateBiloNo(value);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Pan:',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  DropdownButtonFormField(
                                    hint: collectiveController.panValue == null
                                        ? Text('Select Pan No.')
                                        : Text(
                                      collectiveController.panValue.value,
                                      style:
                                      TextStyle(color: Colors.black),
                                    ),
                                    isExpanded: true,
                                    iconSize: 20.0,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    items: ['02', '03', '09', '10', '16', '17']
                                        .map(
                                          (val) {
                                        return DropdownMenuItem<String>(
                                          value: val,
                                          child: Text(val),
                                        );
                                      },
                                    ).toList(),
                                    validator: (value) {
                                      return collectiveController
                                          .validatePanlNo(value);
                                    },
                                    onChanged: (val) {
                                      collectiveController.panValue.value = val;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Container(
                            height: 75,
                            child: Card(
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 2, left: 10),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text('FatCharge',
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                    ),
                                    Text('${collectiveController.fatAll} Tons',
                                        style: TextStyle(
                                          fontSize: 18,
                                        )),


                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'Operator:',
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  DropdownButtonFormField(
                                    hint: collectiveController.operatorValue ==
                                        null
                                        ? Text('Select Operator')
                                        : Text(
                                      collectiveController
                                          .operatorValue.value,
                                      style:
                                      TextStyle(color: Colors.black),
                                    ),
                                    isExpanded: true,
                                    iconSize: 20.0,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    items: [
                                      'Shahzad Ahmed(1416)',
                                      'Ejaz Ahmed(1353)',
                                      'Rashid Iqbal(1395)',
                                      'Abdul Rauf(1315)',
                                      'Zulfiqar Ali(1349)',
                                      'Saifullah Khan(1592)',
                                      'Ali Ashraf(1598)',
                                      'Waqar Khan(1611)',
                                      'M.Ismail(1340)',
                                      'Muhammad Ali(1324)',
                                      'Azizullah(1309)',
                                      'Khlid Mehmood(1330)',
                                      'Yasir Akhtar Shah(1465)',
                                      'Husnain Shah(1604)',
                                      'Fakhar Manzor(1586)',
                                      'Imran Ali(1323)',
                                      'Ajmal Fareed(1322)',
                                      'M.Amir Alam(1305)',
                                      'Salman Mukaram(1635)',
                                      'M.Yousaf(1553)',
                                      'M.Umer Ameen(1577)',
                                      'Jaffar Husain(1462)'
                                    ].map(
                                          (val) {
                                        return DropdownMenuItem<String>(
                                          value: val,
                                          child: Text(val),
                                        );
                                      },
                                    ).toList(),
                                    validator: (value) {
                                      return collectiveController
                                          .validateOperator(value);
                                    },
                                    onChanged: (val) {
                                      collectiveController.operatorValue.value =
                                          val;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Sample#',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    controller: collectiveController.logSample,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Smaple#',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    validator: (value) {
                                      return collectiveController
                                          .validateSampleNo(value);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        'SAPONIFICATION',
                        style:
                        TextStyle(color: CustomColors.myBlue, fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                style: TextStyle(fontSize: 22),
                                validator: (value) {
                                  return collectiveController
                                      .validateStartTime(value);
                                },
                                focusNode: AlwaysDisabledFocusNode(),
                                controller: collectiveController.sapStartTime,
                                onTap: () {
                                  collectiveController.sapstartTime(context);
                                },
                                decoration: InputDecoration(
                                    labelText: 'Start Time:',
                                    labelStyle: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    border: UnderlineInputBorder()),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                style: TextStyle(fontSize: 22),
                                validator: (value) {
                                  return collectiveController
                                      .validateEndingTime(value);
                                },
                                focusNode: AlwaysDisabledFocusNode(),
                                controller: collectiveController.sapEndTime,
                                onTap: () async {
                                  collectiveController.sapendTime(context);
                                },
                                decoration: InputDecoration(
                                    labelText: 'End Time:',
                                    labelStyle: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    border: UnderlineInputBorder()),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(border: Border.all()),
                              child: Center(
                                  child: Text(
                                    'Std Time : $stdTime1 min',
                                    style: TextStyle(fontSize: 18),
                                  )),
                            )),
                        Expanded(
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Center(
                                child: sapDifference == null
                                    ? Text('Loading...')
                                    : Text(
                                  //child text k liye add ki ha variable k liye remove krni ha
                                  'Act. Time : $sapActual min',
                                  style: TextStyle(fontSize: 18),
                                )),
                          ),
                        )
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'DownTime Losses',
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  DropdownButtonFormField(
                                    hint: collectiveController.sapLossesValue ==
                                        null
                                        ? Text('Select Reason')
                                        : Text(
                                      collectiveController
                                          .sapLossesValue.value,
                                      style:
                                      TextStyle(color: Colors.black),
                                    ),
                                    isExpanded: true,
                                    iconSize: 20.0,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    items: [
                                      'None',
                                      '1) Load cell t61 line block',
                                      '2) Load cell t62 line block',
                                      '3) Load cell t5 line block',
                                      '4) Load cell pko line block',
                                      '5) Load cell t61 gasket damage/ actuator malfunction/manual valve leak',
                                      '6) Load cell t62 gasket damage/ actuator malfunction/manual valve leak',
                                      '7) Load cell t5 gasket damage/ actuator malfunction/manual valve leak',
                                      '8) Load cell pko gasket damage/ actuator malfunction/manual valve leak',
                                      '9) Lauric acid line block',
                                      '10) Sru6 pump sealing water low pressure',
                                      '11) Safety interlock of pump due to high pressure',
                                      '12) Safety interlock due to pan 14/15 high level sensor',
                                      '13) Bleached oil unavailability',
                                      '14) High temperature of lauric',
                                      '15) High temperature of PST',
                                      '16) High temperature of Palm oil',
                                      '17) Caustic feed pump problem',
                                      '18) Sap late due to load cell unavailability',
                                      '19) Sap late due to caustic late reaction',
                                      '20) Sap late due to conditions of sap not meeting',
                                      '21) Sap late due to RO water unavailability',
                                      '22) Sap late due to sru 6 pump stuck',
                                      '23) Sap late due to transfer line block',
                                      '24) Sap late due to unavailability of man power',
                                      '25) Sap late due to no power supply',
                                      '26) Sap late due to pan agitator issue',
                                      '27) soap pump liquidation line block',
                                      '28) Pump Blockage',
                                      '29) Pump Mechanical Fault',
                                      '30) Pump Electrical Fault of motor',
                                      '31) Pump Electrical Fault of UFD',
                                      '32) Pump Electrical Fault of safety Switch/ Emergency Switch',
                                      '33) Agitator failure centre/slide',
                                      '34) Sap late due to high Caustic',
                                      '35) Sap late due to low Caustic',
                                      '36) Sap late due to caustic nil'
                                    ].map(
                                          (val) {
                                        return DropdownMenuItem<String>(
                                          value: val,
                                          child: Text(val),
                                        );
                                      },
                                    ).toList(),
                                    validator: (value) {
                                      return collectiveController
                                          .validateLosses(value);
                                    },
                                    onChanged: (val) {
                                      collectiveController
                                          .sapLossesValue.value = val;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Total Time Loss',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    controller: collectiveController.sapTimeLoss,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Time In Minutes',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'Other Losses',
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    controller: collectiveController.sapOtherLoss,

                                    decoration: InputDecoration(

                                      hintText: 'Enter Time In Minutes',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        'CIRCULATION',
                        style:
                        TextStyle(color: CustomColors.myBlue, fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                style: TextStyle(fontSize: 22),
                                validator: (value) {
                                  return collectiveController
                                      .validateStartTime(value);
                                },
                                focusNode: AlwaysDisabledFocusNode(),
                                controller: collectiveController.cirStartTime,
                                onTap: () {
                                  collectiveController.cirstartTime(context);
                                },
                                decoration: InputDecoration(
                                    labelText: 'Start Time:',
                                    labelStyle: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    border: UnderlineInputBorder()),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                style: TextStyle(fontSize: 22),
                                validator: (value) {
                                  return collectiveController
                                      .validateEndingTime(value);
                                },
                                focusNode: AlwaysDisabledFocusNode(),
                                controller: collectiveController.cirEndTime,
                                onTap: () async {
                                  collectiveController.cirendTime(context);
                                },
                                decoration: InputDecoration(
                                    labelText: 'End Time:',
                                    labelStyle: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    border: UnderlineInputBorder()),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(border: Border.all()),
                              child: Center(
                                  child: Text(
                                    'Circulation Std Time: $stdTime2 min',
                                    style: TextStyle(fontSize: 18),
                                  )),
                            )),
                        Expanded(
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Center(
                                child: cirDifference == null
                                    ? Text('Loading...')
                                    : Text(
                                  //child text k liye add ki ha variable k liye remove krni ha
                                  'Circulation Actual Time: $cirActual min',
                                  style: TextStyle(fontSize: 18),
                                )),
                          ),
                        )
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'DownTime Losses',
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  DropdownButtonFormField(
                                    hint: collectiveController.cirLossesValue ==
                                        null
                                        ? Text('Select Reason')
                                        : Text(
                                      collectiveController
                                          .cirLossesValue.value,
                                      style:
                                      TextStyle(color: Colors.black),
                                    ),
                                    isExpanded: true,
                                    iconSize: 20.0,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    items: [
                                      'None',
                                      '1) Load cell t61 line block',
                                      '2) Load cell t62 line block',
                                      '3) Load cell t5 line block',
                                      '4) Load cell pko line block',
                                      '5) Load cell t61 gasket damage/ actuator malfunction/manual valve leak',
                                      '6) Load cell t62 gasket damage/ actuator malfunction/manual valve leak',
                                      '7) Load cell t5 gasket damage/ actuator malfunction/manual valve leak',
                                      '8) Load cell pko gasket damage/ actuator malfunction/manual valve leak',
                                      '9) Lauric acid line block',
                                      '10) Sru6 pump sealing water low pressure',
                                      '11) Safety interlock of pump due to high pressure',
                                      '12) Safety interlock due to pan 14/15 high level sensor',
                                      '13) Bleached oil unavailability',
                                      '14) High temperature of lauric',
                                      '15) High temperature of PST',
                                      '16) High temperature of Palm oil',
                                      '17) Caustic feed pump problem',
                                      '18) Sap late due to load cell unavailability',
                                      '19) Sap late due to caustic late reaction',
                                      '20) Sap late due to conditions of sap not meeting',
                                      '21) Sap late due to RO water unavailability',
                                      '22) Sap late due to sru 6 pump stuck',
                                      '23) Sap late due to transfer line block',
                                      '24) Sap late due to unavailability of man power',
                                      '25) Sap late due to no power supply',
                                      '26) Sap late due to pan agitator issue',
                                      '27) soap pump liquidation line block',
                                      '28) Pump Blockage',
                                      '29) Pump Mechanical Fault',
                                      '30) Pump Electrical Fault of motor',
                                      '31) Pump Electrical Fault of UFD',
                                      '32) Pump Electrical Fault of safety Switch/ Emergency Switch',
                                      '33) Agitator failure centre/slide',
                                      '34) Sap late due to high Caustic',
                                      '35) Sap late due to low Caustic',
                                      '36) Sap late due to caustic nil'
                                    ].map(
                                          (val) {
                                        return DropdownMenuItem<String>(
                                          value: val,
                                          child: Text(val),
                                        );
                                      },
                                    ).toList(),
                                    validator: (value) {
                                      return collectiveController
                                          .validateLosses(value);
                                    },
                                    onChanged: (val) {
                                      collectiveController
                                          .cirLossesValue.value = val;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Total Time Loss',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    controller: collectiveController.cirTimeLoss,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Time In Minutes',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'Other Losses',
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    controller: collectiveController.cirOtherLoss,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Time In Minutes',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        'Quantity of Ingredients',
                        style:
                        TextStyle(color: CustomColors.myBlue, fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            height: 70,
                            //decoration: BoxDecoration(border: Border.all()),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                              child: Center(
                                //child: difference == null?
                                // Text('Loading...')
                                //:
                                  child: Text(
                                    //child text k liye add ki ha variable k liye remove krni ha
                                    '$water',
                                    style: TextStyle(fontSize: 18),
                                  )),
                            ),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(width: 1))),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual 1st Phase',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.water1st,

                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.water1=int.tryParse(value)?? 0;
                                    },
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual 2nd Phase',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.water2nd,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.water2=int.tryParse(value)?? 0;
                                    },
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual Circulation',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.watercir,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.water3=int.tryParse(value)?? 0;
                                    },
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual Correction',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.watercor,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.water4=int.tryParse(value)?? 0;
                                    },
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // //validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: collectiveController.waterAll == null
                                    ? Text('Loading...')
                                    : Text(
                                  //child text k liye add ki ha variable k liye remove krni ha
                                  'Total Weight : ${collectiveController.waterAll} Kg',
                                  style: TextStyle(fontSize: 15),
                                )),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            height: 70,
                            //decoration: BoxDecoration(border: Border.all()),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                              child: Center(
                                //child: difference == null?
                                // Text('Loading...')
                                //:
                                  child: Text(
                                    //child text k liye add ki ha variable k liye remove krni ha
                                    '$costic',
                                    style: TextStyle(fontSize: 18),
                                  )),
                            ),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(width: 1))),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual 1st Phase',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.costic1st,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.costic1=int.tryParse(value)?? 0;
                                    },
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual 2nd Phase',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.costic2nd,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.costic2=int.tryParse(value)?? 0;
                                    },
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual Circulation',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.costiccir,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.costic3=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual Correction',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.costiccor,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.costic4=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: collectiveController.costicAll == null
                                    ? Text('Loading...')
                                    : Text(
                                  //child text k liye add ki ha variable k liye remove krni ha
                                  'Total Weight : ${collectiveController.costicAll} Kg',
                                  style: TextStyle(fontSize: 15),
                                )),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            height: 70,
                            //decoration: BoxDecoration(border: Border.all()),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                              child: Center(
                                //child: difference == null?
                                // Text('Loading...')
                                //:
                                  child: Text(
                                    //child text k liye add ki ha variable k liye remove krni ha
                                    '$palm',
                                    style: TextStyle(fontSize: 18),
                                  )),
                            ),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(width: 1))),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual 1st Phase',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.palm1st,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.palm1=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual 2nd Phase',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.palm2nd,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.palm2=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual Circulation',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.palmcir,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.palm3=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual Correction',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.palmcor,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.palm4=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: collectiveController.palmAll == null
                                    ? Text('Loading...')
                                    : Text(
                                  //child text k liye add ki ha variable k liye remove krni ha
                                  'Total Weight : ${collectiveController.palmAll} Kg',
                                  style: TextStyle(fontSize: 15),
                                )),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            height: 70,
                            //decoration: BoxDecoration(border: Border.all()),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                              child: Center(
                                //child: difference == null?
                                // Text('Loading...')
                                //:
                                  child: Text(
                                    //child text k liye add ki ha variable k liye remove krni ha
                                    '$hard',
                                    style: TextStyle(fontSize: 18),
                                  )),
                            ),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(width: 1))),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual 1st Phase',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.hard1st,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.hard1=int.tryParse(value)?? 0;
                                    },
                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual 2nd Phase',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.hard2nd,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.hard2=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual Circulation',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.hardcir,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.hard3=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual Correction',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.hardcor,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.hard4=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: collectiveController.hardAll == null
                                    ? Text('Loading...')
                                    : Text(
                                  //child text k liye add ki ha variable k liye remove krni ha
                                  'Total Weight : ${collectiveController.hardAll} Kg',
                                  style: TextStyle(fontSize: 15),
                                )),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            height: 70,
                            //decoration: BoxDecoration(border: Border.all()),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                              child: Center(
                                //child: difference == null?
                                // Text('Loading...')
                                //:
                                  child: Text(
                                    //child text k liye add ki ha variable k liye remove krni ha
                                    '$dfa',
                                    style: TextStyle(fontSize: 18),
                                  )),
                            ),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(width: 1))),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual 1st Phase',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.dfa1st,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.dfa1=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual 2nd Phase',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.dfa2nd,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.dfa2=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual Circulation',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.dfacir,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.dfa3=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual Correction',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.dfacor,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.dfa4=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: collectiveController.dfaAll == null
                                    ? Text('Loading...')
                                    : Text(
                                  //child text k liye add ki ha variable k liye remove krni ha
                                  'Total Weight : ${collectiveController.dfaAll} Kg',
                                  style: TextStyle(fontSize: 15),
                                )),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            height: 70,
                            //decoration: BoxDecoration(border: Border.all()),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                              child: Center(
                                //child: difference == null?
                                // Text('Loading...')
                                //:
                                  child: Text(
                                    //child text k liye add ki ha variable k liye remove krni ha
                                    '$pko',
                                    style: TextStyle(fontSize: 18),
                                  )),
                            ),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(width: 1))),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual 1st Phase',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.pko1st,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.pko1=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual 2nd Phase',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.pko2nd,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.pko2=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual Circulation',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.pkocir,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.pko3=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual Correction',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.pkocor,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.pko4=int.tryParse(value)?? 0;
                                    },
                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: collectiveController.pkoAll == null
                                    ? Text('Loading...')
                                    : Text(
                                  //child text k liye add ki ha variable k liye remove krni ha
                                  'Total Weight : ${collectiveController.pkoAll} Kg',
                                  style: TextStyle(fontSize: 15),
                                )),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            height: 70,
                            //decoration: BoxDecoration(border: Border.all()),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                              child: Center(
                                //child: difference == null?
                                // Text('Loading...')
                                //:
                                  child: Text(
                                    //child text k liye add ki ha variable k liye remove krni ha
                                    '$lab',
                                    style: TextStyle(fontSize: 18),
                                  )),
                            ),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(width: 1))),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual 1st Phase',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.lab1st,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.lab1=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual 2nd Phase',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.lab2nd,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.lab2=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual Circulation',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.labcir,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.lab3=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual Correction',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.labcor,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.lab4=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: collectiveController.labAll == null
                                    ? Text('Loading...')
                                    : Text(
                                  //child text k liye add ki ha variable k liye remove krni ha
                                  'Total Weight : ${collectiveController.labAll} Kg',
                                  style: TextStyle(fontSize: 15),
                                )),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            height: 70,
                            //decoration: BoxDecoration(border: Border.all()),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                              child: Center(
                                //child: difference == null?
                                // Text('Loading...')
                                //:
                                  child: Text(
                                    //child text k liye add ki ha variable k liye remove krni ha
                                    '$salt',
                                    style: TextStyle(fontSize: 18),
                                  )),
                            ),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(width: 1))),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual 1st Phase',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.salt1st,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.salt1=int.tryParse(value)?? 0;
                                    },
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual 2nd Phase',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.salt2nd,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.salt2=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual Circulation',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.saltcir,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.salt3=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual Correction',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.saltcor,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.salt4=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: collectiveController.saltAll == null
                                    ? Text('Loading...')
                                    : Text(
                                  //child text k liye add ki ha variable k liye remove krni ha
                                  'Total Weight : ${collectiveController.saltAll} Kg',
                                  style: TextStyle(fontSize: 15),
                                )),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            height: 70,
                            //decoration: BoxDecoration(border: Border.all()),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                              child: Center(
                                //child: difference == null?
                                // Text('Loading...')
                                //:
                                  child: Text(
                                    //child text k liye add ki ha variable k liye remove krni ha
                                    '$sv',
                                    style: TextStyle(fontSize: 18),
                                  )),
                            ),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(width: 1))),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual 1st Phase',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.sv1st,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.sv1=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual 2nd Phase',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.sv2nd,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.sv2=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual Circulation',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.svcir,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.sv3=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual Correction',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.svcor,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.sv4=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: collectiveController.svAll == null
                                    ? Text('Loading...')
                                    : Text(
                                  //child text k liye add ki ha variable k liye remove krni ha
                                  'Total Weight : ${collectiveController.svAll} Kg',
                                  style: TextStyle(fontSize: 15),
                                )),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            height: 70,
                            //decoration: BoxDecoration(border: Border.all()),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                              child: Center(
                                //child: difference == null?
                                // Text('Loading...')
                                //:
                                  child: Text(
                                    //child text k liye add ki ha variable k liye remove krni ha
                                    '$tur',
                                    style: TextStyle(fontSize: 18),
                                  )),
                            ),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(width: 1))),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual 1st Phase',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.tur1st,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.tur1=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual 2nd Phase',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.tur2nd,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.tur2=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual Circulation',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.turcir,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.tur3=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Actual Correction',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: collectiveController.turcor,
                                    decoration: InputDecoration(
                                      hintText: 'Enter in Kg',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    onChanged: (value){
                                      collectiveController.tur4=int.tryParse(value)?? 0;
                                    },

                                    // : Text(
                                    //   homeController.dropDownValue.value,
                                    // style: TextStyle(color: Colors.black),

                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),

                                    // validator: (value) {
                                    //return homeController.validateShift(value);
                                    //},

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: collectiveController.turAll == null
                                    ? Text('Loading...')
                                    : Text(
                                  //child text k liye add ki ha variable k liye remove krni ha
                                  'Total Weight : ${collectiveController.turAll} Kg',
                                  style: TextStyle(fontSize: 15),
                                )),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: RaisedButton(
                              elevation: 10,
                              child: Text("Calculate Quantity of Ingredients"),
                              onPressed : () {


                                setState(() {
                                  collectiveController.waterAll=collectiveController.water1 + collectiveController.water2 + collectiveController.water3 + collectiveController.water4 ;
                                  collectiveController.costicAll=collectiveController.costic1 + collectiveController.costic2 + collectiveController.costic3 + collectiveController.costic4 ;
                                  collectiveController.palmAll=collectiveController.palm1 + collectiveController.palm2 + collectiveController.palm3 + collectiveController.palm4 ;
                                  collectiveController.hardAll=collectiveController.hard1 + collectiveController.hard2 + collectiveController.hard3 + collectiveController.hard4 ;
                                  collectiveController.dfaAll=collectiveController.dfa1 + collectiveController.dfa2 + collectiveController.dfa3 + collectiveController.dfa4 ;
                                  collectiveController.pkoAll=collectiveController.pko1 + collectiveController.pko2 + collectiveController.pko3 + collectiveController.pko4 ;
                                  collectiveController.labAll=collectiveController.lab1 + collectiveController.lab2 + collectiveController.lab3 + collectiveController.lab4 ;
                                  collectiveController.saltAll=collectiveController.salt1 + collectiveController.salt2 + collectiveController.salt3 + collectiveController.salt4 ;
                                  collectiveController.svAll=collectiveController.sv1 + collectiveController.sv2 + collectiveController.sv3 + collectiveController.sv4 ;
                                  collectiveController.turAll=collectiveController.tur1 + collectiveController.tur2 + collectiveController.tur3 + collectiveController.tur4 ;
                                  collectiveController.fatAll=((collectiveController.palmAll+collectiveController.hardAll+
                                  collectiveController.dfaAll+ collectiveController.pkoAll+collectiveController.labAll)/1000);
                                });

                              },
                            )

                        )
                      ],
                    )
                  ])),
            ),
          ]),
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
