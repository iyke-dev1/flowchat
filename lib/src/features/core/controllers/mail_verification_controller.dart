import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowchat_app/src/repository/authentication_repository/authentication_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flowchat_app/src/utils/helper.dart';

class MailVerificationController extends GetxController {
  static MailVerificationController get instance => Get.find();
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    sendVerificationEmail();
    setTimerForAutoRedirect();
  }

  /// --- Send or resend verification email
  Future<void> sendVerificationEmail() async {
    try {
      await AuthenticationRepo.instance.sendEmailVerification();
    } catch (e) {
      Helper.errorSnackBar(tittle: const Text("error"), message: e.toString());
    }
  }

  /// --- Set timer to check if verification completed then redirect
  void setTimerForAutoRedirect() {
    // TODO: Add implementation
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user!.emailVerified) {
        timer.cancel();
        AuthenticationRepo.instance.setInitialScreen(user);
      }
    });
  }

  /// --- Manually check if verification completed then redirect
  void manuallyCheckVerificationStatus() {
    // TODO: Add implementation
  }
}

