import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle headlineLarge =
      GoogleFonts.roboto(fontSize: 32, fontWeight: FontWeight.bold);
  static TextStyle headlineMedium =
      GoogleFonts.roboto(fontSize: 26, fontWeight: FontWeight.bold);
  static TextStyle bodyLarge = GoogleFonts.roboto(fontSize: 18);
  static TextStyle bodyMedium = GoogleFonts.roboto(fontSize: 12);
}

class ResponsiveHelper {
  final BuildContext context;
  late double screenWidth;
  late double screenHeight;

  ResponsiveHelper(this.context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  double width(double value) => screenWidth * value;
  double height(double value) => screenHeight * value;
  double fontSize(double value) => screenWidth * value;
}
