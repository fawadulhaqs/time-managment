import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timemanagment/Controller/CollectiveController/CollectiveController.dart';
import 'package:timemanagment/Models/CollectiveModel.dart';
import 'package:timemanagment/Views/Utils/utils.dart';

import 'scrolable_widget.dart';

class DetailsInTabel extends StatefulWidget {
  final CollectiveModel model;

  const DetailsInTabel({Key key, this.model}) : super(key: key);

  @override
  _DetailsInTabelState createState() => _DetailsInTabelState();
}

class _DetailsInTabelState extends State<DetailsInTabel> {
  //List<CollectiveModel> collectiveModel;
  final collectiveController = Get.put(CollectiveController());

  @override
  Widget build(BuildContext context) {
    return ScrollableWidget(child: buildDataTable());
  }

  Widget buildDataTable() {
    final columns = [
      'Delay',
      'Date',
      'Shift',
      'Pan',
      'Base',
      'Boiler',
      'Operator',
      'Sample',
      'Saponification Losses',
      'Sap Loss Time',
      'Circulation Losses',
      'Circulation Loss Time',
      'OverAll Time'
    ];

    return DataTable(
      columns: getColumns(
        columns,
      ),
      rows: getRows(collectiveController.log),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(
        label: Text(
          column,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    }).toList();
  }

  List<DataRow> getRows(List<CollectiveModel> log) =>
      log.map((CollectiveModel user) {
        // int i = 0;
        String indicator;
        // int saptimediifernce= user.actTimeSoap-180;
        //List<CommonModel> mylist = com;

        if (user.overall <= 330) {
          indicator = 'No Delay';
          collectiveController.noDelay++;
        } else {
          indicator = 'Delayed ${user.overall - 330} min';
          collectiveController.delay++;
        }
        print(' NO DELAY ${collectiveController.noDelay}');
        print(' DELAY ${collectiveController.delay}');
        collectiveController.per =
        ((collectiveController.noDelay / collectiveController.totalLength) *
            100.0);
        print('percentage ${collectiveController.per}');
        DateTime dt = DateTime.fromMicrosecondsSinceEpoch(
            user.date.microsecondsSinceEpoch);
        var formatedDate = DateFormat.yMMMd().format(dt);
        final cells = [
          indicator,
          formatedDate,
          user.shift,
          user.panlNo,
          user.base,
          user.boilNo,
          user.operator,
          user.sampleNo,
          user.downTimeLossSoap,
          '${user.saptimeLoss} min',
          user.downTimeLossCir,
          '${user.cirtimeLoss} min',
          '${user.overall} min/330 min',
        ];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            if(cell == "No Delay") {
              return DataCell(
                Icon(Icons.check_box ,color: Colors.green),
                onTap: () {
                // Get.snackbar('Tap', 'You tapped on $cell $cells');
              },
              );
            }
            else if(cell == "Delayed ${user.overall - 330} min") {
              return DataCell(

                Icon(
                    Icons.warning ,color: Colors.red),
                onTap: () {
                  Get.snackbar('Delayed','Delayed by ${user.overall - 330} min');
                },
              );
            }
            else{
              return DataCell(
                Text(
                  '$cell ',
                  style: TextStyle(fontSize: 16,color: Colors.black),
                ), onTap: () {
                // Get.snackbar('Tap', 'You tapped on $cell $cells');
              },
              );
            }
          }),
        );
      }
      ).toList();
}
