import 'package:flutter/material.dart';
import 'package:scholarship_app/my_drawer.dart';

class AddSponsors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold
      (
      drawer: new DrawerCodeOnly(),
      appBar: new AppBar
        (
        title: new Text(' Add Sponsors '),
        centerTitle: true,
      ),
      body: new Text(' Hey I am body '),
    );
  }
}
