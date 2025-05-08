import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onpressed;
  final String text;
  final isLoading;
  

  const MyButton({super.key,
  required this.text,
  this.onpressed,
  this.isLoading
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade400,
          // color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.all(15),
        // margin: EdgeInsets.symmetric(horizontal: 0),
        child: Center(child: Text(text, style: TextStyle( fontWeight: FontWeight.bold, fontSize: 15),)
        ),
      ),
    );
  }
}
