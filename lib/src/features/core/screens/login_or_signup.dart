
import 'package:flowchat_app/src/features/core/screens/sign_up_page.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class LoginOrSignup extends StatefulWidget {
  const LoginOrSignup({super.key});


  @override
  State<LoginOrSignup> createState() => _LoginOrSignup();
}

class _LoginOrSignup extends State<LoginOrSignup> {

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
     return LoginPage(
     onTap:   togglePages,
     );
}else {
     return SignUpPage(
       onTap: togglePages,
     );
}
  }
}
