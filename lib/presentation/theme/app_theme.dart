import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  primaryColor: const Color(0xFFFFFFFF),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        fontSize: 40, 
        fontWeight: FontWeight.bold, 
        color: Colors.white,
    ),
    titleMedium: TextStyle(
        fontSize: 20, 
        fontWeight: FontWeight.bold, 
        color: Colors.white,
    ),
    labelLarge: TextStyle(
        fontSize: 16, 
        fontWeight: FontWeight.bold, 
        color: Colors.black,
    ),
    labelMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w200, 
      color: Colors.white,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal, 
      color: Colors.black,
    ),
  ),
  fontFamily: "Oxygen",
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(
      color: Color.fromARGB(127, 80, 81, 79),
      fontSize: 16,
      fontWeight: FontWeight.bold, 
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: Color.fromARGB(127, 80, 81, 79)),
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    fillColor: Color(0xFFFFFFFF),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 255, 15, 15)),
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    errorBorder: OutlineInputBorder(
      borderSide:
          BorderSide(width: 2, color: Color.fromARGB(255, 255, 110, 110)),
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    errorStyle: TextStyle(
      color: Color.fromARGB(255, 255, 73, 73),
      fontWeight: FontWeight.w600,
    ),
    contentPadding: EdgeInsets.only(
      left: 28.0, 
      right: 28.0,
      top: 19.0,
      bottom: 19.0,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16),
      ),
      borderSide: BorderSide.none,
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.black,
  ),
);