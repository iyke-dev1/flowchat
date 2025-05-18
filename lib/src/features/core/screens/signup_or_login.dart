import 'package:flowchat_app/src/features/core/screens/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

class SignupOrLogin extends StatefulWidget {
  const SignupOrLogin({super.key});


  @override
  State<SignupOrLogin> createState() => _LoginOrSignup();
}

class _LoginOrSignup extends State<SignupOrLogin> {

  // initially show the login page
  bool showLoginPage = true;

// toggle between login and signUp page
  void togglePages(){
    setState((){
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return SignUpPage(
        onTap:   togglePages,
      );
    }else {
      return LoginPage(
        onTap: togglePages,
      );
    }
  }
}
