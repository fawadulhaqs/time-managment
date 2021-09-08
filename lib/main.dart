import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Controller/Bindings/binding.dart';
import 'package:timemanagment/Views/SplashScreen/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AuthBinding(),
      title: 'Time Analysis',
      theme: ThemeData(
        fontFamily: 'OfficialBook',
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
