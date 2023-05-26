import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_expenditure_tracker/models/Textcontrolerrmodel.dart';
import 'package:daily_expenditure_tracker/models/userModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Utils/Constant.dart';

class homeScreenController extends GetxController {
  TextEditingController priceController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<txtController> nameController = [];
  String selectedValue = "";
  double val = 0.0;
  List<userModel> checkBoxList = [];
  String selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  bool checkcontains(userModel user) {
    for (int i = 0; i < checkBoxList.length; i++) {
      if (checkBoxList[i].username?.toLowerCase() ==
              user.username?.toLowerCase() &&
          checkBoxList[i].id == user.id) {
        return true;
      }
    }
    return false;
  }

  addData() {
    if (selectedValue == '' ||
        priceController.text.isEmpty ||
        checkBoxList.isEmpty) {
      Get.snackbar("", "",
          messageText: Text(
            "Please Fill Details",
            style: TextStyle(color: Colors.white),
          ),
          titleText:
              Text("Expensify", style: TextStyle(color: Appcolors.buttonColor)),
          backgroundColor: Appcolors.cardColor,
          borderColor: Appcolors.buttonColor,
          borderWidth: 1);
      return;
    }
    List<String?> participants = checkBoxList.map((e) => e.username).toList();
    Map<String, String> payments = {};
    for (int i = 0; i < participants.length; i++) {
      payments.addAll(
          {participants[i].toString(): nameController[i].controller.text});
    }
    Map<String, dynamic> data = {
      "type": selectedValue,
      "payer": box.read("username"),
      "participants": participants,
      "total": priceController.text,
      "total": priceController.text,
      "payments": payments,
      "date": selectedDate,
      "createdAt": DateTime.now().toString()
    };
    firestore.collection('transactions').add(data);
  }
}
