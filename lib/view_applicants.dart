import 'package:flutter/material.dart';
import 'package:scholarship_app/my_drawer.dart';

class ViewApplicants extends StatelessWidget {
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
                        NetworkImage("https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8cGVvcGxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60")
                    )
                ),
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Wangari chege', style: TextStyle(fontSize: 16),),
                  SizedBox(height: 10,),
                  Text('Applied for the scholarship', style: TextStyle(fontSize: 16),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
