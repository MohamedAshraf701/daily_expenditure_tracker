import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_expenditure_tracker/Controllers/navigationController.dart';
import 'package:daily_expenditure_tracker/models/Textcontrolerrmodel.dart';
import 'package:daily_expenditure_tracker/models/transactions.dart';
import 'package:daily_expenditure_tracker/models/userModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Utils/Constant.dart';

class homeScreenController extends GetxController {
  bool Loader = false;
  TextEditingController priceController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<txtController> nameController = [];
  String selectedValue = "";
  double val = 0.0;
  List<userModel> checkBoxList = [];
  List<transactions> transactionsList = [];
  DateTime selectedDate = DateTime.now();
  int totalAMountofPayer = 0;
  Map<String, dynamic> owenedMoney = {};
  Map<String, dynamic> pendingMoney = {};
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

  clear() {
    userModel user = userModel(
        username: box.read("username"),
        password: box.read("password"),
        id: int.parse(box.read("id").toString() ?? ""));

    nameController.clear();
    val = 0.0;
    checkBoxList.clear();

    TextEditingController cont = TextEditingController();
    nameController.add(txtController(controller: cont, id: user.id!));
    priceController.text = '';
    checkBoxList.add(user);
    selectedDate = DateTime.now();
    update();
  }

  getlist() async {
    Loader = true;
    update();
    userModel user = userModel(
        username: box.read("username"),
        password: box.read("password"),
        id: int.parse(box.read("id").toString() ?? ""));
    QuerySnapshot snapshot = await firestore.collection("transactions").get();
    // Iterate over the QuerySnapshot object to access the data from the documents.
    for (DocumentSnapshot document in snapshot.docs) {
      // Print the data from the document.
      Map<String, dynamic> map = document.data() as Map<String, dynamic>;

      //print("datatatata:::::${}");
      transactions tr = transactions(
        createdAt: map['createdAt'].toString(),
        date: map['date'].toString(),
        participants: map['participants'].toList(),
        payer: map['payer'].toString(),
        payments: map['payments'],
        total: map['total'].toString(),
        type: map['type'].toString(),
      );
      if (DateTime.parse(tr.date).month == DateTime.now().month)
        transactionsList.add(tr);

      print("data:::::::${map}");
    }
    getOwedAmount(transactionsList, user);
    // List<transactions> temp2 = transactionsList.where((element) {
    //   for (int i = 0; i < element.participants.length; i++) {
    //     if (element.participants[i].toString().toLowerCase() ==
    //         user.username?.toLowerCase()) {
    //       return true;
    //     }
    //   }
    //   return false;
    // }).toList();
    getPendingamount(transactionsList, user);
    Loader = false;
    update();
  }

  getPendingamount(List<transactions> temp, userModel user) {
    temp.forEach((element) {
      element.participants.forEach((element1) {
        if (element1.toString().toLowerCase() == user.username?.toLowerCase() &&
            element.payer.toLowerCase() != user.username?.toLowerCase()) {
          if (pendingMoney.containsKey(element.payer)) {
            print("wwwwwwwww:::::::$element");
            pendingMoney.update(element.payer, (value) {
              print(value.toString());
              double val = double.parse(value);
              double secval =
                  double.parse(element.payments[element1.toString()]);
              print((val + secval).toString());

              return (val + secval).toString();
            });
          } else {
            pendingMoney.addAll(
                {element.payer.toString(): element.payments[user.username]});
          }
        }
      });
    });
  }

  getOwedAmount(List<transactions> temp, userModel user) {
    temp.forEach((element) {
      totalAMountofPayer = totalAMountofPayer + int.parse(element.total ?? "0");
      element.participants.forEach((element1) {
        if (element1.toString().toLowerCase() != user.username?.toLowerCase() &&
            element.payer.toLowerCase() == user.username?.toLowerCase()) {
          if (owenedMoney.containsKey(element1.toString())) {
            owenedMoney.update(element1, (value) {
              print(value.toString());
              double val = double.parse(value);
              double secval =
                  double.parse(element.payments[element1.toString()]);
              print((val + secval).toString());

              return (val + secval).toString();
            });
          } else {
            owenedMoney.addAll(
                {element1.toString(): element.payments[element1.toString()]});
          }
        }
      });
    });
  }

  addData() async {
    NavigationController navController = Get.find<NavigationController>();

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
    navController.Loader = true;
    navController.update();
    try {
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
        "date": DateFormat('yyyy-MM-dd').format(selectedDate),
        "createdAt": DateTime.now().toString()
      };
      await firestore.collection('transactions').add(data);
      clear();
    } catch (e) {
      print(e);
    }
    navController.Loader = false;
    navController.update();
  }

  @override
  void onInit() {
    getlist();
  }
}
