import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase_flutter2/one/home.dart';
import 'package:login_firebase_flutter2/one/login.dart';

// ignore: camel_case_types
class sinUp_screens extends StatefulWidget {
  const sinUp_screens({super.key});

  @override
  State<sinUp_screens> createState() => _sinUp_screensState();
}

// ignore: camel_case_types
class _sinUp_screensState extends State<sinUp_screens> {
  //
  final name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm_password = TextEditingController();
  //
  Future sinIn() async {
    if (check_enter_user()) {
      if (passwordConfirn()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email.text.trim(), password: _password.text.trim());
        Get.to(home());
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
                    " يوجد اختلاف في الرمز السري",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                )),
              ),
            );
          },
        );
      }
    } else {
      return showBottomSheet(
        context: context,
        builder: (context) {
          return const SizedBox(
            height: 300,
            width: double.infinity,
            child: Center(
              child: Text(
                "لم تقم باضافة كلمة المرور حاول مجددا",
                style: TextStyle(fontSize: 15),
              ),
            ),
          );
        },
      );
    }
  }

//
  bool passwordConfirn() {
    if (_password.text.trim() == _confirm_password.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

//
  bool check_enter_user() {
    if (_email.text.trim() != "" &&
        _password.text.trim() != "" &&
        _confirm_password.text.trim() != "") {
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
    _confirm_password.dispose();
  }

  void go_to_login() {
    Get.to(login());
  }

  ///////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  child: Image.asset("assets/fox2.jpg"),
                ),

                Center(child: Text("Sin Up")),

                //name
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                      hintText: "Name",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 13, 12, 22), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 106, 143, 158),
                            width: 2),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
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
                            color: Color.fromARGB(255, 106, 143, 158),
                            width: 2),
                      ),
                    ),
                  ),
                ),
                //password
                Container(
                  margin: EdgeInsets.all(10),
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
                            color: Color.fromARGB(255, 106, 143, 158),
                            width: 2),
                      ),
                    ),
                  ),
                ),
                //confirm password
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: _confirm_password,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "confirm password",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 13, 12, 22), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 106, 143, 158),
                            width: 2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            //Sing Up
            child: ElevatedButton(
                onPressed: () {
                  sinIn();
                  Get.off(home());
                },
                child: Text("Sing Up")),
          ),
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "I have an account",
                style: TextStyle(fontSize: 15),
              ),
              //
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: go_to_login,
                child: const Text(
                  "Go to login",
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          )
          //
        ],
      ),
    );
  }

  //________________________________________________
}
