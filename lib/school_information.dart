import 'package:flutter/material.dart';

class SchoolInformation extends StatefulWidget {
  @override
  _SchoolInformationState createState() => _SchoolInformationState();
}

class _SchoolInformationState extends State<SchoolInformation> {

  String _schoolName;
  String _schoolAddress;
  String _studentLevel;
  String _completionYear;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("School Information")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildSchoolName(),
                SizedBox(height: 20),
                _buildSchoolAddress(),
                SizedBox(height: 20),
                _buildStudentLevel(),
                SizedBox(height: 20),
                _buildCompletionYear(),
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

                    print(_schoolName);
                    print(_schoolAddress);
                    print(_studentLevel);
                    print(_completionYear);

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
