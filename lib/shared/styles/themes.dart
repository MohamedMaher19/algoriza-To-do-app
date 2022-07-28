import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class Themes {
  static final light = ThemeData(
      backgroundColor: Colors.white,
      primaryColor: tealColor,
      brightness: Brightness.light);

  static final dark = ThemeData(
      backgroundColor: Colors.black,
      primaryColor: Colors.black,
      brightness: Brightness.light);
}

TextStyle get subHeadStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold));
}

TextStyle get HeadStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold));
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
}
TextStyle get subTitleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold , color: Colors.grey[500]));
}
