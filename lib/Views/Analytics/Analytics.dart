import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Controller/CollectiveController/CollectiveController.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:timemanagment/constans/Colors.dart';

class Analytics extends StatefulWidget {
  const Analytics({Key key}) : super(key: key);

  @override
  _AnalyticsState createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {

  final collectiveController = Get.put(CollectiveController());
  @override
  Widget build(BuildContext context) {
    final collectiveController = Get.put(CollectiveController());
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: CustomColors.myBlue),
        backgroundColor: CustomColors.white,
        elevation: 2.0,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(60))),
        title: Text(
          'Analysis',
          style: TextStyle(color: CustomColors.myBlue, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: Container(
          color: Colors.white,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[

                  SizedBox(height: 5),
                  Container(
                    child: Text(
                      'Analysis',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 400,
                            // width: 350,

                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: SfRadialGauge(
                                  axes: <RadialAxis>[
                                    RadialAxis(minimum: 0,
                                        maximum: 100,
                                        ranges: <GaugeRange>[
                                          GaugeRange(startValue: 0,
                                              endValue: 33,
                                              color: Colors.red,
                                              startWidth: 10,
                                              endWidth: 10),
                                          GaugeRange(startValue: 33,
                                              endValue: 66,
                                              color: Colors.orange,
                                              startWidth: 10,
                                              endWidth: 10),
                                          GaugeRange(startValue: 66,
                                              endValue: 100,
                                              color: Colors.green,
                                              startWidth: 10,
                                              endWidth: 10)
                                        ],
                                        pointers: <GaugePointer>[
                                          NeedlePointer(
                                            value: collectiveController.per,
                                            enableAnimation: true,
                                            animationDuration: 2500.0,
                                            animationType: AnimationType.elasticOut,
                                          )
                                        ],
                                        annotations: <GaugeAnnotation>[
                                          GaugeAnnotation(widget: Container(child:
                                          Text('${collectiveController.per.toStringAsFixed(2)}%',
                                              style: TextStyle(fontSize: 25,
                                                  fontWeight: FontWeight.bold))),
                                              angle: 90, positionFactor: 0.5)
                                        ]
                                    )
                                  ],
                                  title: GaugeTitle(
                                      text: 'Work Efficiency', textStyle: TextStyle(
                                      fontSize: 20.0, fontWeight: FontWeight.bold))
                              ),

                              color: Colors.white,
                              elevation: 10,
                            ),

                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      // width: 350,

                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: new Container(
                          child: Column(
                            children: [
                              new ListTile(
                                title: new Text("Total Number of Delays",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0)),
                                trailing: new Text(
                                    "${collectiveController.delay}",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0)),
                              ),
                              new ListTile(
                                title: new Text("Total Number of No Delays",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0)),
                                trailing: new Text(
                                    "${collectiveController.noDelay}",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0)),
                              ),
                            ],
                          ),
                        ),
                        color: Colors.white,
                        elevation: 10,


                      ),

                    ),
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            ),
          ),
        ),
      ),


    );
  }

}
