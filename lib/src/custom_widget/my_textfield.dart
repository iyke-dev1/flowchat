import 'package:flutter/material.dart';


class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final String? Function(String?)? validator; // ✅ Add this line


  final TextEditingController? controller;


  const MyTextField({super.key,
  required this.hintText,
  required this.obscureText,
  required this.prefixIcon,
  this.suffixIcon,
  this.controller,
  this.initialValue,
  this.validator, // ✅ Add this
  });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: TextFormField(
        initialValue: initialValue,
        style: TextStyle(color: Colors.black),
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.white,
              width: 2,
              // color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
          // fillColor: Theme.of(context).colorScheme.secondary,
          fillColor: Colors.blue.shade50,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(prefixIcon),
          suffixIcon: suffixIcon,

        ),
      ),
    );
  }
}
