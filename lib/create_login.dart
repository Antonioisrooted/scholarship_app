import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CreateLogin extends StatefulWidget {
  final Function cancelBackToHome;

  CreateLogin({this.cancelBackToHome});

  @override
  _CreateLoginState createState() => _CreateLoginState();
}

class _CreateLoginState extends State<CreateLogin> {
  bool _termsAgreed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            'CREATE YOUR LOGIN',
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
          hintText: 'First Name',
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
          TextField(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  )),
              hintText: 'Second Name',
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
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  30.0,
                ),
              ),
              child: Text(
                  'SAVE',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
    );
  }
}
