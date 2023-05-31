// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:daily_expenditure_tracker/Controllers/HomeScreencontroller.dart';
import 'package:daily_expenditure_tracker/Utils/Constant.dart';
import 'package:daily_expenditure_tracker/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    homeScreenController _controller = Get.find<homeScreenController>();
    return GetBuilder(
        init: _controller,
        builder: (controller) {
          return Scaffold(
            backgroundColor: Appcolors.backgroundColor,
            body: Container(
                margin: EdgeInsets.all(15),
                child: controller.Loader
                    ? Center(child: Lottie.asset('assets/loader.json'))
                    : ListView.builder(
                        itemCount: controller.transactionsList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            Expantiontiles(controller.transactionsList[index]),
                      )),
          );
        });
  }

  Expantiontiles(transactions data) {
    List<String> keydata = [];
    List<String> valuedata = [];
    data.payments?.forEach((key, value) {
      keydata.add(key);
      valuedata.add(value);
    });
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Appcolors.cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ExpansionTile(
          backgroundColor: Appcolors.cardColor,
          collapsedIconColor: Colors.white,
          collapsedTextColor: Appcolors.buttonColor,
          iconColor: Appcolors.buttonColor,
          subtitle: Row(
            children: [
              Text("${data.type}",
                  style: TextStyle(color: Appcolors.buttonColor)),
              size.WidthSpace(10),
              Text("${data.total}",
                  style: TextStyle(color: Appcolors.buttonColor)),
            ],
          ),
          title: Text("${data.payer}", style: TextStyle(color: Colors.white)),
          children: [
            for (int i = 0; i < keydata.length; i++)
              ListTile(
                trailing: Text("${valuedata[i]}",
                    style: TextStyle(color: Appcolors.buttonColor)),
                title: Text("${keydata[i]}",
                    style: TextStyle(color: Colors.white)),
              )
          ],
        ),
      ),
    );
  }
}
