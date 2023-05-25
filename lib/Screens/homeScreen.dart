// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:daily_expenditure_tracker/Utils/Constant.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      body: Container(
          margin: EdgeInsets.all(15),
          child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (context, index) => Expantiontiles(),
          )),
    );
  }

  Expantiontiles() {
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
              Text("Prise", style: TextStyle(color: Appcolors.buttonColor)),
              size.WidthSpace(10),
              Text("250", style: TextStyle(color: Appcolors.buttonColor)),
            ],
          ),
          title: Text("Expenditure", style: TextStyle(color: Colors.white)),
          children: [
            ListTile(
              trailing:
                  Text("80", style: TextStyle(color: Appcolors.buttonColor)),
              title: Text("Ashraf", style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              trailing:
                  Text("60", style: TextStyle(color: Appcolors.buttonColor)),
              title: Text("Akshay", style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              trailing:
                  Text("70", style: TextStyle(color: Appcolors.buttonColor)),
              title: Text("Irshad", style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
