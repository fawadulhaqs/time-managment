import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timemanagment/Models/CollectiveModel.dart';
import 'package:timemanagment/constans/Colors.dart';

class SingleCard extends StatelessWidget {
  SingleCard({Key key, this.collectiveModel}) : super(key: key);
  final CollectiveModel collectiveModel;

  @override
  Widget build(BuildContext context) {
    DateTime dt = DateTime.fromMicrosecondsSinceEpoch(
        collectiveModel.date.microsecondsSinceEpoch);
    var formatedDate = DateFormat.yMMMd().format(dt);
    print('date is${DateFormat.yMMMd().format(dt)}');
    var soapDiff = collectiveModel.actTimeSoap;

    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 30,
                width: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: CustomColors.myBlue.withOpacity(0.7)),
                child: Center(
                    child: Text(
                  'Date : $formatedDate',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
              _singleitem('Shift', collectiveModel.shift),
              SizedBox(
                height: 10,
              ),
              _singleitem('Pan', collectiveModel.panlNo),
              SizedBox(
                height: 10,
              ),
              _singleitem('Boiler', collectiveModel.boilNo),
              SizedBox(
                height: 10,
              ),
              _singleitem('Base', collectiveModel.base),
              SizedBox(
                height: 10,
              ),
              _singleitem('Sample', collectiveModel.sampleNo),
              SizedBox(
                height: 10,
              ),
              _singleitem('SapTime Diff', '$soapDiff/180 min'),
              SizedBox(
                height: 10,
              ),
              _singleitem(
                  'CirTime Diff', '${collectiveModel.actTimeCir}/90 min'),
              Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: CustomColors.myBlue.withOpacity(0.7)),
                child: Center(
                    child: Text(
                  'Operator : ${collectiveModel.operator}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _singleitem(String name, dynamic data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(color: CustomColors.myBlue, fontSize: 19),
              ),
              SizedBox(
                width: 200,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data,
                style: TextStyle(color: CustomColors.myBlue, fontSize: 19),
              ),
            ],
          )
        ],
      ),
    );
  }
}
