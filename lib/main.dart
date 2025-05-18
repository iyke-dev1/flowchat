import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flowchat_app/firebase_options.dart';
import 'package:flowchat_app/src/features/core/screens/splash_screen.dart';
import 'package:flowchat_app/src/repository/authentication_repository/authentication_repo.dart';
import 'package:flowchat_app/src/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();



  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepo()));

  FirebaseAuth.instance.setLanguageCode('en');


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.dartTheme,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: Duration(milliseconds: 100),
    );
  }
}
