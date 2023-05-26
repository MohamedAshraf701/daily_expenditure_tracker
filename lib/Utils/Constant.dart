// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:dynamic_size/dynamic_size.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

dynamicsize size = dynamicsize(849, 393);

class Appcolors {
  static Color backgroundColor = Color(0xFF030405);
  static Color buttonColor = Color(0xFF3FEDB2);
  static Color cardColor = Color(0xFF484844);
  // static Color backgroundColors = Color(0xFF1B1C21);
}

final box = GetStorage();

Widget appTextField(
    {required TextEditingController textEditingController,
    required String labelText,
    Function(String)? onchange}) {
  return TextField(
    style: TextStyle(color: Colors.white),
    controller: textEditingController,
    keyboardType: TextInputType.number,
    onChanged: onchange,
    decoration: InputDecoration(
      labelText: labelText,
      //hintText: labelText,
      //hintStyle: TextStyle(color: Colors.white54),
      labelStyle: TextStyle(color: Colors.white70),
      contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      suffixIconConstraints: BoxConstraints(minWidth: 17, minHeight: 15),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Appcolors.buttonColor, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Appcolors.buttonColor, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Appcolors.buttonColor, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    ),
  );
}
