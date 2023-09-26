import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'widget_theme/text_theme.dart';

const darkColor = Colors.black;
const lightColor = Colors.white;

ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: whiteColor,
      foregroundColor: blackColor,
      centerTitle: true,
      titleTextStyle: GoogleFonts.raleway(
          color: blackColor, fontSize: 24, fontWeight: FontWeight.bold),
    ),
    primaryColor: whiteColor,
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll<Color>(whiteColor),
        padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
        shape: MaterialStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        backgroundColor: MaterialStatePropertyAll<Color>(blackColor),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: whiteColor,
      backgroundColor: blueColor,
    ),
    dividerTheme: const DividerThemeData(color: blackColor),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TTextTheme.lightTextTheme.bodyMedium,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      floatingLabelStyle: const TextStyle(
        color: blackColor,
      ),
      alignLabelWithHint: false,
      fillColor: whiteColor,
      isDense: true,
      prefixIconColor: blackColor,
      suffixIconColor: blackColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(width: 2, color: blackColor),
      ),
      enabledBorder: InputBorder.none,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(width: 2, color: borderTextFormField),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: whiteColor,
      showUnselectedLabels: true,
      unselectedItemColor: navBarColor,
      selectedItemColor: blackColor,
    ));

ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: transparentColor,
      foregroundColor: whiteColor,
      centerTitle: true,
      titleTextStyle: GoogleFonts.raleway(
          color: blackColor, fontSize: 24, fontWeight: FontWeight.bold),
    ),
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll<Color>(blackColor),
          iconColor: MaterialStatePropertyAll<Color>(blackColor),
          padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
          shape: MaterialStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          backgroundColor: MaterialStatePropertyAll<Color>(whiteColor),
          overlayColor: MaterialStatePropertyAll<Color>(Colors.black26)),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: whiteColor,
      backgroundColor: blackColor,
    ),
    dividerTheme: const DividerThemeData(color: whiteColor),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: const TextStyle(
        color: whiteColor,
      ),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(width: 2, color: blackColor),
      ),
      enabledBorder: InputBorder.none,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(width: 2, color: borderTextFormField),
      ),
    ),
    primaryColor: darkColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: whiteColor,
      showUnselectedLabels: false,
      unselectedItemColor: navBarColor,
      selectedItemColor: blackColor,
    ));
