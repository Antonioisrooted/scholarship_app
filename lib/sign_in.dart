import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:scholarship_app/all_sponsorships.dart';
import 'package:scholarship_app/create_login.dart';
import 'package:scholarship_app/responsive_ui.dart';
import 'package:scholarship_app/signmodel.dart';
import 'package:scholarship_app/sponsorships.dart';
import 'package:scholarship_app/user_bio.dart';
import 'package:scholarship_app/user_model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scholarship_app/validator.dart';
import 'package:http/http.dart'as http;

import 'custom_shape.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with Validator {
  bool isHidden = true;
  bool _isLoading = false;
  showdialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Row(
                children: <Widget>[
                  Text("Logging in..."),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  )
                ],
              ));
        });
  }

  void _toggleVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  signIn(String email, String password) async {
    setState(() {
      _isLoading = true;
    });
    showdialog(context);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map body = {"email": email, "password": password};
    var jsonResponse;
    var res = await http.post("https://geoproserver.herokuapp.com/api/login/",
        body: body);
    if (res.statusCode == 200) {
      jsonResponse = json.decode(res.body);
      // Navigator.of(context).pushNamed("Home");
    }
    if (jsonResponse != null) {
      setState(() {
        _isLoading = false;
      });
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }

      sharedPreferences.setString("token", jsonResponse['token']);
      String token = jsonResponse['token'];
      /* decode() method will decode your token's payload */
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

      if (decodedToken["is_staff"] != true) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => AllSponsorships()),
                (Route<dynamic> route) => false);
        // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => UserBio()),
                (Route<dynamic> route) => false);
        // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => StaffHomePage()));
      }
    }
  }

  bool checkBoxValue = false;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;

// Future<SignModel> createUser(String email, String password) async{
//   String apiUrl = "https://geoproserver.herokuapp.com/api/login/";
//
//   final response = await post(apiUrl, body:{
//     "email": email,
//     "password": password
//   });
//   if(response.statusCode == 201){
//     final String responseString = response.body;
//
//     return signModelFromJson(responseString);
//   }else{
//     return null;
//   }
// }
//
// class _SignInState extends State<SignIn> {
  bool _rememberPassword = false;

  SignModel _user;

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Material(
      child: Scaffold(
        body: Container(
          height: _height,
          width: _width,
          padding: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                clipShape(),
                welcomeTextRow(),
                signInTextRow(),
                form(),
                SizedBox(height: _height / 12),
                button(),
                createLoginTextRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large
                  ? _height / 4
                  : (_medium ? _height / 3.75 : _height / 3.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.white],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large
                  ? _height / 4.5
                  : (_medium ? _height / 4.25 : _height / 4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.white],
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(
              top: _large
                  ? _height / 30
                  : (_medium ? _height / 25 : _height / 20)),
          // child: Image.asset(
          //   'assets/logo-adrian.png',
          //   height: _height / 3.5,
          //   width: _width / 3.5,
          // ),
        ),
      ],
    );
  }

  Widget welcomeTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 20, top: _height / 100),
      child: Row(
        children: <Widget>[
          Text(
            "Welcome",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: _large ? 60 : (_medium ? 50 : 40),
            ),
          ),
        ],
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 15.0),
      child: Row(
        children: <Widget>[
          Text(
            "Sign in to your account",
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: _large ? 20 : (_medium ? 17.5 : 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 15.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailTextFormField(),
            SizedBox(height: _height / 40.0),
            passwordTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget emailTextFormField() {
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: _large ? 12 : (_medium ? 10 : 8),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.blue[900],
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email, color: Colors.blue[900], size: 20),
          hintText: "Email ID",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
        validator: validateEmail,
        onSaved: (String value) {
          emailController.text = value;
        },
      ),
    );
  }

  Widget passwordTextFormField() {
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: _large ? 12 : (_medium ? 10 : 8),
      child: TextFormField(
        controller: passwordController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: isHidden,
        cursorColor: Colors.blue[900],
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock, color: Colors.blue[900], size: 20),
          hintText: "Password",
          suffixIcon: IconButton(
              onPressed: _toggleVisibility,
              icon: isHidden
                  ? Icon(Icons.visibility_off,
                  color: Colors.blue[900], size: 20)
                  : Icon(Icons.visibility, color: Colors.blue[900], size: 20)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
        validator: validatePasswordLength,
        onSaved: (String value) {
          passwordController.text = value;
        },
      ),
    );
  }

  Widget button() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        if (!formKey.currentState.validate()) {
          return;
        }
        formKey.currentState.save();
        setState(() {
          _isLoading = true;
        });
        signIn(emailController.text, passwordController.text);
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: _large ? _width / 4 : (_medium ? _width / 3.75 : _width / 3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.blue[900], Colors.pinkAccent],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text('SIGN IN',
            style: TextStyle(fontSize: _large ? 14 : (_medium ? 12 : 10))),
      ),
    );
  }

  Widget createLoginTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 120.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Don't have an account?",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 14 : (_medium ? 12 : 10)),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              // Navigator.of(context).pushNamed(createogin);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CreateLogin();
                  },
                ),
              );
              print("Routing to Create Login screen");
            },
            child: Text(
              "Sign up",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.blue[900],
                  fontSize: _large ? 19 : (_medium ? 17 : 15)),
            ),
          )
        ],
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: <Widget>[
//           Text(
//             'SIGN IN',
//             style: TextStyle(
//               color: Colors.black87,
//               fontSize: 24.0,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           TextField(
//             controller: emailController,
//             decoration: InputDecoration(
//               enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.white,
//                   )),
//               hintText: 'Email',
//               focusColor: Colors.white,
//               hintStyle: TextStyle(color: Colors.blueGrey.withOpacity(0.6)),
//               focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             style: TextStyle(
//               color: Colors.black87,
//               fontSize: 22.0,
//             ),
//           ),
//           SizedBox(
//             height: 20.0,
//           ),
//           TextField(
//             controller: passwordController,
//             obscureText: true,
//             decoration: InputDecoration(
//               enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.white,
//                   )),
//               hintText: 'Password',
//               focusColor: Colors.white,
//               hintStyle: TextStyle(color: Colors.blueGrey.withOpacity(0.6)),
//               focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             style: TextStyle(
//               color: Colors.black87,
//               fontSize: 22.0,
//             ),
//           ),
//           SizedBox(
//             height: 20.0,
//           ),
//           _user == null ? Container():
//           Text("The user ${_user.email}, ${_user.token} is created successfully"),
//           Row(
//             children: <Widget>[
//               Checkbox(
//                 activeColor: Colors.blue,
//                 value: _rememberPassword,
//                 onChanged: (newValue) {
//                   setState(() {
//                     _rememberPassword =newValue;
//                   });
//                 },
//               ),
//               Text(
//                 'Remember Password',
//                 style: TextStyle(
//                   color: Colors.black87,
//                   fontSize: 16.0,
//                 ),
//               )
//             ],
//           ),
//           SizedBox(
//             height: 20.0,
//           ),
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.symmetric(
//               vertical: 10.0,
//               horizontal: 20.0,
//             ),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(
//                 30.0,
//               ),
//             ),
//             child: RaisedButton(
//                 child: Text(
//                   'SIGN IN',
//                   style: TextStyle(
//                     color: Colors.black87,
//                     fontSize: 14.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 onPressed: () async{
//                   final String email = emailController.text;
//                   final String password = passwordController.text;
//
//                   final SignModel user = await createUser(email, password);
//
//                   Navigator.pop(context);
//                   Navigator.push(context, new MaterialPageRoute(builder: (context) => new Sponsorships()));
//
//                   setState(() {
//                     _user = user;
//                   });
//                 }
//             ),
//           ),
//           SizedBox(
//             height: 20.0,
//           ),
//           Text('FORGOT PASSWORD?',
//             style: TextStyle(
//               color: Colors.black87,
//               fontSize: 14.0,
//               fontWeight: FontWeight.bold,
//               decoration: TextDecoration.underline,
//             ),
//           ),
//           SizedBox(
//             height: 20.0,
//           ),
//           Container(
//             color: Colors.white.withOpacity(0.1),
//             child: Text('DON\'T HAVE AN ACCOUNT? SIGN UP'),
//           )
//         ],
//       ),
//     );
//   }
// }

