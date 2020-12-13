import 'package:flutter/material.dart';

class  HomeSignInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(padding: EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 20.0,
        ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(' Sign Up ',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
        Container(padding: EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 20.0,
        ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(' Sign Up ',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30.0,
        ),
        Text('ALREADY REGISTERED? SIGN UP',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}

