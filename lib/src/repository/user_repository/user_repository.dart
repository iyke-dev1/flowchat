import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/core/models/user_model.dart';

// ToDo step 2: Create user repository [To perform user operations]

class UserRepo extends GetxController{
  static UserRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// store user in firebase
  Future<void> createUser(UserModel user) async {

    print("hereeeeeeeeeeeee");
    await _db
        .collection("Users")
        .add(user.toJason())
        .whenComplete(() => Get.snackbar(
      "Success",
      "Your account has been created",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withAlpha(30),
      colorText: Colors.green,
    ))
        .catchError((error, stackTrace) {
      Get.snackbar(
        "Error",
        "Something went wrong, Try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withAlpha(40),
        colorText: Colors.red,
      );
      // print("Error: $error");
    });
  }


  /// Step 2 - fetch all user or user details
  Future<UserModel> getUserDetails(String email) async {
  final  snapshot = await _db.collection("Users").where("test@gmail.com", isEqualTo: email).get();
  final userData = snapshot.docs.map((e)=> UserModel.fromSnapshots(e)).single;
  return userData;
  }



  Future<List<UserModel>> allUser() async{
    final snapshot = await _db.collection("Users").get();
    final userData = snapshot.docs.map((e)=> UserModel.fromSnapshots(e)).toList();

    print("1111111111111111111111");
    print(userData);
    return userData;
 }

 Future<void> updateUserRecord(UserModel user)async{
    await _db.collection("Users").doc(user.id).update(user.toJason());
}



}