import 'dart:io';

import 'package:http/http.dart';

import 'create_model.dart';

Future<CreateModel> createScholarship(String name, String description) async {
  String apiUrl = "https://geoproserver.herokuapp.com/api/sponsorship";

  final response = await post(apiUrl, headers: {HttpHeaders.authorizationHeader: "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMiwidXNlcm5hbWUiOiJzdGFmZiIsImVtYWlsIjoiZ2Vvc3RhZmZAZ21haWwuY29tIiwiZXhwIjoxNjEwMzYzMDYyLCJpc19zdGFmZiI6dHJ1ZX0.ooGx7dAZ360er2NcMAgK0KTObYZbgo6SukPxRck1b0M"},
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
