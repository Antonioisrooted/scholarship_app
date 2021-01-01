import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scholarship_app/user_bio.dart';
import 'package:http/http.dart'as http;

// class Sponsorship extends StatefulWidget {
//   @override
//   _SponsorshipState createState() => _SponsorshipState();
// }
//
//
// class _SponsorshipState extends State<Sponsorship> {
//
//   final String url = "https://geoproserver.herokuapp.com/api/sponsorship";
//   List data;
//   @override
//   void initState() {
//     super.initState();
//     this.getJsonData();
//   }
//   Future<String> getJsonData() async {
//     var response = await http.get(
//       Uri.encodeFull(url),
//       headers: {HttpHeaders.authorizationHeader: "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMSwidXNlcm5hbWUiOiJzdHVkZW50IiwiZW1haWwiOiJzdHVkZW50QGdtYWlsLmNvbSIsImV4cCI6MTYxMDAyNzE0OCwiaXNfc3RhZmYiOmZhbHNlfQ.IvQmL9WO1Qk1ziCGPmmjrMYSIjv7HQ9SbO-87e3KvIM"},
//     );
//     print(response.body);
//     setState(() {
//       var convertDataToJson = json.decode(response.body);
//       data = convertDataToJson;
//     });
//     return "Success";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: new AppBar
//         (
//         title: new Text(' All Sponsorships '),
//         centerTitle: true,
//       ),
//       body: getBody(),
//     );
//   }
//   Widget getBody(){
//     return ListView.builder(
//         itemBuilder: (context,index){
//       return Card(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: ListTile(
//             title: Row(
//                 children: <Widget>[
//           //       Container(
//           //       width: 60,
//           //       height: 60,
//           //       decoration: BoxDecoration(color: Colors.lightBlue,
//           //         borderRadius: BorderRadius.circular(60/2),
//           //         )
//           //   ),
//           // SizedBox(width: 20,),
//           // Column(
//           //     crossAxisAlignment: CrossAxisAlignment.start,
//           //     children: <Widget>[
//           //       Text(data[index]['name'], style: TextStyle(fontSize: 16),),
//           //       SizedBox(height: 10,),
//           //       Text(data[index]['description'], style: TextStyle(fontSize: 16),
//           //     SizedBox(height: 10,),
//           //       ),
//           //     ]
//           // ),
//           // ],
//
//                 Flexible(
//                   child: Card(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(data[index]['name'], style: TextStyle(fontSize: 16),),
//                         SizedBox(height: 15.0,),
//                         Text(data[index]['description'], style: TextStyle(fontSize: 16),),
//                         SizedBox(height: 5.0,),
//                       ],
//                     ),
//                   ),
//                 ),
//   ],
//       ),
//         ),
//       ),
//       );
//     }
//     );
//   }
// }


import 'dart:async';





class Sponsorships extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //This provides the total height & width of screen
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Scholarship"
        ),
      ),
      body: SponsorshipsScholarship(),
    );
  }
}

class SponsorshipsScholarship extends StatefulWidget {
  @override
  _SponsorshipsScholarshipState createState() => _SponsorshipsScholarshipState();
}

class _SponsorshipsScholarshipState  extends State<SponsorshipsScholarship> {

  final String url = "https://geoproserver.herokuapp.com/api/sponsorship";
  List data;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http.get(
      Uri.encodeFull(url),
      headers: {HttpHeaders.authorizationHeader: "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMSwidXNlcm5hbWUiOiJzdHVkZW50IiwiZW1haWwiOiJzdHVkZW50QGdtYWlsLmNvbSIsImV4cCI6MTYxMDAyNzE0OCwiaXNfc3RhZmYiOmZhbHNlfQ.IvQmL9WO1Qk1ziCGPmmjrMYSIjv7HQ9SbO-87e3KvIM"},
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


  @override
  Widget build(BuildContext context) {

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;

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
                  onTap: () {
                    Navigator.push( context,
                      MaterialPageRoute(
                        builder: (context) {
                          return UserBio();
                        },
                      ),
                    );
                  },
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


