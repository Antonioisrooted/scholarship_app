
import 'dart:convert';

SignModel signModelFromJson(String str) => SignModel.fromJson(json.decode(str));

String signModelToJson(SignModel data) => json.encode(data.toJson());

class SignModel {
  SignModel({
    this.email,
    this.token,
  });

  String email;
  String token;

  factory SignModel.fromJson(Map<String, dynamic> json) => SignModel(
    email: json["email"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "token": token,
  };
}