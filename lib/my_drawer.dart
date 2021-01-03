import 'package:flutter/material.dart';
import 'package:scholarship_app/add_sponsors.dart';
// import 'package:scholarship_app/sponsorships.dart';
import 'package:scholarship_app/all_sponsorships.dart';
import 'package:scholarship_app/menu_frame.dart';
import 'package:scholarship_app/view_applicants.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold
      (
      drawer: DrawerCodeOnly(),
      appBar: new AppBar
        (
        title: new Text(' Admin '),
        centerTitle: true,
      ),
      body: new Text(' Welcome '),
    );
  }
}


class DrawerCodeOnly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer
      (
      child: new ListView
        (
        children: <Widget>
        [

          new ListTile
            (
            title: new Text(' All Sponsorships '),
            onTap: ()
            {
              Navigator.pop(context);
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new AllSponsorships()));
            },
          ),
          new ListTile
            (
            title: new Text('  View Applicants '),
            onTap: ()
            {
              Navigator.pop(context);
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new ViewApplicants()));
            },
          ),
          new ListTile
            (
            title: new Text(' Add Sponsors '),
            onTap: ()
            {
              Navigator.pop(context);
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new AddSponsors()));
            },
          ),
    new ListTile
    (
    title: new Text(' Log Out '),
    onTap: () {
      Navigator.pop(context);
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new MenuFrame()));
    }
    )
        ],
      ),
    );
  }
}

