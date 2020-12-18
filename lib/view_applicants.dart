import 'package:flutter/material.dart';
import 'package:scholarship_app/my_drawer.dart';

class ViewApplicants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold
      (
      drawer: new DrawerCodeOnly(),
      appBar: new AppBar
        (
        title: new Text(' View Application '),
      ),
      body: new Text(' Hey I am body '),
    );
  }
}
