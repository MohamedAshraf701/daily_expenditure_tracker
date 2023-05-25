// ignore_for_file: prefer_const_constructors

import 'package:daily_expenditure_tracker/Controllers/AuthController.dart';
import 'package:daily_expenditure_tracker/Screens/Navigationbar.dart';
import 'package:daily_expenditure_tracker/Utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/userModel.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<userModel> users = Get.find<AuthController>().users;
    return Scaffold(
      backgroundColor: Color(0xFF030405),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                size.HeightSpace(100),
                Image.asset(
                  "assets/splash_logo.png",
                  height: 200,
                ),
                size.HeightSpace(30),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width(15)),
                  decoration: BoxDecoration(
                      color: Appcolors.cardColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      size.HeightSpace(20),
                      Text(
                        "Welcome",
                        style: TextStyle(
                            color: Appcolors.buttonColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      size.HeightSpace(20),
                      TextField(
                        controller: username,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xFF3FEDB2),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xFF3FEDB2),
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xFF3FEDB2),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      size.HeightSpace(20),
                      TextField(
                        controller: password,
                        style: TextStyle(color: Colors.white),
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xFF3FEDB2),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xFF3FEDB2),
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xFF3FEDB2),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      size.HeightSpace(20),
                    ],
                  ),
                ),
                size.HeightSpace(30),
                ElevatedButton(
                  onPressed: () {
                    bool check = true;

                    for (int i = 0; i < users.length; i++) {
                      print("${users[i].username}------${username.text}");
                      print("${users[i].password}------${password.text}");
                      if (users[i].username?.toLowerCase() ==
                              username.text.toLowerCase() &&
                          users[i].password == password.text) {
                        box.write('Login', true);
                        box.write("username", users[i].username);
                        box.write("password", users[i].password);
                        box.write("id", users[i].id);
                        Get.offAll(navigationScrenn());
                        check = false;
                      }
                    }
                    if (username.text.isEmpty ||
                        password.text.isEmpty ||
                        check) {
                      Get.snackbar("", "",
                          messageText: Text(
                            "Please Check Your Credentials",
                            style: TextStyle(color: Colors.white),
                          ),
                          titleText: Text("Expensify",
                              style: TextStyle(color: Appcolors.buttonColor)),
                          backgroundColor: Appcolors.cardColor,
                          borderColor: Appcolors.buttonColor,
                          borderWidth: 1);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF3FEDB2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size(double.infinity, 50),
                    textStyle: TextStyle(color: Colors.white),
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'LogIn',
                      style: TextStyle(fontSize: 18, letterSpacing: 1),
                    ),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
