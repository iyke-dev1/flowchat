//Todo Step 1: create user model

import 'package:cloud_firestore/cloud_firestore.dart';
class UserModel {
  final String? id;
  final String email;
  final String fullName;
  final String phoneNo;
  final String password;

  UserModel({
    this.id,
    required this.email,
    required this.fullName,
    required this.phoneNo,
    required this.password,
  });

  Map<String, dynamic> toJason() => {
    "Email": email,
    "FullName": fullName,
    "phone": phoneNo,
    "Password": password,
  };

  factory UserModel.fromSnapshots(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      id: snapshot.id,
      email: data["email"] ?? "",
      fullName: data["fullName"] ?? "",
      phoneNo: data["phoneNo"] ?? "",
      password: data["password"] ?? "",
    );
  }
}

