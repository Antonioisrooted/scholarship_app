import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:scholarship_app/signmodel.dart';
import 'package:scholarship_app/sponsorships.dart';
import 'package:scholarship_app/user_model.dart';
import 'package:http/http.dart'as http;

class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

Future<SignModel> createUser(String email, String password) async{
  String apiUrl = "https://geoproserver.herokuapp.com/api/login/";

  final response = await post(apiUrl, body:{
    "email": email,
    "password": password
  });
  if(response.statusCode == 201){
    final String responseString = response.body;

    return signModelFromJson(responseString);
  }else{
    return null;
  }
}

class _SignInState extends State<SignIn> {
  bool _rememberPassword = false;

  SignModel _user;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            'SIGN IN',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
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
            height: 20.0,
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
          Text("The user ${_user.email}, ${_user.token} is created successfully"),
          Row(
            children: <Widget>[
              Checkbox(
                activeColor: Colors.blue,
                value: _rememberPassword,
                onChanged: (newValue) {
                  setState(() {
                    _rememberPassword =newValue;
                  });
                },
              ),
              Text(
                'Remember Password',
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
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                30.0,
              ),
            ),
            child: RaisedButton(
                child: Text(
                  'SIGN IN',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async{
                  final String email = emailController.text;
                  final String password = passwordController.text;

                  final SignModel user = await createUser(email, password);

                  Navigator.pop(context);
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new Sponsorships()));

                  setState(() {
                    _user = user;
                  });
                }
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text('FORGOT PASSWORD?',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            color: Colors.white.withOpacity(0.1),
            child: Text('DON\'T HAVE AN ACCOUNT? SIGN UP'),
          )
        ],
      ),
    );
  }
}

