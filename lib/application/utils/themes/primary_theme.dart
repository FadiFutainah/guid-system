import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData primaryTheme = ThemeData(
  primaryColor: Colors.green,
  backgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green),
  textTheme: TextTheme(
    headline1: GoogleFonts.ubuntu(
      color: Colors.blueGrey[800],
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
    headline2: GoogleFonts.ubuntu(
      color: Colors.blueGrey[800],
      fontSize: 22,
    ),
    headline3: GoogleFonts.ubuntu(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.green,
    ),
    headline4: GoogleFonts.ubuntu(
      fontSize: 16,
      color: Colors.grey,
    ),
    headline5: GoogleFonts.ubuntu(
      color: Colors.blueGrey[800],
      fontWeight: FontWeight.normal,
      fontSize: 20,
    ),
    headline6: GoogleFonts.ubuntu(
      fontSize: 16,
      color: Colors.blueGrey[800],
    ),
    subtitle1: GoogleFonts.ubuntu(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: Colors.grey,
    ),
    subtitle2: GoogleFonts.ubuntu(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: Colors.blueGrey[800],
    ),
    caption: GoogleFonts.ubuntu(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: Colors.green,
    ),
    button: GoogleFonts.ubuntu(
      fontSize: 20,
      color: Colors.white,
    ),
  ),
);
