import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Views/LoginScreen/LoginScreen.dart';

class LogOutController extends GetxController {
  // final LogOutController instance=Get.find();
  final auth = FirebaseAuth.instance;
  void signOut() async {
    try {
      auth.signOut().then((value) => Get.off(LoginScreen()));
    } catch (e) {
      print(e);
    }
  }
}
