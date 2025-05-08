import 'package:flowchat_app/src/custom_widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controllers/otp_controller.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context){
    final otpController = Get.put(OTPController());
    String otp;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("CO\nDE", style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 70.0
            )),
            Text("Verification".toUpperCase(), style: Theme.of(context).textTheme.headlineSmall ,),

            SizedBox(height: 20,),

            Text("Enter the verification code sent at Iykeeze@gmail.com", textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),

            SizedBox(height: 10,),

            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.black.withAlpha(15),
              filled: true,
              onSubmit: (code){
                otp = code;
                OTPController.instance.verifyOTP(otp);
              }
            ),

            SizedBox(height: 10,),

            MyButton(text: "Continue",
            onpressed: (){
              // OTPController.instance.verifyOTP(otp);
            },
            )

          ],
        ),
      ),
    );
  }
}
