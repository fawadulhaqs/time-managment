import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Models/user_model.dart';

class UserController extends GetxController{
  Rx<UserModel> usermodel=UserModel().obs;
  UserModel get user=>usermodel.value;
  set user(UserModel value)=>this.usermodel.value=value;
  final firestore=FirebaseFirestore.instance;
  // void clear(){
  //   usermodel.value=UserModel();
  // }
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>();

  User get users => _firebaseUser.value;

  @override
  onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

}