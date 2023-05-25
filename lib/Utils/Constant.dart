// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:dynamic_size/dynamic_size.dart';
import 'package:flutter/material.dart';

dynamicsize size = dynamicsize(849, 393);

class Appcolors {
  static Color backgroundColor = Color(0xFF1B1C21);
  static Color buttonColor = Color(0xFF3FEDB2);
  static Color cardColor = Color(0xFF272A33);
  // static Color backgroundColors = Color(0xFF1B1C21);
}

Widget appTextField({
  required TextEditingController textEditingController,
}) {
  return TextFormField(
    controller: textEditingController,
    decoration: InputDecoration(
      hintText: "hintText",
      filled: false,
      contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      suffixIconConstraints: BoxConstraints(minWidth: 17, minHeight: 15),
      border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(45))),
    ),
  );
}
