import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {
  //

  final myaccont = FirebaseAuth.instance.currentUser!;

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
//

                  setState(() {
                    FirebaseAuth.instance.signOut();
                  });

//
                },
                child: Text("تسجيل الخروج")),
            Text(myaccont.email!),
          ],
        ));
  }
}
