import 'package:get/get.dart';

class PasswordController extends GetxController{
  static PasswordController get instance => Get.find();


  Rx<bool> obscureText = true.obs;
}