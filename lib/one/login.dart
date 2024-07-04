import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase_flutter2/one/home.dart';
import 'package:login_firebase_flutter2/one/sinUp_screens.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  /////////////////////////////////////////////////////////

  final _email = TextEditingController();
  final _password = TextEditingController();
  //
  Future login() async {
    if (check_enter_user()) {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text.trim(), password: _password.text.trim());
      Get.off(const home());
    } else {
      return showModalBottomSheet(
        context: context,
        builder: (context) {
          return const SizedBox(
            height: 300,
            width: double.infinity,
            child: Expanded(
              child: Center(
                  child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "لم تقم باضافة البريد الالكتروني حاول مجددا",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              )),
            ),
          );
        },
      );
    }
  }

//
  // ignore: non_constant_identifier_names
  bool check_enter_user() {
    if (_email.text.trim() != "" && _password.text.trim() != "") {
      return true;
    } else {
      return false;
    }
  }

  //
  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  //
  // ignore: non_constant_identifier_names
  void go_to_signUP() {
    Get.off(const sinUp_screens());
  }

  //////______________________________________________________________________
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                width: 200,
                child: Image.asset("assets/foxx.jpg"),
              ),
              const Center(child: Text("Login")),

              //

              Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    hintText: "Eimel",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 13, 12, 22), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 106, 143, 158), width: 2),
                    ),
                  ),
                ),
              ),
              //password
              Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  controller: _password,
                  decoration: InputDecoration(
                    hintText: "password",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 13, 12, 22), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 106, 143, 158), width: 2),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            //login
            child: ElevatedButton(
                onPressed: () {
                  login();
                },
                child: const Text("log in")),
          ),
          //

          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text("Don't have an account?"),

            //

            TextButton(
                onPressed: () {
                  Get.to(const sinUp_screens());
                },
                child: const Text(
                  " Sign Up",
                  style: TextStyle(fontSize: 15),
                )),
          ])
        ],
      ),
    );
  }

  //________________________________________________
}
