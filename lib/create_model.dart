import 'dart:convert';

CreateModel createModelFromJson(String str) => CreateModel.fromJson(json.decode(str));

String createModelToJson(CreateModel data) => json.encode(data.toJson());

class CreateModel{
  CreateModel({
    this.name,
    this.description,
  });

  String name;
  String description;

  factory CreateModel.fromJson(Map<String, dynamic> json) => CreateModel(
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description
  };
}