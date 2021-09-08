import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Controller/SinUpController/SigUpController.dart';
import 'package:timemanagment/Models/user_model.dart';

class MyDatabase {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final signUpController=Get.put(SignUpController());


  Future<bool> createUser(UserModel userModel) async {
    try {
      final ref=FirebaseStorage.instance.ref().child('user-images').child(userModel.id);
     await ref.putFile(signUpController.userImage);
      final url=await ref.getDownloadURL();
      await _firestore.collection('myUsers').doc(userModel.id).set({
        'image-url':url,
        'name': userModel.name,
        'email': userModel.email,
        'phoneNo': userModel.phoneNo,
        'password': userModel.password,
        'id': userModel.id,
      });
      Get.back();
      return true;
    } catch (e) {
      print(e);
      Get.snackbar('Error', e.toString());
      return false;
    }
  }

  Future<UserModel> getUser(String uid)async{
   try{
     DocumentSnapshot doc=await _firestore.collection('myUsers').doc(uid).get();
     return UserModel.fromDucumentSnapshot(doc);
   }catch(e){
     print(e);
     rethrow;
   }




  }
}
