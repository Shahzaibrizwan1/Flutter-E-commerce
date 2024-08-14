import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          //* kisi ka on press nai ha ya hame nai chaiye to use kare ge
          disabledBackgroundColor: Colors.white,
          textStyle: TextStyle(fontSize: 18)),
    ));
