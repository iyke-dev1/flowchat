import 'package:flutter/material.dart';

/// -- Custom class for light & dark Text Themes
class MyCheckBoxTheme{
  MyCheckBoxTheme._(); // To avoid creating instances

  /// -- Customizable light Text Theme
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states){
      if (states.contains(WidgetState.selected)){
        return Colors.white;
      } else {
        return Colors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states){
      if (states.contains(WidgetState.selected)){
        return Colors.blue;
      } else{
        return Colors.transparent;
      }
    }),
  );

  /// -- Customizable dark Text Theme
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states){
      if (states.contains(WidgetState.selected)){
        return Colors.white;
      } else {
        return Colors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states){
      if (states.contains(WidgetState.selected)){
        return Colors.blue;
      } else{
        return Colors.transparent;
      }
    }),
  );
}