import 'package:flutter/material.dart';
import 'package:scholarship_app/home_signin_widget.dart';

class MenuFrame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 120.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Adr',
                      style: TextStyle(
                        fontSize: 38.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(94, 200, 240, 1),
                      ),
                    ),
                    Text(
                      'ian',
                      style: TextStyle(
                        fontSize: 38.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0,
                ),
                Text(
                  'Scholarship Program',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 80.0,
                ),
                Expanded(
                  child: PageView(children: <Widget>[
                    HomeSignInWidget(),
                    HomeSignInWidget(),
                  ],
                  ),
                ),
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment. topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(194, 228, 240, 1),
              Color.fromRGBO(255, 255, 255, 1),
            ],
          ),
        ),
      ),
    );
  }
}
