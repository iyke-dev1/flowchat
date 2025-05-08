import 'package:flowchat_app/src/features/core/controllers/mail_verification_controller.dart';
import 'package:flowchat_app/src/repository/authentication_repository/authentication_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class MailVerification extends StatelessWidget {
  const MailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MailVerificationController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 120, left: 20, right: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(LineAwesomeIcons.envelope, size: 100),
              SizedBox(height: 20),

              Text(
                "Verify your email address",
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              SizedBox(height: 20),

              Text("we have sent a verification link to your email, "
                  "please check the email and click on the link to verify your email address", textAlign: TextAlign.center,),

              SizedBox(height: 20,),

              Text("if not auto redirected after the verification, click on the continue button.", textAlign: TextAlign.center,),


              SizedBox(height: 20,),

              SizedBox(
                width: 200,
                child: OutlinedButton(
                  child: Text("continue"),
                  onPressed:
                      () => controller.manuallyCheckVerificationStatus()),
                ),


              SizedBox(height: 20),

              TextButton(
                onPressed: () => controller.sendVerificationEmail(),
                child: Text("resendEmailLink", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
              ),

              TextButton(
                onPressed: () => AuthenticationRepo.instance.logout(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(LineAwesomeIcons.long_arrow_alt_left_solid),
                    SizedBox(width: 5,),
                    Text("Back to Login".toLowerCase(), style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue
                    ),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
