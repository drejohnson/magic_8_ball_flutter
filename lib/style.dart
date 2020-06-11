import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontFamily: 'Oswald',
        fontSize: 32.0,
        fontWeight: FontWeight.w700,
        color: Color(0xFFFFFFFF),
      ),
      subtitle1: TextStyle(
        fontFamily: 'Oswald',
        letterSpacing: 2.5,
        fontSize: 22.0,
        color: Colors.teal.shade200,
      ),
      bodyText1: TextStyle(
        fontFamily: 'Montserrat',
        color: Color(0xFF425398),
      ),
      bodyText2: TextStyle(
        fontFamily: 'Montserrat',
        color: Color(0xFF425398),
      ),
      caption: TextStyle(
        fontFamily: 'Montserrat',
        color: Color(0xFF425398),
      ),
    ),
  );
}
