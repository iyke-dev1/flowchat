import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helper {
  static void errorSnackBar({required Widget title, required String message}) {
    Get.snackbar(
      'error',
      'something went wrong',
      titleText: title,
      messageText: Text(message),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
    );
  }
}
