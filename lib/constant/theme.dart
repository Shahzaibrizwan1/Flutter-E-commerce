import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.blueAccent,
    inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: Colors.grey,
        border: outlineInputBorder,
        errorBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        disabledBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          //* kisi ka on press nai ha ya hame nai chaiye to use kare ge
          disabledBackgroundColor: Colors.grey,
          textStyle: TextStyle(fontSize: 18)),
    ));

OutlineInputBorder outlineInputBorder =
    const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey));
