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


  final userRepo = Get.put(UserRepo());

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();


  /// Loader
  var isLoading = false.obs;
  final isGoogleLoading = false.obs;
  final isFacebookLoading =false.obs;


  Future<void> createUser() async{
    try {
      isLoading.value = true;
      if(!signupFormKey.currentState!.validate()){
        isLoading.value = false;
        return;
      }

      /// gets the users and pass to the controllers
      final user = UserModel(
          fullName: fullName.text.trim(),
          email: email.text.trim(),
          phoneNo: phoneNo.text.trim(),
          password: password.text.trim()
      );


      /// Athenticate user first
      final auth = AuthenticationRepo.instance;
      await auth.createUserWithEmailAndPassword(user.email, user.password);
      await UserRepo.instance.createUser(user);
      auth.setInitialScreen(auth.firebaseUser);

    }catch (e){
      isLoading.value = false;
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 5));
    }
  }



  // call this function from design and it will do the rest
  void registerUser(String email, String password) async {
    String? error =
        await AuthenticationRepo.instance.createUserWithEmailAndPassword(
              email,
              password,
            )
            as String;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }

  Future<void> createUserWithEmailAndPassword(UserModel user) async {
    await userRepo.createUser(user);
/*    phoneAuthentication(user.phoneNo);*/
/*    Get.to(() => OtpScreen());*/
  }


  void phoneAuthentication(String phoneNo) {
    AuthenticationRepo.instance.phoneAuthentication(phoneNo);
  }
}










// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../repository/authentication_repository/authentication_repo.dart';
// import '../models/user_model.dart';
//
// class SignUpController extends GetxController {
//   // Text Controllers
//   final fullName = TextEditingController();
//   final email = TextEditingController();
//   final phoneNo = TextEditingController();
//   final password = TextEditingController();
//
//   // Form Key
//   final formKey = GlobalKey<FormState>();
//
//   // Submit SignUp Form
//   Future<void> createUser() async {
//     if (!formKey.currentState!.validate()) {
//       // Form validation failed
//       return;
//     }
//
//     try {
//       // Construct user data
//       final user = UserModel(
//         fullName: fullName.text.trim(),
//         email: email.text.trim(),
//         phoneNo: phoneNo.text.trim(),
//         password: password.text.trim(),
//       );
//
//       // Call Firebase signup method
//       final auth = AuthenticationRepo.instance;
//       await auth.createUserWithEmailAndPassword(user.email, user.password);
//
//       // You can add any post-signup logic here (like clearing fields)
//       clearForm();
//
//     } catch (e) {
//       // Show error using snackbar or dialog
//       Get.snackbar(
//         "Sign Up Failed",
//         e.toString(),
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.redAccent,
//         colorText: Colors.white,
//       );
//     }
//   }
//
//   void clearForm() {
//     fullName.clear();
//     email.clear();
//     phoneNo.clear();
//     password.clear();
//   }
//
//   @override
//   void onClose() {
//     // Clean up controllers when disposed
//     fullName.dispose();
//     email.dispose();
//     phoneNo.dispose();
//     password.dispose();
//     super.onClose();
//   }
// }



//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class SignUpController extends GetxController {
//   static SignUpController get instance => Get.find();
//
//   final fullName = TextEditingController();
//   final email = TextEditingController();
//   final phoneNo = TextEditingController();
//   final password = TextEditingController();
//
//   final formKey = GlobalKey<FormState>(); // ✅ Add this
//
//   var isLoading = false.obs; // ✅ Required by sign up page
//   var isFacebookLoading = false.obs;
//   var isGoogleLoading = false.obs;
//
//   void createUser() {
//     if (formKey.currentState!.validate()) {
//       isLoading.value = true;
//       // Simulate a network call
//       Future.delayed(const Duration(seconds: 2), () {
//         isLoading.value = false;
//         // You can navigate or show a snackbar here
//         Get.snackbar("Success", "Account created!");
//       });
//     }
//   }
// }
