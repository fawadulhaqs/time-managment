import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timemanagment/CRUD/Update.dart';
import 'package:timemanagment/Controller/CollectiveController/CollectiveController.dart';
import 'package:timemanagment/Models/CollectiveModel.dart';
import 'package:timemanagment/Views/welcomScreen/widget/drawers.dart';

import '../../constans/Colors.dart';
import 'Widget/singleItem.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key key, this.collectiveModel}) : super(key: key);
  final CollectiveModel collectiveModel;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  crudeMethods crudObj=new crudeMethods();

  Future<List<QueryDocumentSnapshot>> getData()async{
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn= await firestore.collection('logSheetInfo').get();
    return qn.docs;
  }
  // navigateToDetails(DocumentSnapshot logs){
  //   navigator.push(MaterialPageRoute(builder: (context) =>DetailPage(logs: logs) ));
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: getData(),
          builder: (_,snapshot){

        if(snapshot.connectionState== ConnectionState.waiting){
          return Center(
            child: Text('Loading..'),
          );
        } else{
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (_,index){
                DateTime dt = DateTime.fromMicrosecondsSinceEpoch(
                    snapshot.data[index]['LogDate'].microsecondsSinceEpoch);
                var formatedDate = DateFormat.yMMMd().format(dt);
                print(snapshot.data.length);
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8,0,8,0),
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      title: Text('$formatedDate'),
                      // onTap: ()=> navigateToDetails(snapshot.data[index]),
                    ),
                  ),
                );
          });
        }
    }),
    );
  }
}

class MyCard extends StatefulWidget {
  MyCard({Key key, this.collectiveModel}) : super(key: key);
  final CollectiveModel collectiveModel;

  @override
  _MyCardState createState() => _MyCardState();
}
class _MyCardState extends State<MyCard> {

  navigateToDetails(CollectiveModel collectiveModel){
    navigator.push(MaterialPageRoute(builder: (context) =>SingleCard(collectiveModel: collectiveModel) ));
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: ListTile(
        title: new Text('${widget.collectiveModel.turAll}'),
        onTap: (){
          setState(() {
            navigateToDetails(widget.collectiveModel);
          });
        },
      ),
    );
  }
}


class DetailPage extends StatefulWidget {
  const DetailPage({Key key, this.collectiveModel,  }) : super(key: key);
  final CollectiveModel collectiveModel;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
        ),
        body: Container(
          child: Card(
            elevation: 10,
            child: Container(
              child: ListTile(
                title: new Text(widget.collectiveModel.startTime),
                subtitle: new Text(widget.collectiveModel.endTime),
                trailing: new Text(widget.collectiveModel.boilNo),
              ),
            ),
          ),
        )
    );
  }
}



