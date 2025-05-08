import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../forget_password_main/forgot_password_with_email_page.dart';
import '../forget_password_main/forgot_password_with_phone_no_page.dart';
import 'forget_password_btn_widget.dart';


class ForgetPasswordScreen{
 static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context)=> Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Make a Selection!", style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),),
            SizedBox(height: 5,),
            Text("Select one of the option given below to reset your password.", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 25,),

            ForgotPasswordButtonWidget(
                btnIcon: Icons.email_outlined,
                title: "E-mail",
                subtitle: "Reset Via Email Verification",
                onTap: (){
                  Navigator.pop(context);
                  Get.to(()=> ForgotPasswordWithEmailPage());
                },
            ),



            SizedBox(height: 30,),

            ForgotPasswordButtonWidget(
                btnIcon: Icons.phone_android_outlined,
                title: "Phone",
                subtitle: "Reset Via Phone Verification",
                onTap: () {
                  Navigator.pop(context);
                  Get.to(()=> ForgotPasswordWithPhoneNoPage());
                }

            ),

          ],
        ),
      ),
    );
  }

}