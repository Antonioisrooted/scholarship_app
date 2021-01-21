import 'dart:io';

import 'package:http/http.dart';

import 'bio_model.dart';

Future<BioModel> createApplications(
    int scholarship_id,
    String first_name,
    String last_name,
    String mobile,
    String country,
    String city,
    String school_name,
    String degree,
    String cover_letter,
    String postal_code) async {
  String apiUrl = "https://geoproserver.herokuapp.com/api/apply/$scholarship_id/";

  final response = await post(apiUrl, headers: {HttpHeaders.authorizationHeader: "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMiwidXNlcm5hbWUiOiJzdGFmZiIsImVtYWlsIjoiZ2Vvc3RhZmZAZ21haWwuY29tIiwiZXhwIjoxNjEwNDMyNjQ0LCJpc19zdGFmZiI6dHJ1ZX0.fNb2Bs-FOW-K9IQjXn0abdwlTXQzNpHSyLYQ02krHtc"},
      body: {
        "first_name": first_name,
        "last_name": last_name,
        "mobile": mobile,
        "country": country,
        "city": city,
        "school_name": school_name,
        "degree": degree,
        "cover_letter": cover_letter,
        "postal_code": postal_code
      });
  if(response.statusCode == 201) {
    final String responseString = response.body;

    return bioModelFromJson(responseString);
  } else{
    return null;
  }
}
