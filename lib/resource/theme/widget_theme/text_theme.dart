import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.jost(
      color: whiteColor,
      fontSize: 40,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
    ),
    headlineMedium: GoogleFonts.jost(
      color: textColor,
      fontSize: 32,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
    ),
    headlineSmall: GoogleFonts.jost(
      color: textColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
    ),
    bodyLarge: GoogleFonts.jost(
      color: textColor,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none,
    ),
    bodyMedium: GoogleFonts.jost(
      color: greyColor,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
    ),
    bodySmall: GoogleFonts.jost(
      color: textColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none,
    ),
    displayLarge: GoogleFonts.jost(
      color: textColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
    ),
    displayMedium: GoogleFonts.jost(
      color: whiteColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
    ),
    displaySmall: GoogleFonts.jost(
      color: textColor,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.jost(
      color: whiteColor,
      fontSize: 40,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
    ),
    headlineMedium: GoogleFonts.jost(
      color: whiteColor,
      fontSize: 32,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
    ),
    headlineSmall: GoogleFonts.jost(
      color: whiteColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
    ),
    bodyLarge: GoogleFonts.jost(
      color: whiteColor,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none,
    ),
    bodyMedium: GoogleFonts.jost(
      color: greyColor,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
    ),
    bodySmall: GoogleFonts.jost(
      color: whiteColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
    ),
    displayLarge: GoogleFonts.jost(
      color: textColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
    ),
    displayMedium: GoogleFonts.jost(
      color: whiteColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
    ),
    displaySmall: GoogleFonts.jost(
      color: whiteColor,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
    ),
  );
}
