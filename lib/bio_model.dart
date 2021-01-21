// To parse this JSON data, do
//
//     final bioModel = bioModelFromJson(jsonString);

import 'dart:convert';

BioModel bioModelFromJson(String str) => BioModel.fromJson(json.decode(str));

String bioModelToJson(BioModel data) => json.encode(data.toJson());

class BioModel {
  BioModel({
    this.firstName,
    this.lastName,
    this.mobile,
    this.country,
    this.city,
    this.schoolName,
    this.degree,
    this.coverLetter,
    this.postalCode,
  });

  String firstName;
  String lastName;
  String mobile;
  String country;
  String city;
  String schoolName;
  String degree;
  String coverLetter;
  String postalCode;

  factory BioModel.fromJson(Map<String, dynamic> json) => BioModel(
    firstName: json["first_name"],
    lastName: json["last_name"],
    mobile: json["mobile"],
    country: json["country"],
    city: json["city"],
    schoolName: json["school_name"],
    degree: json["degree"],
    coverLetter: json["cover_letter"],
    postalCode: json["postal_code"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "mobile": mobile,
    "country": country,
    "city": city,
    "school_name": schoolName,
    "degree": degree,
    "cover_letter": coverLetter,
    "postal_code": postalCode,
  };
}
