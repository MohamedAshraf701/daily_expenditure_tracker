import 'dart:async';

import 'package:daily_expenditure_tracker/Screens/Navigationbar.dart';
import 'package:daily_expenditure_tracker/Utils/Constant.dart';
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
        Get.off(navigationScrenn());
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
