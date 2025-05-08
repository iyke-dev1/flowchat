import 'package:flowchat_app/src/features/core/models/user_model.dart';
import 'package:flowchat_app/src/repository/authentication_repository/authentication_repo.dart';
import 'package:flowchat_app/src/repository/user_repository/user_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepo());
  final _userRepo = Get.put(UserRepo());

  /// step 3 - Get user email and password to UserRepository to fetch user data
   getUserData()  {
    // final email = _authRepo.firebaseUser.value?.email;
    // if (email != null) {
    if (1 > 0) {
      return _userRepo.getUserDetails("test@gmail.com");
    } else {
      Get.snackbar("Error", "Login to continue");
      throw Exception("No user logged in");
    }
  }


  Future<List<UserModel>> getAllUser()async {

    print("22222222222222222222222222222222");
    print(_userRepo.allUser());

    return await _userRepo.allUser();
  }

  updateRecord(UserModel user)async{
    await _userRepo.updateUserRecord(user);
  }
}