import 'package:flowchat_app/src/features/core/screens/sign_up_page.dart';
import 'package:flowchat_app/src/features/core/screens/signup_or_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_or_signup.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/welcome.png", height: 400,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome To FlowChat!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Text("Let's connect you with all your friends and family.", textAlign: TextAlign.center,),

                  ],
                ),
              ),



              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                            shape: StadiumBorder()
                          ),
                            onPressed: ()=> Get.to(()=> LoginOrSignup()),
                            child: Text("Login".toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold),)),
                      ),
                    ),

                    SizedBox(width: 10,),

                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: StadiumBorder()
                            ),
                            onPressed: ()=> Get.to(()=> SignupOrLogin()),
                            child: Text("Sign Up".toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold),)),
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
