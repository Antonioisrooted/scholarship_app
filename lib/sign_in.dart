import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _rememberPassword = false;

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
            child: Text(
              'LOG IN',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
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
