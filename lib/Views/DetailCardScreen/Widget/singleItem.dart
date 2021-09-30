import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timemanagment/CRUD/Update.dart';
import 'package:timemanagment/Controller/CollectiveController/CollectiveController.dart';
import 'package:timemanagment/Models/CollectiveModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:timemanagment/constans/Colors.dart';

class SingleCard extends StatefulWidget {
  SingleCard({Key key, this.collectiveModel}) : super(key: key);
  final CollectiveModel collectiveModel;

  @override
  _SingleCardState createState() => _SingleCardState();
}

class _SingleCardState extends State<SingleCard> {
  final collectiveController = Get.put(CollectiveController());
  TextEditingController log1 = TextEditingController();
  TextEditingController log2 = TextEditingController();
  TextEditingController sap1 = TextEditingController();
  TextEditingController sap2 = TextEditingController();
  TextEditingController cir1 = TextEditingController();
  TextEditingController cir2 = TextEditingController();
  DateTime logendingDate;
  DateTime logstartingDate;
  int overall;
  String boilno;
  DateTime sapendingDate;
  DateTime sapstartingDate;
  int sapoverall=0;
  DateTime cirendingDate;
  DateTime cirstartingDate;
  int ciroverall;
  int water1;
  int water2;
  int water3;
  int water4;
  int costic2;
  int costic1;
  int costic3;
  int costic4;
  int palm2;
  int palm1;
  int palm3;
  int palm4;
  int hard1;
  int hard2;
  int hard3;
  int hard4;
  int dfa2;
  int dfa1;
  int dfa3;
  int dfa4;
  int pko2;
  int pko1;
  int pko3;
  int pko4;
  int lab2;
  int lab1;
  int lab3;
  int lab4;
  int salt2;
  int salt1;
  int salt3;
  int salt4;
  int sv2;
  int sv1;
  int sv3;
  int sv4;
  int tur2;
  int tur1;
  int tur3;
  int tur4;
  int waterAll;
  int costicAll;
  int palmAll;
  int hardAll;
  int dfaAll;
  int pkoAll;
  int labAll;
  int saltAll;
  int svAll;
  int turAll;
  double fatAll;
  String logSample;
  String fatCharge;
  crudeMethods crudObj=new crudeMethods();

  Future<bool> _updateLogDialog(BuildContext context, selectedDoc){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return SingleChildScrollView(
            child: AlertDialog(
              title: Text('Update Log', style: TextStyle(fontSize: 15)),
              content: Column(
                children: [
                  TextFormField(

                    controller: log1,
                    focusNode: AlwaysDisabledFocusNode(),
                    onTap: () async {
                      logstartTime(context);
                    },
                    decoration: InputDecoration(labelText: '${widget.collectiveModel.startTime} Start Time'),
                  ),
                  TextFormField(
                    controller: log2,
                    focusNode: AlwaysDisabledFocusNode(),
                    onTap: () async {
                      logendTime(context);
                    },
                    decoration: InputDecoration(labelText: '${widget.collectiveModel.endTime} End Time'),
                  ),
                  TextFormField(
                    initialValue: '${widget.collectiveModel.boilNo}',
                    decoration: InputDecoration(hintText: '${widget.collectiveModel.boilNo}',labelText: 'Boiler No.'),
                    onChanged: (value){
                      this.boilno = value?? 0;
                    },
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                      setState(() {
                        final timeTaken = logendingDate
                            .difference(logstartingDate)
                            .inMinutes;
                        overall=timeTaken;
                        crudObj.updateData(selectedDoc, {
                          'LogStartTime': this.log1.text,
                          'LogEndTime': this.log2.text,
                          'OverAllTime': this.overall,
                          'LogBoilNo': this.boilno
                        }).then((result){

                        }).catchError((e) {
                          print(e);
                        });
                      });
                    },
                    child: Text('Update')),
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel')),
              ],
            ),
          );
        }
    );
  }
  Future<bool> _updateSapDialog(BuildContext context, selectedDoc){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return SingleChildScrollView(
            child: AlertDialog(
              title: Text('Update Info', style: TextStyle(fontSize: 15)),
              content: Column(
                children: [
                  TextFormField(
                    // initialValue: '${collectiveModel.startTimeSoap}',
                    controller: sap1,
                    focusNode: AlwaysDisabledFocusNode(),
                    onTap: () async {
                      sapstartTime(context);
                    },
                    decoration: InputDecoration(labelText: '${widget.collectiveModel.startTimeSoap} Sap Start Time'),
                  ),
                  TextFormField(
                    // initialValue: '${collectiveModel.endTimeSoap}',
                    controller: sap2,
                    focusNode: AlwaysDisabledFocusNode(),
                    onTap: () async {
                      sapendTime(context);
                    },
                    decoration: InputDecoration(labelText: '${widget.collectiveModel.endTimeSoap} Sap End Time'),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                      final timeTaken = sapendingDate
                          .difference(sapstartingDate)
                          .inMinutes;
                      sapoverall=timeTaken;
                      crudObj.updateData(selectedDoc, {
                        'SapStartTime': this.sap1.text,
                        'SapEndTime': this.sap2.text,
                        'SapActTime': this.sapoverall,
                      }).then((result){

                      }).catchError((e) {
                        print(e);
                      });
                    },
                    child: Text('Update')),
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel')),
              ],
            ),
          );
        }
    );
  }
  Future<bool> _updateCirDialog(BuildContext context, selectedDoc){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return SingleChildScrollView(
            child: AlertDialog(
              title: Text('Update Info', style: TextStyle(fontSize: 15)),
              content: Column(
                children: [
                  TextFormField(
                    // initialValue: '${collectiveModel.startTimeCir}',
                    controller: cir1,
                    focusNode: AlwaysDisabledFocusNode(),
                    onTap: () async {
                      cirstartTime(context);
                    },
                    decoration: InputDecoration(labelText: '${widget.collectiveModel.startTimeCir} Cir. Start Time'),
                  ),
                  TextFormField(
                    // initialValue: '${collectiveModel.endTimeCir}',
                    controller: cir2,
                    focusNode: AlwaysDisabledFocusNode(),
                    onTap: () async {
                      cirendTime(context);
                    },
                    decoration: InputDecoration(labelText: '${widget.collectiveModel.endTimeCir} Cir. End Time'),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                      final timeTaken = cirendingDate
                          .difference(cirstartingDate)
                          .inMinutes;
                      ciroverall=timeTaken;
                      crudObj.updateData(selectedDoc, {
                        'CirStartTime': this.cir1.text,
                        'CirEndTime': this.cir2.text,
                        'CirActTIme': this.ciroverall
                      }).then((result){

                      }).catchError((e) {
                        print(e);
                      });
                    },
                    child: Text('Update')),
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel')),
              ],
            ),
          );
        }
    );
  }
  Future<bool> _updateWaterDialog(BuildContext context, selectedDoc){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return SingleChildScrollView(
            child: AlertDialog(
              title: Text('Water Quantity', style: TextStyle(fontSize: 15)),
              content: Container(
                width: 400,
                height: 100,
                child: Column(
                  children: [
                    Row(
                    children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: '${widget.collectiveModel.water1st}',
                        decoration: InputDecoration(hintText: '${widget.collectiveModel.water1st}',labelText: 'Water 1st Phase'),
                        onChanged: (value){
                          this.water1=int.tryParse(value);
                        },
                      ),
                    ),
                      SizedBox(width: 2),
                    Expanded(
                      child: TextFormField(
                        initialValue: '${widget.collectiveModel.water2nd}',
                        decoration: InputDecoration(hintText: '${widget.collectiveModel.water2nd}',labelText: 'Water 2nd Phase'),
                        onChanged: (value){
                          this.water2=int.tryParse(value);
                        },
                      ),
                    ),
                      SizedBox(width: 2),
                    Expanded(
                      child: TextFormField(
                        initialValue: '${widget.collectiveModel.watercir}',
                        decoration: InputDecoration(hintText: '${widget.collectiveModel.watercir}',labelText: 'Water Circulation Correction'),
                        onChanged: (value){
                          this.water3=int.tryParse(value);
                        },
                      ),
                    ),
                    SizedBox(width: 2),
                    Expanded(
                      child: TextFormField(
                        initialValue: '${widget.collectiveModel.watercor}',
                        decoration: InputDecoration(hintText: '${widget.collectiveModel.watercor}',labelText: 'Water Actual Correction'),
                        onChanged: (value){
                          this.water4=int.tryParse(value);
                        },
                      ),
                    ),
                    ]
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                      setState(() {
                        waterAll=water1+water2+water3+water4;
                        crudObj.updateData(selectedDoc, {
                          'Water_1st': this.water1,
                          'Water_2nd': this.water2,
                          'Water_Cir': this.water3,
                          'Water_Cor': this.water4,
                          'Water_All': this.waterAll,
                        }).then((result){

                        }).catchError((e) {
                          print(e);
                        });
                      });
                    },
                    child: Text('Update')),
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel')),
              ],
            ),
          );
        }
    );
  }
  Future<bool> _updateCosticDialog(BuildContext context, selectedDoc){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return SingleChildScrollView(
            child: AlertDialog(
              title: Text('Caustic Quantity', style: TextStyle(fontSize: 15)),
              content: Container(
                width: 400,
                height: 100,
                child: Column(
                  children: [
                    Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.costic1st}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.costic1st}',labelText: 'caustic 1st Phase'),
                              onChanged: (value){
                                this.costic1=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.costic2nd}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.costic2nd}',labelText: 'caustic 2nd Phase'),
                              onChanged: (value){
                                this.costic2=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.costiccir}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.costiccir}',labelText: 'caustic Circulation Correction'),
                              onChanged: (value){
                                this.costic3=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.costiccor}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.costiccor}',labelText: 'caustic Actual Correction'),
                              onChanged: (value){
                                this.costic4=int.tryParse(value);
                              },
                            ),
                          ),
                        ]
                    ),
                  ],
                ),

              ),
              actions: <Widget>[
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                      costicAll=costic1+costic2+costic3+costic4;
                      crudObj.updateData(selectedDoc, {
                        'Caustic_1st': this.costic1,
                        'Caustic_2nd': this.costic2,
                        'Caustic_Cir': this.costic3,
                        'Caustic_Cor': this.costic4,
                        'Caustic_All': this.costicAll,
                      }).then((result){

                      }).catchError((e) {
                        print(e);
                      });
                    },
                    child: Text('Update')),
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel')),
              ],
            ),
          );
        }
    );
  }
  Future<bool> _updatePalmDialog(BuildContext context, selectedDoc){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return SingleChildScrollView(
            child: AlertDialog(
              title: Text('Palm Oil Quantity', style: TextStyle(fontSize: 15)),
              content: Container(
                width: 400,
                height: 100,
                child: Column(
                  children: [
                    Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.palm1st}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.palm1st}',labelText: 'Palm 1st Phase'),
                              onChanged: (value){
                                this.palm1=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.palm2nd}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.palm2nd}',labelText: 'Palm 2nd Phase'),
                              onChanged: (value){
                                this.palm2=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.palmcir}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.palmcir}',labelText: 'Palm Circulation Correction'),
                              onChanged: (value){
                                this.palm3=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.palmcor}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.palmcor}',labelText: 'Palm Actual Correction'),
                              onChanged: (value){
                                this.palm4=int.tryParse(value);
                              },
                            ),
                          ),
                        ]
                    ),
                  ],
                ),

              ),
              actions: <Widget>[
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                      palmAll=palm1+palm2+palm3+palm4;
                      fatAll=(palmAll+hardAll+dfaAll+pkoAll+labAll)/1000;
                      crudObj.updateData(selectedDoc, {
                        'Palm_Oil_1st': this.palm1,
                        'Palm_Oil_2nd': this.palm2,
                        'Palm_Oil_Cir': this.palm3,
                        'Palm_Oil_Cor': this.palm4,
                        'Palm_Oil_All': this.palmAll,
                      }).then((result){

                      }).catchError((e) {
                        print(e);
                      });
                    },
                    child: Text('Update')),
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel')),
              ],
            ),
          );
        }
    );
  }
  Future<bool> _updateHardDialog(BuildContext context, selectedDoc){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return SingleChildScrollView(
            child: AlertDialog(
              title: Text('Hard ST Quantity', style: TextStyle(fontSize: 15)),
              content: Container(
                width: 400,
                height: 100,
                child: Column(
                  children: [
                    Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.hard1st}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.hard1st}',labelText: 'Hard ST 1st Phase'),
                              onChanged: (value){
                                this.hard1=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.hard2nd}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.hard2nd}',labelText: 'Hard ST 2nd Phase'),
                              onChanged: (value){
                                this.hard2=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.hardcir}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.hardcir}',labelText: 'Hard ST Circulation Correction'),
                              onChanged: (value){
                                this.hard3=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.hardcor}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.hardcor}',labelText: 'Hard ST Actual Correction'),
                              onChanged: (value){
                                this.hard4=int.tryParse(value);
                              },
                            ),
                          ),
                        ]
                    ),
                  ],
                ),

              ),
              actions: <Widget>[
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                      hardAll=hard1+hard2+hard3+hard4;
                      fatAll=(palmAll+hardAll+dfaAll+pkoAll+labAll)/1000;
                      crudObj.updateData(selectedDoc, {
                        'Hard_ST_1st': this.hard1,
                        'Hard_ST_2nd': this.hard2,
                        'Hard_ST_Cir': this.hard3,
                        'Hard_ST_Cor': this.hard4,
                        'Hard_ST_All': this.hardAll,
                      }).then((result){

                      }).catchError((e) {
                        print(e);
                      });
                    },
                    child: Text('Update')),
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel')),
              ],
            ),
          );
        }
    );
  }
  Future<bool> _updateDFADialog(BuildContext context, selectedDoc){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return SingleChildScrollView(
            child: AlertDialog(
              title: Text('Lauric/DFA Quantity', style: TextStyle(fontSize: 15)),
              content: Container(
                width: 400,
                height: 100,
                child: Column(
                  children: [
                    Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.dfa1st}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.dfa1st}',labelText: 'Lauric 1st Phase'),
                              onChanged: (value){
                                this.dfa1=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.dfa2nd}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.dfa2nd}',labelText: 'Lauric 2nd Phase'),
                              onChanged: (value){
                                this.dfa2=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.dfacir}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.dfacir}',labelText: 'Lauric Circulation Correction'),
                              onChanged: (value){
                                this.dfa3=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.dfacor}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.dfacor}',labelText: 'Lauric Actual Correction'),
                              onChanged: (value){
                                this.dfa4=int.tryParse(value);
                              },
                            ),
                          ),
                        ]
                    ),
                  ],
                ),

              ),
              actions: <Widget>[
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                      dfaAll=dfa1+dfa2+dfa3+dfa4;
                      fatAll=(palmAll+hardAll+dfaAll+pkoAll+labAll)/1000;
                      crudObj.updateData(selectedDoc, {
                        'Lauric_DFA_1st': this.dfa1,
                        'Lauric_DFA_2nd': this.dfa2,
                        'Lauric_DFA_Cir': this.dfa3,
                        'Lauric_DFA_Cor': this.dfa4,
                        'Lauric_DFA_All': this.dfaAll,
                      }).then((result){

                      }).catchError((e) {
                        print(e);
                      });
                    },
                    child: Text('Update')),
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel')),
              ],
            ),
          );
        }
    );
  }
  Future<bool> _updatePKODialog(BuildContext context, selectedDoc){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return SingleChildScrollView(
            child: AlertDialog(
              title: Text('PKO Quantity', style: TextStyle(fontSize: 15)),
              content: Container(
                width: 400,
                height: 100,
                child: Column(
                  children: [
                    Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.pko1st}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.pko1st}',labelText: 'PKO 1st Phase'),
                              onChanged: (value){
                                this.pko1=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.pko2nd}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.pko2nd}',labelText: 'PKO 2nd Phase'),
                              onChanged: (value){
                                this.pko2=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.pkocir}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.pkocir}',labelText: 'PKO Circulation Correction'),
                              onChanged: (value){
                                this.pko3=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.pkocor}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.pkocor}',labelText: 'PKO Actual Correction'),
                              onChanged: (value){
                                this.pko4=int.tryParse(value);
                              },
                            ),
                          ),
                        ]
                    ),
                  ],
                ),

              ),
              actions: <Widget>[
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                      pkoAll=pko1+pko2+pko3+pko4;
                      fatAll=(palmAll+hardAll+dfaAll+pkoAll+labAll)/1000;
                      crudObj.updateData(selectedDoc, {
                        'PKO_1st': this.pko1,
                        'PKO_2nd': this.pko2,
                        'PKO_Cir': this.pko3,
                        'PKO_Cor': this.pko4,
                        'PKO_All': this.pkoAll,
                      }).then((result){

                      }).catchError((e) {
                        print(e);
                      });
                    },
                    child: Text('Update')),
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel')),
              ],
            ),
          );
        }
    );
  }
  Future<bool> _updateLabDialog(BuildContext context, selectedDoc){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return SingleChildScrollView(
            child: AlertDialog(
              title: Text('Labsa Quantity', style: TextStyle(fontSize: 15)),
              content: Container(
                width: 400,
                height: 100,
                child: Column(
                  children: [
                    Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.lab1st}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.lab1st}',labelText: 'Labsa 1st Phase'),
                              onChanged: (value){
                                this.lab1=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.lab2nd}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.lab2nd}',labelText: 'Labsa 2nd Phase'),
                              onChanged: (value){
                                this.lab2=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.labcir}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.labcir}',labelText: 'Labsa Circulation Correction'),
                              onChanged: (value){
                                this.lab3=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.labcor}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.labcor}',labelText: 'Labsa Actual Correction'),
                              onChanged: (value){
                                this.lab4=int.tryParse(value);
                              },
                            ),
                          ),
                        ]
                    ),
                  ],
                ),

              ),
              actions: <Widget>[
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                      labAll=lab1+lab2+lab3+lab4;
                      fatAll=(palmAll+hardAll+dfaAll+pkoAll+labAll)/1000;
                      crudObj.updateData(selectedDoc, {
                        'Labsa_1st': this.lab1,
                        'Labsa_2nd': this.lab2,
                        'Labsa_Cir': this.lab3,
                        'Labsa_Cor': this.lab4,
                        'Labsa_All': this.labAll,
                      }).then((result){

                      }).catchError((e) {
                        print(e);
                      });
                    },
                    child: Text('Update')),
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel')),
              ],
            ),
          );
        }
    );
  }
  Future<bool> _updateSaltDialog(BuildContext context, selectedDoc){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return SingleChildScrollView(
            child: AlertDialog(
              title: Text('Salt Quantity', style: TextStyle(fontSize: 15)),
              content: Container(
                width: 400,
                height: 100,
                child: Column(
                  children: [
                    Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.salt1st}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.salt1st}',labelText: 'Salt 1st Phase'),
                              onChanged: (value){
                                this.salt1=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.salt2nd}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.salt2nd}',labelText: 'Salt 2nd Phase'),
                              onChanged: (value){
                                this.salt2=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.saltcir}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.saltcir}',labelText: 'Salt Circulation Correction'),
                              onChanged: (value){
                                this.salt3=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.saltcor}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.saltcor}',labelText: 'Salt Actual Correction'),
                              onChanged: (value){
                                this.salt4=int.tryParse(value);
                              },
                            ),
                          ),
                        ]
                    ),
                  ],
                ),

              ),
              actions: <Widget>[
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                      saltAll=salt1+salt2+salt3+salt4;
                      crudObj.updateData(selectedDoc, {
                        'Salt_1st': this.salt1,
                        'Salt_2nd': this.salt2,
                        'Salt_Cir': this.salt3,
                        'Salt_Cor': this.salt4,
                        'Salt_All': this.saltAll,
                      }).then((result){

                      }).catchError((e) {
                        print(e);
                      });
                    },
                    child: Text('Update')),
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel')),
              ],
            ),
          );
        }
    );
  }
  Future<bool> _updateSvDialog(BuildContext context, selectedDoc){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return SingleChildScrollView(
            child: AlertDialog(
              title: Text('Sodium Versence Quantity', style: TextStyle(fontSize: 15)),
              content: Container(
                width: 400,
                height: 100,
                child: Column(
                  children: [
                    Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.sv1st}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.sv1st}',labelText: 'Sodium 1st Phase'),
                              onChanged: (value){
                                this.sv1=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.sv2nd}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.sv2nd}',labelText: 'Sodium 2nd Phase'),
                              onChanged: (value){
                                this.sv2=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.svcir}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.svcir}',labelText: 'Sodium Circulation Correction'),
                              onChanged: (value){
                                this.sv3=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.svcor}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.svcor}',labelText: 'Sodium Actual Correction'),
                              onChanged: (value){
                                this.sv4=int.tryParse(value);
                              },
                            ),
                          ),
                        ]
                    ),
                  ],
                ),

              ),
              actions: <Widget>[
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                      svAll=sv1+sv2+sv3+sv4;
                      crudObj.updateData(selectedDoc, {
                        'Sodium_Versence_1st': this.sv1,
                        'Sodium_Versence_2nd': this.sv2,
                        'Sodium_Versence_Cir': this.sv3,
                        'Sodium_Versence_Cor': this.sv4,
                        'Sodium_Versence_All': this.svAll,
                      }).then((result){

                      }).catchError((e) {
                        print(e);
                      });
                    },
                    child: Text('Update')),
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel')),
              ],
            ),
          );
        }
    );
  }
  Future<bool> _updateTurDialog(BuildContext context, selectedDoc){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return SingleChildScrollView(
            child: AlertDialog(
              title: Text('Turpinol Quantity', style: TextStyle(fontSize: 15)),
              content: Container(
                width: 400,
                height: 100,
                child: Column(
                  children: [
                    Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.tur1st}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.tur1st}',labelText: 'Turpinol 1st Phase'),
                              onChanged: (value){
                                this.tur1=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.tur2nd}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.tur2nd}',labelText: 'Turpinol 2nd Phase'),
                              onChanged: (value){
                                this.tur2=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.turcir}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.turcir}',labelText: 'Turpinol Circulation Correction'),
                              onChanged: (value){
                                this.tur3=int.tryParse(value);
                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              initialValue: '${widget.collectiveModel.turcor}',
                              decoration: InputDecoration(hintText: '${widget.collectiveModel.turcor}',labelText: 'Turpinol Actual Correction'),
                              onChanged: (value){
                                this.tur4=int.tryParse(value);
                              },
                            ),
                          ),
                        ]
                    ),
                  ],
                ),

              ),
              actions: <Widget>[
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                      turAll=tur1+tur2+tur3+tur4;
                      crudObj.updateData(selectedDoc, {
                        'Turpinol_1st': this.tur1,
                        'Turpinol_2nd': this.tur2,
                        'Turpinol_Cir': this.tur3,
                        'Turpinol_Cor': this.tur4,
                        'Turpinol_All': this.turAll,
                      }).then((result){

                      }).catchError((e) {
                        print(e);
                      });
                    },
                    child: Text('Update')),
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel')),
              ],
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime dt = DateTime.fromMicrosecondsSinceEpoch(
        widget.collectiveModel.date.microsecondsSinceEpoch);
    var formatedDate = DateFormat.yMMMd().format(dt);
    print('date is${DateFormat.yMMMd().format(dt)}');
    var soapDiff = widget.collectiveModel.actTimeSoap;
    // log1.text=collectiveModel.startTime;
    // log2.text=collectiveModel.endTime;
    // sap1.text=collectiveModel.startTimeSoap;
    // sap2.text=collectiveModel.endTimeSoap;
    // cir1.text=collectiveModel.startTimeCir;
    // cir2.text=collectiveModel.endTimeCir;
    boilno=widget.collectiveModel.boilNo;
    overall=widget.collectiveModel.overall;

    water1=widget.collectiveModel.water1st;
    water2=widget.collectiveModel.water2nd;
    water3=widget.collectiveModel.watercir;
    water4=widget.collectiveModel.watercor;
    costic1=widget.collectiveModel.costic1st;
    costic2=widget.collectiveModel.costic2nd;
    costic3=widget.collectiveModel.costiccir;
    costic4=widget.collectiveModel.costiccor;
    palm1=widget.collectiveModel.palm1st;
    palm2=widget.collectiveModel.palm2nd;
    palm3=widget.collectiveModel.palmcir;
    palm4=widget.collectiveModel.palmcor;
    hard1=widget.collectiveModel.hard1st;
    hard2=widget.collectiveModel.hard2nd;
    hard3=widget.collectiveModel.hardcir;
    hard4=widget.collectiveModel.hardcor;
    dfa1=widget.collectiveModel.dfa1st;
    dfa2=widget.collectiveModel.dfa2nd;
    dfa3=widget.collectiveModel.dfacir;
    dfa4=widget.collectiveModel.dfacor;
    pko1=widget.collectiveModel.pko1st;
    pko2=widget.collectiveModel.pko2nd;
    pko3=widget.collectiveModel.pkocir;
    pko4=widget.collectiveModel.pkocor;
    lab1=widget.collectiveModel.lab1st;
    lab2=widget.collectiveModel.lab2nd;
    lab3=widget.collectiveModel.labcir;
    lab4=widget.collectiveModel.lab2nd;
    salt1=widget.collectiveModel.salt1st;
    salt2=widget.collectiveModel.salt2nd;
    salt3=widget.collectiveModel.saltcir;
    salt4=widget.collectiveModel.saltcor;
    sv1=widget.collectiveModel.sv1st;
    sv2=widget.collectiveModel.sv2nd;
    sv3=widget.collectiveModel.svcir;
    sv4=widget.collectiveModel.svcor;
    tur1=widget.collectiveModel.tur1st;
    tur2=widget.collectiveModel.tur2nd;
    tur3=widget.collectiveModel.turcir;
    tur4=widget.collectiveModel.turcor;



    waterAll=widget.collectiveModel.waterAll;
    costicAll=widget.collectiveModel.costicAll;
    palmAll=widget.collectiveModel.palmAll;
    hardAll=widget.collectiveModel.hardAll;
    dfaAll=widget.collectiveModel.dfaAll;
    pkoAll=widget.collectiveModel.pkoAll;
    labAll=widget.collectiveModel.labAll;
    saltAll=widget.collectiveModel.saltAll;
    svAll=widget.collectiveModel.svAll;
    turAll=widget.collectiveModel.turAll;
    fatAll=widget.collectiveModel.fatChange;




    Future<void> _cupertinoDialog() async {
       await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: const Text('Delete'),
              content: Text("Press Yes If You Want To Delete whole log.."),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.of(context).pop();
                    crudObj.deleteData(widget.collectiveModel.id);

                  },

                  child: const Text('Yes'),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context, "No");
                  },
                  child: const Text('No'),
                ),
              ],
            );
          }
       );
    }
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: CustomColors.myBlue),
          backgroundColor: CustomColors.white,
          elevation: 2.0,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(60))),
          title: Text(
            'DETAILS',
            style: TextStyle(color: CustomColors.myBlue, fontSize: 25),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8,0,20,0),
              child: IconButton(onPressed: (){
                setState(() {
                  _cupertinoDialog();
                });
              }, icon: Icon(Icons.delete,
                color: CustomColors.myBlue,
                size: 30,
              )
              ),
            )
          ],
          centerTitle: true,
        ),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                      elevation: 10,
                      child: Padding(
                        padding: EdgeInsets.zero,
                        child: Container(
                          // height: 750,
                          // width: 1000,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.black.withOpacity(0.7)),
                                    child: Center(
                                        child: Text(
                                          '${widget.collectiveModel.operator}',
                                          style: TextStyle(color: Colors.white, fontSize: 20),
                                        )),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.black.withOpacity(0.7)),
                                    child: Center(
                                        child: Text(
                                          'Date : $formatedDate',
                                          style: TextStyle(color: Colors.white, fontSize: 20),
                                        )),
                                  ),
                                  Container(
                                    alignment: Alignment.topRight,
                                    child: TextButton(

                                      onPressed: (){
                                        _cupertinoDialog();
                                        },

                                      child: Text('Delete',style: TextStyle(color: Colors.blue,fontSize: 18)

                                      ),

                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Expanded(
                                    child: Card(
                                      elevation: 10,
                                      child: Container(
                                        height: 410,
                                        child: Column(
                                          children: [
                                            SizedBox(height: 10),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(15,0,0,0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      child: Container(
                                                        child: Text('Log Information',
                                                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                                        ),
                                                      )
                                                  ),
                                                  Expanded(
                                                      child: Container(
                                                          child: TextButton(
                                                              onPressed: (){
                                                                _updateLogDialog(context, widget.collectiveModel.id);
                                                              }, child: Text('Edit',
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                color: Colors.blue
                                                            ),
                                                          )
                                                          )
                                                      )
                                                  )
                                                ],
                                              ),
                                            ),
                                            ListTile(
                                              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                              title: new Text("Shift",
                                                  style: new TextStyle(

                                                      fontSize: 17.0)),
                                              trailing: new Text(
                                                  "${widget.collectiveModel.shift}",
                                                  style: new TextStyle(
                                                      fontSize: 17.0)),
                                            ),
                                            ListTile(
                                              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                              title: new Text("Pan No",
                                                  style: new TextStyle(

                                                      fontSize: 17.0)),
                                              trailing: new Text(
                                                  "${widget.collectiveModel.panlNo}",
                                                  style: new TextStyle(
                                                      fontSize: 17.0)),
                                            ),
                                            ListTile(
                                              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                              title: new Text("Boiler No.",
                                                  style: new TextStyle(

                                                      fontSize: 17.0)),
                                              trailing: new Text(
                                                  "${widget.collectiveModel.boilNo}",
                                                  style: new TextStyle(
                                                      fontSize: 17.0)),
                                            ),
                                            ListTile(
                                              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                              title: new Text("Base No.",
                                                  style: new TextStyle(

                                                      fontSize: 17.0)),
                                              trailing: new Text(
                                                  "${widget.collectiveModel.base}",
                                                  style: new TextStyle(
                                                      fontSize: 17.0)),
                                            ),
                                            ListTile(
                                              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                              title: new Text("Sample No",
                                                  style: new TextStyle(

                                                      fontSize: 17.0)),
                                              trailing: new Text(
                                                  "${widget.collectiveModel.sampleNo}",
                                                  style: new TextStyle(
                                                      fontSize: 17.0)),
                                            ),
                                            ListTile(
                                              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                              title: new Text("Fat Charge",
                                                  style: new TextStyle(

                                                      fontSize: 17.0)),
                                              trailing: new Text(
                                                  "${widget.collectiveModel.fatChange}",
                                                  style: new TextStyle(
                                                      fontSize: 17.0)),
                                            ),
                                            ListTile(
                                              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                              title: new Text("Cir. Time",
                                                  style: new TextStyle(

                                                      fontSize: 17.0)),
                                              trailing: new Text(
                                                  "${widget.collectiveModel.actTimeCir}/120 min",
                                                  style: new TextStyle(
                                                      fontSize: 17.0)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Card(
                                      elevation: 10,
                                      child: Column(
                                        children: [
                                          SizedBox(height: 10),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(15,0,0,0),
                                            child: Row(
                                              children: [

                                                Expanded(
                                                    child: Container(
                                                      child: Text('Quantity of Ingredients',
                                                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                                      ),
                                                    )
                                                ),
                                              ],
                                            ),
                                          ),
                                          ListTile(
                                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                            title: new Text("Water",
                                                style: new TextStyle(

                                                    fontSize: 17.0)),
                                            subtitle: new Text('1st ${widget.collectiveModel.water1st} kg/2nd ${widget.collectiveModel.water2nd} kg/Circulation ${widget.collectiveModel.watercir} kg/Actual ${widget.collectiveModel.watercor} kg'),
                                            trailing: new TextButton(onPressed: (){
                                              _updateWaterDialog(context, widget.collectiveModel.id);
                                              }
                                              , child: Text('Edit')
                                            )
                                          ),
                                          Divider(height: 0),
                                          ListTile(
                                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                            title: new Text("Caustic",
                                                style: new TextStyle(

                                                    fontSize: 17.0)),
                                            subtitle: new Text('1st ${widget.collectiveModel.costic1st} kg/2nd ${widget.collectiveModel.costic2nd} kg/Circulation ${widget.collectiveModel.costiccir} kg/Actual ${widget.collectiveModel.costiccor} kg'),
                                            trailing: new TextButton(onPressed: (){_updateCosticDialog(context, widget.collectiveModel.id);}, child: Text('Edit')),
                                          ),
                                          Divider(height: 0),
                                          ListTile(
                                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                            title: new Text("Palm Oil",
                                                style: new TextStyle(

                                                    fontSize: 17.0)),
                                            subtitle: new Text('1st ${widget.collectiveModel.palm1st} kg/2nd ${widget.collectiveModel.palm2nd} kg/Circulation ${widget.collectiveModel.palmcir} kg/Actual ${widget.collectiveModel.palmcor} kg'),
                                            trailing: new TextButton(onPressed: (){_updatePalmDialog(context, widget.collectiveModel.id);}, child: Text('Edit')),
                                          ),
                                          ListTile(
                                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                            title: new Text("Hard ST",
                                                style: new TextStyle(

                                                    fontSize: 17.0)),
                                            subtitle: new Text('1st ${widget.collectiveModel.hard1st} kg/2nd ${widget.collectiveModel.hard2nd} kg/Circulation ${widget.collectiveModel.hardcir} kg/Actual ${widget.collectiveModel.hardcor} kg'),
                                            trailing: new TextButton(onPressed: (){_updateHardDialog(context, widget.collectiveModel.id);}, child: Text('Edit')),
                                          ),
                                          Divider(height: 0),
                                          ListTile(
                                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                            title: new Text("Lauric/Dfa",
                                                style: new TextStyle(

                                                    fontSize: 17.0)),
                                            subtitle: new Text('1st ${widget.collectiveModel.dfa1st} kg/2nd ${widget.collectiveModel.dfa2nd} kg/Circulation ${widget.collectiveModel.dfacir} kg/Actual ${widget.collectiveModel.dfacor} kg'),
                                            trailing: new TextButton(onPressed: (){_updateDFADialog(context, widget.collectiveModel.id);}, child: Text('Edit')),
                                          ),
                                          Divider(height: 0),
                                          ListTile(
                                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                            title: new Text("PKO",
                                                style: new TextStyle(

                                                    fontSize: 17.0)),
                                            subtitle: new Text('1st ${widget.collectiveModel.pko1st} kg/2nd ${widget.collectiveModel.pko2nd} kg/Circulation ${widget.collectiveModel.pkocir} kg/Actual ${widget.collectiveModel.pkocor} kg'),
                                            trailing: new TextButton(onPressed: (){_updatePKODialog(context, widget.collectiveModel.id);}, child: Text('Edit')),
                                          ),
                                          Divider(height: 0),
                                          ListTile(
                                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                            title: new Text("Labsa",
                                                style: new TextStyle(

                                                    fontSize: 17.0)),
                                            subtitle: new Text('1st ${widget.collectiveModel.lab1st} kg/2nd ${widget.collectiveModel.lab2nd} kg/Circulation ${widget.collectiveModel.labcir} kg/Actual ${widget.collectiveModel.labcor} kg'),
                                            trailing: new TextButton(onPressed: (){_updateLabDialog(context, widget.collectiveModel.id);}, child: Text('Edit')),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                  child: TextButton(
                                                    onPressed: (){
                                                      _updateSaltDialog(context, widget.collectiveModel.id);
                                                    },
                                                    child: Text('Salt ${widget.collectiveModel.saltAll} Kg'),
                                                  )
                                              ),
                                              Expanded(
                                                  child: TextButton(
                                                    onPressed: (){
                                                      _updateSvDialog(context, widget.collectiveModel.id);
                                                    },
                                                    child: Text('Sodium Versence ${widget.collectiveModel.svAll} Kg'),
                                                  )
                                              ),
                                              Expanded(
                                                  child: TextButton(
                                                    onPressed: (){
                                                      _updateTurDialog(context, widget.collectiveModel.id);
                                                    },
                                                    child: Text('Turpinol ${widget.collectiveModel.turAll} Kg'),
                                                  )
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Card(
                                      elevation: 10,
                                      child: Column(
                                        children: [
                                          SizedBox(height: 10),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(15,0,0,0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    child: Container(
                                                      child: Text('Saponification',
                                                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                                      ),
                                                    )
                                                ),
                                                Expanded(
                                                    child: Container(
                                                      child: TextButton(
                                                          onPressed: (){
                                                            _updateSapDialog(context, widget.collectiveModel.id);
                                                          }, child: Text('Edit',
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            color: Colors.blue
                                                        ),
                                                      )
                                                      )
                                                    )
                                                )
                                              ],
                                            ),
                                          ),
                                          ListTile(
                                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                            title: new Text("Sap Start Time",
                                                style: new TextStyle(

                                                    fontSize: 17.0)),
                                            trailing: new Text(
                                                "${widget.collectiveModel.startTimeSoap}",
                                                style: new TextStyle(
                                                    fontSize: 17.0)),
                                          ),
                                          ListTile(
                                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                            title: new Text("Sap End Time",
                                                style: new TextStyle(

                                                    fontSize: 17.0)),
                                            trailing: new Text(
                                                "${widget.collectiveModel.endTimeSoap}",
                                                style: new TextStyle(
                                                    fontSize: 17.0)),
                                          ),
                                          ListTile(
                                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                            title: new Text("Sap Std. Time",
                                                style: new TextStyle(

                                                    fontSize: 17.0)),
                                            trailing: new Text(
                                                "${widget.collectiveModel.stdTimeSoap}",
                                                style: new TextStyle(
                                                    fontSize: 17.0)),
                                          ),
                                          ListTile(
                                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                            title: new Text("Sap Time",
                                                style: new TextStyle(

                                                    fontSize: 17.0)),
                                            trailing: new Text(
                                                "$soapDiff/180 min",
                                                style: new TextStyle(
                                                    fontSize: 17.0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Card(
                                      elevation: 10,
                                      child: Column(
                                        children: [
                                          SizedBox(height: 10),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(15,0,0,0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    child: Container(
                                                      child: Text('Circulation',
                                                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                                      ),
                                                    )
                                                ),
                                                Expanded(
                                                    child: Container(
                                                        child: TextButton(
                                                            onPressed: (){
                                                              _updateCirDialog(context, widget.collectiveModel.id);
                                                            }, child: Text('Edit',
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              color: Colors.blue
                                                          ),
                                                        )
                                                        )
                                                    )
                                                )
                                              ],
                                            ),
                                          ),
                                          ListTile(
                                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                            title: new Text("Cir. Start Time",
                                                style: new TextStyle(

                                                    fontSize: 17.0)),
                                            trailing: new Text(
                                                "${widget.collectiveModel.startTimeCir}",
                                                style: new TextStyle(
                                                    fontSize: 17.0)),
                                          ),
                                          ListTile(
                                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                            title: new Text("Cir. End Time",
                                                style: new TextStyle(

                                                    fontSize: 17.0)),
                                            trailing: new Text(
                                                "${widget.collectiveModel.endTimeCir}",
                                                style: new TextStyle(
                                                    fontSize: 17.0)),
                                          ),
                                          ListTile(
                                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                            title: new Text("Cir Std. Time",
                                                style: new TextStyle(

                                                    fontSize: 17.0)),
                                            trailing: new Text(
                                                "${widget.collectiveModel.stdTimeCir}",
                                                style: new TextStyle(
                                                    fontSize: 17.0)),
                                          ),
                                          ListTile(
                                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                            title: new Text("Cir. Time Taken",
                                                style: new TextStyle(

                                                    fontSize: 17.0)),
                                            trailing: new Text(
                                                "${widget.collectiveModel.actTimeCir}/90 min",
                                                style: new TextStyle(
                                                    fontSize: 17.0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )


      );

  }

  DateTime logformattedTime;

  logstartTime(BuildContext context) async {
    TimeOfDay pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      print(pickedTime.format(context)); //output 10:51 PM
      DateTime parsedTime =
      DateFormat.jm().parse(pickedTime.format(context).toString());
      //converting to DateTime so that we can further format on different pattern.
      print(parsedTime); //output 1970-01-01 22:53:00.000
      logformattedTime = parsedTime;
      print(logformattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.
      logstartingDate = logformattedTime;

      log1.text = DateFormat('hh:mm aa').format(logformattedTime);

      //  startingDate=formattedTime;
    } else{
      print("Time is not selected");
    }
  }

  logendTime(BuildContext context) async {
    TimeOfDay pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      print(pickedTime.format(context)); //output 10:51 PM
      DateTime parsedTime =
      DateFormat.jm().parse(pickedTime.format(context).toString());
      //converting to DateTime so that we can further format on different pattern.
      print(parsedTime); //output 1970-01-01 22:53:00.000
      logformattedTime = parsedTime;
      print(logformattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.
      logendingDate = logformattedTime;
      log2.text = DateFormat('hh:mm aa').format(logformattedTime);

      //  startingDate=formattedTime;
    } else {
      print("Time is not selected");
    }
  }

  DateTime sapformattedTime;

  sapstartTime(BuildContext context) async {
    TimeOfDay pickedTime = await showTimePicker(

      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      print(pickedTime.format(context)); //output 10:51 PM
      DateTime parsedTime =
      DateFormat.jm().parse(pickedTime.format(context).toString());
      //converting to DateTime so that we can further format on different pattern.
      print(parsedTime); //output 1970-01-01 22:53:00.000
      sapformattedTime = parsedTime;
      print(sapformattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.
      sapstartingDate = sapformattedTime;

      sap1.text = DateFormat('hh:mm aa').format(sapformattedTime);

      //  startingDate=formattedTime;
    } else {
      print("Time is not selected");
    }
  }

  sapendTime(BuildContext context) async {
    TimeOfDay pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      print(pickedTime.format(context)); //output 10:51 PM
      DateTime parsedTime =
      DateFormat.jm().parse(pickedTime.format(context).toString());
      //converting to DateTime so that we can further format on different pattern.
      print(parsedTime); //output 1970-01-01 22:53:00.000
      logformattedTime = parsedTime;
      print(logformattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.
      sapendingDate = logformattedTime;

      sap2.text = DateFormat('hh:mm aa').format(logformattedTime);

      //  startingDate=formattedTime;
    } else {
      print("Time is not selected");
    }
  }

  DateTime cirformattedTime;

  cirstartTime(BuildContext context) async {
    TimeOfDay pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      print(pickedTime.format(context)); //output 10:51 PM
      DateTime parsedTime =
      DateFormat.jm().parse(pickedTime.format(context).toString());
      //converting to DateTime so that we can further format on different pattern.
      print(parsedTime); //output 1970-01-01 22:53:00.000
      logformattedTime = parsedTime;
      print(logformattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.
      cirstartingDate = logformattedTime;

      cir1.text = DateFormat('hh:mm aa').format(logformattedTime);

      //  startingDate=formattedTime;
    } else {
      print("Time is not selected");
    }
  }

  cirendTime(BuildContext context) async {
    TimeOfDay pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      print(pickedTime.format(context)); //output 10:51 PM
      DateTime parsedTime =
      DateFormat.jm().parse(pickedTime.format(context).toString());
      //converting to DateTime so that we can further format on different pattern.
      print(parsedTime); //output 1970-01-01 22:53:00.000
      logformattedTime = parsedTime;
      print(logformattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.
      cirendingDate = logformattedTime;

      cir2.text = DateFormat('hh:mm aa').format(logformattedTime);

      //  startingDate=formattedTime;
    } else {
      print("Time is not selected");
    }
  }
}
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}




