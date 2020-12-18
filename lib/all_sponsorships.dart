import 'package:flutter/material.dart';
import 'package:scholarship_app/my_drawer.dart';

class AllSponsorships extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold
      (
      drawer: new DrawerCodeOnly(),
      appBar: new AppBar
        (
        title: new Text(' All Sponsorship '),
      ),
      body: new Text(' Hey I am body '),
    );
  }
}