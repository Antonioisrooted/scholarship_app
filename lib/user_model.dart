// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.email,
    this.token,
    this.username,
  });

  String email;
  String token;
  String username;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json["email"],
    token: json["token"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "token": token,
    "username": username,
  };
}