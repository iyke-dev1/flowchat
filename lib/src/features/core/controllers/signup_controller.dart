import 'package:flowchat_app/src/repository/authentication_repository/authentication_repo.dart';
import 'package:flowchat_app/src/repository/user_repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //text field controllers to get data from the text field
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final controller = Get.put(SignUpController());


  final userRepo = Get.put(UserRepo());

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


  /// Loader
  var isLoading = false.obs;
  final isGoogleLoading = false.obs;
  final isFacebookLoading =false.obs;


  Future<void> createUser( ) async{
    try {
      isLoading.value = true;
      if(!loginFormKey.currentState!.validate()){
        isLoading.value = false;
        return;
      }

      /// gets the users and pass to the controllers
      final user = UserModel(
          fullName: controller.fullName.text.trim(),
          email: controller.email.text.trim(),
          phoneNo: controller.phoneNo.text.trim(),
          password: controller.password.text.trim()
      );


      /// Athenticate user first
      final auth = AuthenticationRepo.instance;
      await auth.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      await UserRepo.instance.createUser(user);
      auth.setInitialScreen(auth.firebaseUser);

    }catch (e){
      isLoading.value = false;
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 5));
    }
  }

  // call this function from design and it will do the rest
//   void registerUser(String email, String password) async {
//     String? error =
//         await AuthenticationRepo.instance.createUserWithEmailAndPassword(
//               email,
//               password,
//             )
//             as String;
//     if (error != null) {
//       Get.showSnackbar(GetSnackBar(message: error.toString()));
//     }
//   }
//
//   Future<void> createUser(UserModel user) async {
//     await userRepo.createUser(user);
// /*    phoneAuthentication(user.phoneNo);*/
// /*    Get.to(() => OtpScreen());*/
//   }



  void phoneAuthentication(String phoneNo) {
    AuthenticationRepo.instance.phoneAuthentication(phoneNo);
  }
}
