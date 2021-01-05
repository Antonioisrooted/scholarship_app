import 'package:scholarship_app/responsive_ui.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class Created extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //This provides the total height & width of screen
    return Scaffold(
      appBar: AppBar(
        title: Text("Created Scholarships"),
      ),
      body: CreatedPg(),
    );
  }
}

class CreatedPg extends StatefulWidget {
  @override
  _CreatedPgState createState() => _CreatedPgState();
}

class _CreatedPgState extends State<CreatedPg> {
  final String url = "https://geoproserver.herokuapp.com/api/sponsorship";
      // "https://geoproserver.herokuapp.com/api/sponsorship/";
  List data =[];

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {

    var response = await http.get(
      Uri.encodeFull(url),
      headers: {HttpHeaders.authorizationHeader: "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMiwidXNlcm5hbWUiOiJzdGFmZiIsImVtYWlsIjoiZ2Vvc3RhZmZAZ21haWwuY29tIiwiZXhwIjoxNjEwMzY5OTc5LCJpc19zdGFmZiI6dHJ1ZX0.VE9iT-Mx4o6P202bd_AoLqthZipuAzC0T5BCvaACcsw"},
    );

    print(response.body);

    setState(() {
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson;
    });
    return "Success";
  }

  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Material(
      child: Container(
        height: _height,
        width: _width,

        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.only (top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      // 'name',
                      data[index]['name'],
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                    Text(
                      // 'description',
                      data[index]['description'],
                      style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
            );
          },
          itemCount: data.length,
        ),
      ),
    );
  }
}