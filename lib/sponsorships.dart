import 'package:flutter/material.dart';

class Sponsorship extends StatefulWidget {
  @override
  _SponsorshipState createState() => _SponsorshipState();
}

class _SponsorshipState extends State<Sponsorship> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar
        (
        title: new Text(' All Sponsorships '),
        centerTitle: true,
      ),
      body: getBody(),
    );
  }
  Widget getBody(){
    return ListView.builder(itemBuilder: (contex,index){
      return getCard();
    }
    );
  }
    Widget getCard(){
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            title: Row(
              children: <Widget>[
                Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(60/2),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                NetworkImage("https://images.unsplash.com/photo-1544830281-1d5169d6b2af?ixid=MXwxMjA3fDB8MHxzZWFyY2h8N3x8YWNhZGVtaWMlMjBzcG9uc29yc2hpcHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60")
                )
                ),
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Test Scholarship', style: TextStyle(fontSize: 16),),
                    SizedBox(height: 10,),
                    Text('Apply for the scholarship', style: TextStyle(fontSize: 16),),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }
  }



