import 'package:flutter/material.dart';

 class MyTextField{
   MyTextField._();

   static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
     errorMaxLines: 3,
     prefixIconColor: Colors.grey,
     suffixIconColor: Colors.grey,
     constraints: BoxConstraints.expand(height: 60),
     labelStyle: TextStyle().copyWith(fontSize: 14, color: Colors.black),
     hintStyle: TextStyle().copyWith(fontSize: 14, color: Colors.black),
     floatingLabelStyle: TextStyle().copyWith(color: Colors.black.withAlpha(2)),
     border: OutlineInputBorder().copyWith(
       borderRadius:BorderRadius.circular(14),
       borderSide: BorderSide(width: 1, color: Colors.white)
     ),
     enabledBorder: OutlineInputBorder().copyWith(
       borderRadius: BorderRadius.circular(14),
       borderSide: BorderSide(width: 1, color: Colors.black)
     ),

       focusedBorder: OutlineInputBorder().copyWith(
       borderRadius: BorderRadius.circular(14),
       borderSide: BorderSide(width: 1, color: Colors.black)
     ),

       errorBorder: OutlineInputBorder().copyWith(
       borderRadius: BorderRadius.circular(14),
       borderSide: BorderSide(width: 1, color: Colors.black)
     )
   );


   static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
     errorMaxLines: 3,
     prefixIconColor: Colors.grey,
     suffixIconColor: Colors.grey,
     constraints: BoxConstraints.expand(height: 60),
     labelStyle: TextStyle().copyWith(fontSize: 14, color: Colors.black),
     hintStyle: TextStyle().copyWith(fontSize: 14, color: Colors.black),
     floatingLabelStyle: TextStyle().copyWith(color: Colors.black.withAlpha(2)),
     border: OutlineInputBorder().copyWith(
       borderRadius:BorderRadius.circular(14),
       borderSide: BorderSide(width: 1, color: Colors.grey)
     ),
     enabledBorder: OutlineInputBorder().copyWith(
       borderRadius: BorderRadius.circular(14),
       borderSide: BorderSide(width: 1, color: Colors.black)
     ),

       focusedBorder: OutlineInputBorder().copyWith(
       borderRadius: BorderRadius.circular(14),
       borderSide: BorderSide(width: 1, color: Colors.black)
     ),

       errorBorder: OutlineInputBorder().copyWith(
       borderRadius: BorderRadius.circular(14),
       borderSide: BorderSide(width: 1, color: Colors.black)
     )
   );
 }