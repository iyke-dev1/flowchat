import 'package:flowchat_app/src/utils/themes/widget_themes/appbar_theme.dart';
import 'package:flowchat_app/src/utils/themes/widget_themes/bottom_sheet_theme.dart';
import 'package:flowchat_app/src/utils/themes/widget_themes/checkbox_theme.dart';
import 'package:flowchat_app/src/utils/themes/widget_themes/chip_theme.dart';
import 'package:flowchat_app/src/utils/themes/widget_themes/elevated_button_theme.dart';
import 'package:flowchat_app/src/utils/themes/widget_themes/outlined_button_theme.dart';
import 'package:flowchat_app/src/utils/themes/widget_themes/text_theme.dart';
import 'package:flowchat_app/src/utils/themes/widget_themes/textfield_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    fontFamily: "poppins",
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: MyTextTheme.lightTextTheme,
    chipTheme: MyChipTheme.lightChipTheme,
    appBarTheme: MyAppBarTheme.lightAppBarTheme,
    checkboxTheme: MyCheckBoxTheme.lightCheckboxTheme,
    bottomSheetTheme: MyBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: MyTextField.lightInputDecorationTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.lightOutlinedButtonTheme,
  );

  static  ThemeData dartTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    fontFamily: "poppins",
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: MyTextTheme.darkTextTheme,
    chipTheme: MyChipTheme.darkChipTheme,
    appBarTheme: MyAppBarTheme.darkAppBarTheme,
    checkboxTheme: MyCheckBoxTheme.darkCheckboxTheme,
    bottomSheetTheme: MyBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: MyTextField.darkInputDecorationTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.lightOutlinedButtonTheme,
  );
}