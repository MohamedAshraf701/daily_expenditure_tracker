import 'dart:async';

import 'package:daily_expenditure_tracker/Controllers/HomeScreencontroller.dart';
import 'package:daily_expenditure_tracker/Screens/LoginSCreen.dart';
import 'package:daily_expenditure_tracker/Screens/Navigationbar.dart';
import 'package:daily_expenditure_tracker/Utils/Constant.dart';
import 'package:daily_expenditure_tracker/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'AddExpense.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        var temp = box.read('Login');
        if (temp == true) {
          userModel user = userModel(
              username: box.read("username"),
              password: box.read("password"),
              id: int.parse(box.read("id").toString() ?? ""));
          print("::::::::::${user.id}");
          print("::::::::::${user.username}");
          print("::::::::::${user.password}");
          Get.find<homeScreenController>().checkBoxList.add(user);
          TextEditingController cont = TextEditingController();
          Get.find<homeScreenController>().nameController.add(cont);
          Get.find<homeScreenController>().update();

          Get.off(navigationScrenn());
        } else {
          Get.off(LoginScreen());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      body: Center(
        child: Image.asset(
          "assets/splash_logo.png",
          height: 300,
        ),
      ),
    );
  }
}
