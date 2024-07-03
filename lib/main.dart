import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase_flutter2/one/auth.dart';
import 'package:login_firebase_flutter2/one/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: auth(),
    );
  }
}
