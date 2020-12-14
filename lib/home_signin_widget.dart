import 'package:flutter/material.dart';

class  HomeSignInWidget extends StatelessWidget {
  final Function goToSignUp;
  final Function goToSignIn;

  HomeSignInWidget({this.goToSignUp,this.goToSignIn});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 140.0,
        ),
        InkWell(onTap: (){
          goToSignUp();
        },
          child: Container(padding: EdgeInsets.symmetric(
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
                Text(
                  ' Sign Up ',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 50.0,
        ),
        InkWell(onTap: (){
          goToSignIn();
        },
          child: Text('ALREADY REGISTERED? SIGN IN',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}

