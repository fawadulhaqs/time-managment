

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String image;
  String name;
  String id;
  String phoneNo;
  String email;
  String password;
  UserModel({this.name,this.id,this.email,this.password,this.phoneNo});
  UserModel.fromDucumentSnapshot(DocumentSnapshot snapshot){
    image=snapshot.data()['image-url']??"";
    print('Image path: $image');
    id=snapshot.id;
    name=snapshot.data()['name']??"";
    email=snapshot.data()['email']??"";
    phoneNo=snapshot.data()['phoneNo']??"";
    password=snapshot.data()['password']??"";
  }
}