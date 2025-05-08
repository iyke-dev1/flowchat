import 'package:flutter/material.dart';

class ForgotPasswordButtonWidget extends StatelessWidget {
  const ForgotPasswordButtonWidget({
    super.key,
    required this.btnIcon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
  final IconData  btnIcon;
  final String title, subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  onTap,
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(btnIcon, size: 60,),

            SizedBox(width: 10,),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                Text(subtitle, style: TextStyle(color: Colors.black),)
              ],
            )
          ],
        ),


      ),
    );
  }
}