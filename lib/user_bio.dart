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

  String _schoolName;
  String _schoolAddress;
  String _studentLevel;
  String _completionYear;

  String _reasons;
  String _letter;

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


  Widget _buildSchoolName(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'School Name'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'School name is required';
        }

        return null;
      },
      onSaved: (String value){
        _schoolName = value;
      },
    );
  }

  Widget _buildSchoolAddress(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'School Address'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'School Address is required';
        }

        return null;
      },
      onSaved: (String value){
        _schoolAddress = value;
      },
    );
  }

  Widget _buildStudentLevel(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Academic level of the student'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Academic level is required';
        }

        return null;
      },
      onSaved: (String value){
        _studentLevel = value;
      },
    );
  }

  Widget _buildCompletionYear(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Expected year of completion'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Expected year of completion is required';
        }

        return null;
      },
      onSaved: (String value){
        _completionYear = value;
      },
    );
  }

  Widget _buildReasons(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Reasons why you should be sponsored'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Reasons why you should be sponsored is required';
        }

        return null;
      },
      onSaved: (String value){
        _reasons = value;
      },
    );
  }

  Widget _buildLetter(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Recommendation Letter'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Recommendation letter is required';
        }

        return null;
      },
      onSaved: (String value){
        _letter = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Information form")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(' User Bio_Data ',
              style: TextStyle(
              color: Colors.black87,
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              ),
            ),
            _buildFullName(),
            SizedBox(height: 10),
            _buildAddress(),
            SizedBox(height: 10),
            _buildPhoneNumber(),
            SizedBox(height: 10),
            _buildEmail(),
            SizedBox(height: 10),
            _buildBirthCertificateNumber(),
            SizedBox(height: 10),
            _buildIdNumber(),
            SizedBox(height: 50,),

            Text(' School Information ',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            _buildSchoolName(),
            SizedBox(height: 20),
            _buildSchoolAddress(),
            SizedBox(height: 20),
            _buildStudentLevel(),
            SizedBox(height: 20),
            _buildCompletionYear(),
            SizedBox(height: 50,),

            Text(' More Information ',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            _buildReasons(),
            SizedBox(height: 20),
            _buildLetter(),

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

                  print(_schoolName);
                  print(_schoolAddress);
                  print(_studentLevel);
                  print(_completionYear);
                  print(_reasons);
                  print(_letter);
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
