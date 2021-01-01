import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:http/http.dart';
import 'package:scholarship_app/sponsorships.dart';
import 'dart:convert';

import 'user_model.dart';

class CreateLogin extends StatefulWidget {
  final Function cancelBackToHome;

  CreateLogin({this.cancelBackToHome});

  @override
  _CreateLoginState createState() => _CreateLoginState();
}

Future<UserModel> createUser(String email, String password, String userName) async{
    String apiUrl = "https://geoproserver.herokuapp.com/api/register/";

    final response = await post(apiUrl, body:{
      "email": email,
      "password": password,
      "username": userName
    });
    if(response.statusCode == 201){
      final String responseString = response.body;

      return userModelFromJson(responseString);
    }else{
      return null;
    }
}

class _CreateLoginState extends State<CreateLogin> {
  bool _termsAgreed = false;

  UserModel _user;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
        children : <Widget>[
          Text(
            'CREATE YOUR ACCOUNT',
           style: TextStyle(
            color: Colors.black87,
           fontSize: 24.0,
          fontWeight: FontWeight.w600,
        ),
      ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
            controller: nameController,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            )),
          hintText: 'User Name',
            focusColor: Colors.white,
          hintStyle: TextStyle(color: Colors.blueGrey.withOpacity(0.6)),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        style: TextStyle(
          color: Colors.black87,
          fontSize: 22.0,
        ),
      ),
          SizedBox(
            height: 15.0,
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  )),
              hintText: 'Email',
              focusColor: Colors.white,
              hintStyle: TextStyle(color: Colors.blueGrey.withOpacity(0.6)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
            style: TextStyle(
              color: Colors.black87,
              fontSize: 22.0,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  )),
              hintText: 'Password',
              focusColor: Colors.white,
              hintStyle: TextStyle(color: Colors.blueGrey.withOpacity(0.6)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
            style: TextStyle(
              color: Colors.black87,
              fontSize: 22.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          _user == null ? Container():
              Text("The user ${_user.username}, ${_user.email}, ${_user.token} is created successfully"),
          Row(
            children: <Widget>[
              Checkbox(
                activeColor: Colors.blue,
                  value: _termsAgreed,
                  onChanged: (newValue) {
                    setState(() {
                      _termsAgreed =newValue;
                    });
                  },
              ),
              Text(
                  'Agreed to terms & Conditions',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16.0,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            InkWell(
              onTap: () {
              widget.cancelBackToHome();
            },
              child: Text(
                  'CANCEL',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            SizedBox(
              width: 170.0,
            ),
            Container(padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
            ),
              child: RaisedButton(
              child: Text(
                  'SAVE',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () async{
                final String userName = nameController.text;
                final String email = emailController.text;
                final String password = passwordController.text;

                final UserModel user = await createUser(email, password, userName);

                Navigator.pop(context);
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new Sponsorships()));

                setState(() {
                  _user = user;
                });
              }
            ),
            )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Text('Agree to Terms & Conditions',
          style: TextStyle(color: Colors.black87),
          ),
     ],
      ),
      )
    );
  }
}
