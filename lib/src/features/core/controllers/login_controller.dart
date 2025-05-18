import 'package:flowchat_app/src/repository/authentication_repository/authentication_repo.dart';
import 'package:flowchat_app/src/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  //text field controllers to get data from the text field
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  /// Loader
  var isLoading = false.obs;
  final isGoogleLoading = false.obs;
  final isFacebookLoading =false.obs;

/// [EmailAndPasswordLogin]
  Future<void> login( ) async{
    try {
      isLoading.value = true;
      if(!loginFormKey.currentState!.validate()){
        isLoading.value = false;
        return;
      }
      final auth = AuthenticationRepo.instance;
      await auth.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      auth.setInitialScreen(auth.firebaseUser);

    }catch (e){
      isLoading.value = false;
      Helper.errorSnackBar(title: Text("Error"), message: e.toString());
    }
  }


// call this function from design and it will do the rest
  Future<void> loginUser(String email, String password) async{
    String? error = await AuthenticationRepo.instance.loginWithEmailAndPassword(email, password) as String;
    if (error != null){
      Get.showSnackbar(GetSnackBar(message: error.toString(),));
    }
  }


}