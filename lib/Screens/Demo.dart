// ignore_for_file: prefer_const_constructors

import 'package:daily_expenditure_tracker/Controllers/HomeScreencontroller.dart';
import 'package:daily_expenditure_tracker/Utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/AuthController.dart';

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController auth = Get.find<AuthController>();

    return GetBuilder(
        init: Get.find<homeScreenController>(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Appcolors.backgroundColor,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width(20)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Welcome ${box.read("username")}",
                        style: TextStyle(
                            color: Appcolors.buttonColor, fontSize: 20),
                      ),
                      Text(
                        "${controller.totalAMountofPayer}" + " ₹",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  size.HeightSpace(20),
                  getOwenedMoney(controller),
                  size.HeightSpace(20),
                  getpendingMOney(controller),
                  size.HeightSpace(20),
                  makePayment(controller),
                  size.HeightSpace(20),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     bool check = true;
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     primary: Color(0xFF3FEDB2),
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(10)),
                  //     minimumSize: Size(double.infinity, 50),
                  //     textStyle: TextStyle(color: Colors.white),
                  //   ),
                  //   child: Center(
                  //       child: Padding(
                  //     padding: const EdgeInsets.all(8),
                  //     child: Text(
                  //       'Clear',
                  //       style: TextStyle(fontSize: 18, letterSpacing: 1),
                  //     ),
                  //   )),
                  // ),
                ],
              ),
            ),
          );
        });
  }

  makePayment(homeScreenController controller) {
    List<String> keydata = [];
    List<String> valuedata = [];
    controller.owenedMoney?.forEach((key, value) {
      keydata.add(key);
      valuedata.add((double.parse(controller.pendingMoney[key] ?? "0") -
              double.parse(value))
          .toString());
    });
    double total = 0;
    valuedata.forEach((element) {
      total = total + double.parse(element ?? "0");
    });
    return Column(
      children: [
        size.HeightSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Make Payment",
              style: TextStyle(
                  color: Appcolors.buttonColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              total.toStringAsFixed(2) + " ₹",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
        size.HeightSpace(10),
        for (int i = 0; i < keydata.length; i++)
          Padding(
            padding: EdgeInsets.symmetric(vertical: size.height(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${keydata[i]}",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "${double.parse(valuedata[i]).toStringAsFixed(2)}" + " ₹",
                  style: TextStyle(color: Appcolors.buttonColor, fontSize: 20),
                ),
              ],
            ),
          ),
      ],
    );
  }

  getpendingMOney(homeScreenController controller) {
    List<String> keydata = [];
    List<String> valuedata = [];
    controller.pendingMoney?.forEach((key, value) {
      keydata.add(key);
      valuedata.add(value);
    });
    double total = 0;
    valuedata.forEach((element) {
      total = total + double.parse(element ?? "0");
    });
    return Column(
      children: [
        size.HeightSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Pending Amount",
              style: TextStyle(
                  color: Appcolors.buttonColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              total.toStringAsFixed(2) + " ₹",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
        size.HeightSpace(10),
        for (int i = 0; i < keydata.length; i++)
          Padding(
            padding: EdgeInsets.symmetric(vertical: size.height(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${keydata[i]}",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "${double.parse(valuedata[i]).toStringAsFixed(2)}" + " ₹",
                  style: TextStyle(color: Appcolors.buttonColor, fontSize: 20),
                ),
              ],
            ),
          ),
      ],
    );
  }

  getOwenedMoney(homeScreenController controller) {
    List<String> keydata = [];
    List<String> valuedata = [];
    controller.owenedMoney?.forEach((key, value) {
      keydata.add(key);
      valuedata.add(value);
    });
    double total = 0;
    valuedata.forEach((element) {
      total = total + double.parse(element ?? "0");
    });
    return Column(
      children: [
        size.HeightSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Owed Amount",
              style: TextStyle(
                  color: Appcolors.buttonColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              total.toStringAsFixed(2) + " ₹",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
        size.HeightSpace(10),
        for (int i = 0; i < keydata.length; i++)
          Padding(
            padding: EdgeInsets.symmetric(vertical: size.height(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${keydata[i]}",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "${double.parse(valuedata[i]).toStringAsFixed(2)}" + " ₹",
                  style: TextStyle(color: Appcolors.buttonColor, fontSize: 20),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
