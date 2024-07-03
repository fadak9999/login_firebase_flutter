import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_firebase_flutter2/one/home.dart';
import 'package:login_firebase_flutter2/one/login.dart';

// ignore: camel_case_types
class auth extends StatefulWidget {
  const auth({super.key});

  @override
  State<auth> createState() => _authState();
}

// ignore: camel_case_types
class _authState extends State<auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const home();
          } else {
            return const login();
          }
        },
      ),
    );
  }
}
