import 'package:flutter/material.dart';

class MyOutlinedButtonTheme{
  MyOutlinedButtonTheme._();


  /// -- light Theme
  static OutlinedButtonThemeData lightOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          elevation: 2,
          foregroundColor: Colors.black,
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
  static OutlinedButtonThemeData darkOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
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