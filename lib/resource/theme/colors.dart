import 'package:flutter/material.dart';

hexStringToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";
  }
  return Color(int.parse(hexColor, radix: 16));
}

const whiteColor = Colors.white;
const blackColor = Colors.black;

const textColor = Color.fromARGB(255, 42, 42, 42);
const borderTextFormField = Color.fromARGB(255, 183, 183, 183);
const navBarColor = Color.fromARGB(255, 162, 161, 161);
const photoBackground = Color.fromARGB(255, 227, 227, 227);
const searchBackground = Color.fromARGB(255, 235, 235, 235);
const backgroundColor = Color.fromARGB(255, 250, 250, 250);

const iconColor = Color.fromARGB(255, 189, 189, 189);
const blueColor = Colors.blue;
const redColor = Colors.red;
const yellowColor = Colors.yellow;
const greenColor = Colors.green;
const purpleColor = Colors.purple;
const greyColor = Colors.grey;
const pinkColor = Colors.pink;
const transparentColor = Color.fromARGB(0, 255, 0, 102);
const inputDecorationColor = Color.fromARGB(255, 48, 44, 44);
