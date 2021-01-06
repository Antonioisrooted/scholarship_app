import 'dart:io';

import 'package:http/http.dart';

import 'create_model.dart';

Future<CreateModel> createScholarship(String name, String description) async {
  String apiUrl = "https://geoproserver.herokuapp.com/api/sponsorship/";

  final response = await post(apiUrl, headers: {HttpHeaders.authorizationHeader: "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMiwidXNlcm5hbWUiOiJzdGFmZiIsImVtYWlsIjoiZ2Vvc3RhZmZAZ21haWwuY29tIiwiZXhwIjoxNjEwNDMyNjQ0LCJpc19zdGFmZiI6dHJ1ZX0.fNb2Bs-FOW-K9IQjXn0abdwlTXQzNpHSyLYQ02krHtc"},
      body: {
    "name": name,
    "description": description
  });
  if(response.statusCode == 201) {
    final String responseString = response.body;

    return createModelFromJson(responseString);
  } else{
    return null;
  }
}
