import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../custom_widget/my_button.dart';
import '../../../../../custom_widget/my_textfield.dart';
import '../forget_password_otp/Otp_screen.dart';

class ForgotPasswordWithEmailPage extends StatelessWidget {
  ForgotPasswordWithEmailPage({super.key});

  final TextEditingController _forgotPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Image.asset("assets/images/forgot_password.png"),

              SizedBox(height: 20,),

              Text("Forgot Password",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),

              Text("Please enter your email address to reset your password.",
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 30,),

              MyTextField(
                  hintText: "Enter your email address",
                  obscureText: false,
                  prefixIcon: Icons.email,
                  controller: _forgotPasswordController

              ),


              SizedBox(height: 30,),

              MyButton(text: "Continue",
              onpressed: (){
                Get.to(()=> OtpScreen() );
              },
              ),

              SizedBox(height: 30,),

              Text("Don't remember your email?"),
              Text.rich(
                  TextSpan(
                      text: "contact us at ",
                      children: [
                        TextSpan(
                            text: "iyke@gmail.com"
                        )
                      ]


                  )
              )
            ],
          ),
        ),
      ),

    );
  }
}
