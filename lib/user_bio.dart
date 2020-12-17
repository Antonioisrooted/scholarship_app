import 'package:flutter/material.dart';

class UserBio extends StatefulWidget {
  @override
  _UserBioState createState() => _UserBioState();
}

class _UserBioState extends State<UserBio> {

  String _fullName;
  String _address;
  String _phoneNumber;
  String _email;
  String _birthCertificateNumber;
  String _idNumber;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildFullName(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Full Name'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is required';
        }

        return null;
      },
      onSaved: (String value){
        _fullName = value;
      },
    );
  }

  Widget _buildAddress(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Postal Address'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Postal Address is required';
        }

        return null;
      },
      onSaved: (String value){
        _address = value;
      },
    );
  }

  Widget _buildPhoneNumber(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone Number'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is required';
        }

        return null;
      },
      onSaved: (String value){
        _phoneNumber = value;
      },
    );
  }

  Widget _buildEmail(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email address is required';
        }

        return null;
      },
      onSaved: (String value){
        _email = value;
      },
    );
  }

  Widget _buildBirthCertificateNumber(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Birth Certificate Number'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Birth certificate number is required';
        }

        return null;
      },
      onSaved: (String value) {
        _birthCertificateNumber = value;
      },
    );
  }

  Widget _buildIdNumber(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Id Number'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Id number is required';
        }

        return null;
      },
      onSaved: (String value){
        _idNumber = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Bio_Data")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildFullName(),
            SizedBox(height: 20),
            _buildAddress(),
            SizedBox(height: 20),
            _buildPhoneNumber(),
            SizedBox(height: 20),
            _buildEmail(),
            SizedBox(height: 20),
            _buildBirthCertificateNumber(),
            SizedBox(height: 20),
            _buildIdNumber(),
            SizedBox(height: 50),
            RaisedButton(
                child: Text(
                  ' Submit ',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16
                  ),
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()){
                    return;
                  }

                  _formKey.currentState.save();

                  print(_fullName);
                  print(_address);
                  print(_phoneNumber);
                  print(_email);
                  print(_birthCertificateNumber);
                  print(_idNumber);
                },
            )
          ],
        ),
        ),
      ),
      ),
    );
  }
}
