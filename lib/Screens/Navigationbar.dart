// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:daily_expenditure_tracker/Controllers/navigationController.dart';
import 'package:daily_expenditure_tracker/Utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class navigationScrenn extends GetView<NavigationController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<NavigationController>(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Appcolors.backgroundColor,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  size.HeightSpace(10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      size.WidthSpace(15),
                      Image.asset(
                        "assets/home_logo.png",
                        height: 45,
                      )
                    ],
                  ),
                  size.HeightSpace(20),
                  Expanded(child: controller.screens[controller.selectedIndex])
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: controller.selectedIndex,
                selectedItemColor: Colors.white,
                onTap: (value) {
                  controller.selctedIndexChange(value);
                },
                unselectedItemColor: Appcolors.buttonColor,
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.add_business_rounded), label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.tornado_outlined), label: ""),
                ],
                backgroundColor: Appcolors.backgroundColor),
          );
        });
  }
}
