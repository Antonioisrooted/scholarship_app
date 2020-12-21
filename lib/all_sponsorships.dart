import 'package:flutter/material.dart';
import 'package:scholarship_app/my_drawer.dart';

class AllSponsorships extends StatelessWidget {
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
    return ListView.builder(itemBuilder: (context,index){
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
                        NetworkImage("https://images.unsplash.com/photo-1481627834876-b7833e8f5570?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8Ym9va3N8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60")
                    )
                ),
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Test Scholarship', style: TextStyle(fontSize: 16),),
                  SizedBox(height: 10,),
                  Text('Scholarship to be applied', style: TextStyle(fontSize: 16),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}