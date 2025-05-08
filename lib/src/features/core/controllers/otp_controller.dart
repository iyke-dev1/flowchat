import 'package:flowchat_app/src/repository/authentication_repository/authentication_repo.dart';
import 'package:get/get.dart';

import '../screens/homepage.dart';

class OTPController{
  static OTPController get instance => Get.find();

void verifyOTP(String otp) async{
  var isverfied = await AuthenticationRepo.instance.verifyOTP(otp);
  isverfied ? Get.offAll(()=> Homepage()) : Get.back();
}
}