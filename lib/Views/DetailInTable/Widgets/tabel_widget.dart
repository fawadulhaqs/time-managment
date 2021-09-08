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
  List<CollectiveModel> collectiveModel;
  final collectiveController = Get.put(CollectiveController());

  @override
  Widget build(BuildContext context) {
    return ScrollableWidget(child: buildDataTable());
  }

  Widget buildDataTable() {
    final columns = [
      'Date',
      'Shift',
      'Pan',
      'Base',
      'Boiler',
      'Operator',
      'Sample',
      'Sap. Losses',
      'Cir. Losses',
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
        // int saptimediifernce= user.actTimeSoap-180;
        //List<CommonModel> mylist = com;
        DateTime dt = DateTime.fromMicrosecondsSinceEpoch(
            user.date.microsecondsSinceEpoch);
        var formatedDate = DateFormat.yMMMd().format(dt);
        final cells = [
          formatedDate,
          user.shift,
          user.panlNo,
          user.base,
          user.boilNo,
          user.operator,
          user.sampleNo,
          user.downTimeLossSoap,
          user.downTimeLossCir,
          '${user.overall} min/330 min',
        ];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            return DataCell(
                Text(
                  '$cell ',
                  style: TextStyle(fontSize: 16),
                ), onTap: () {
              Get.snackbar('Tap', 'You tapped on $cell');
            });
          }),
        );
      }).toList();
}
