import 'package:flutter/material.dart';
import 'package:scholarship_app/my_drawer.dart';
import 'package:http/http.dart'as http;



import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:scholarship_app/user_bio.dart';






class AllSponsorships extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Scholarship"
        ),
      ),
      body: AllSponsorshipsScholarship(),
    );
  }
}

class AllSponsorshipsScholarship extends StatefulWidget {
  @override
  _AllSponsorshipsScholarshipState createState() => _AllSponsorshipsScholarshipState();
}

class _AllSponsorshipsScholarshipState  extends State<AllSponsorshipsScholarship> {

  final String url = "https://geoproserver.herokuapp.com/api/sponsorship";
  List data = [];

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http.get(
      Uri.encodeFull(url),
      headers: {HttpHeaders.authorizationHeader: "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMSwidXNlcm5hbWUiOiJzdHVkZW50IiwiZW1haWwiOiJzdHVkZW50QGdtYWlsLmNvbSIsImV4cCI6MTYxMDQzNDkzNiwiaXNfc3RhZmYiOmZhbHNlfQ.PLod7xNgdkWseV_X7LsJG9rvN_wlkrHWqjTl2CxyxHE"},
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
  // double _pixelRatio;


  @override
  Widget build(BuildContext context) {

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    // _pixelRatio = MediaQuery.of(context).devicePixelRatio;

    return Material(
      child: Container(
        height: _height,
        width: _width,

        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.only (top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  // onTap: () {
                  //   Navigator.push( context,
                  //     MaterialPageRoute(
                  //       builder: (context)
                  //       {
                  //         return UserBio();
                  //       },
                  //     ),
                  //   );
                  // },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text( data[index]['name'],
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      Text( data[index]['description'],
                          style: TextStyle(fontSize: 20)),
                    ],
                  ),
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
