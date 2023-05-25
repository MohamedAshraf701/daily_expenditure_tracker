import 'dart:convert';

import 'package:daily_expenditure_tracker/models/types.dart';
import 'package:daily_expenditure_tracker/models/userModel.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  // Create a FirebaseFirestore instance.
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<typeModel> types = [];
  List<userModel> users = [];
  @override
  void onInit() {
    getdata();
  }

  getdata() async {
    QuerySnapshot snapshot = await firestore.collection("types").get();
    // Iterate over the QuerySnapshot object to access the data from the documents.
    for (DocumentSnapshot document in snapshot.docs) {
      // Print the data from the document.
      Map<String, dynamic> map = document.data() as Map<String, dynamic>;
      types.add(typeModel(
          id: int.parse(map['id'].toString() ?? ""),
          name: map["name"].toString()));
      print("data:::::::${map}");
    }
    QuerySnapshot usersnapshot = await firestore.collection("users").get();
    // Iterate over the QuerySnapshot object to access the data from the documents.
    for (DocumentSnapshot document in usersnapshot.docs) {
      // Print the data from the document.
      Map<String, dynamic> map = document.data() as Map<String, dynamic>;
      users.add(userModel(
          id: int.parse(map['id'].toString() ?? ""),
          username: map["username"].toString(),
          password: map["password"].toString()));
      print("data:::::::${map}");
    }
  }
}
