import 'package:cloud_firestore/cloud_firestore.dart';

class crudeMethods{

  getData() async{
    return await FirebaseFirestore.instance.collection('logSheetInfo').get();
  }

  updateData(selectedDoc, newValues) async{
    await FirebaseFirestore.instance.collection('logSheetInfo').doc(selectedDoc).update(newValues).catchError((e) {
      print(e);
    });

  }
  deleteData(docId)async{
    await FirebaseFirestore.instance.collection('logSheetInfo').doc(docId).delete().catchError((e) {
      print(e);
    });
  }
}