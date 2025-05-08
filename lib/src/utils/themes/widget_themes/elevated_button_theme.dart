import 'package:flutter/material.dart';

/// -- light & dark Elevated button Themes

class MyElevatedButtonTheme {
  MyElevatedButtonTheme._();

  /// -- light Theme
  static ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: BorderSide(color: Colors.blue),
      padding: EdgeInsets.symmetric(vertical: 10),
      textStyle: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
    )
  );

  /// -- Dark Theme
  static ElevatedButtonThemeData darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          disabledForegroundColor: Colors.grey,
          disabledBackgroundColor: Colors.grey,
          side: BorderSide(color: Colors.blue),
          padding: EdgeInsets.symmetric(vertical: 10),
          textStyle: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
      )
  );
}