import 'dart:async';
import 'package:flowchat_app/src/features/core/screens/welcome_page.dart';
import 'package:flutter/material.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 7),
            ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage(),))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage(
              "assets/images/splash_background.jpg",
            ),
            fit: BoxFit.cover,
            opacity: 0.4,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo/chat_logo.png", height: 220, width: 250,),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Text("flowChat",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.blue.shade300,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            )
          ],
        ),

      ),
    );

  }
}
