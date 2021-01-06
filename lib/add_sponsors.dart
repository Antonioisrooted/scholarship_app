import 'package:flutter/material.dart';
import 'package:scholarship_app/my_drawer.dart';
import 'package:scholarship_app/responsive_ui.dart';
import 'package:scholarship_app/textformfield.dart';

import 'api_service.dart';
import 'create_model.dart';
import 'created.dart';

class AddSponsors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //This provides the total height & width of screen
    return Scaffold
      (
      drawer: new DrawerCodeOnly(),
      appBar: new AppBar
        (
        title: new Text(' Add Sponsors '),
        centerTitle: true,
      ),
      body: AddSponsorsPg(),
    );
  }
}

class AddSponsorsPg extends StatefulWidget{
  @override
  _AddSponsorsPgState createState() => _AddSponsorsPgState();
}

class _AddSponsorsPgState extends State<AddSponsorsPg> {

  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;

  CreateModel _scholarship ;

  TextEditingController scholarshipNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> globalForm3Key = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery
        .of(context)
        .size
        .height;
    _width = MediaQuery
        .of(context)
        .size
        .width;
    _pixelRatio = MediaQuery
        .of(context)
        .devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      child: Container(
        height: _height,
        width: _width,
        padding: EdgeInsets.only(bottom: 5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: _height / 10),
              createTextRow(),
              applicationForm(),
              SizedBox(height: _height / 20),
              button(),
            ],
          ),
        ),
      ),
    );
  }

  Widget createTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 15.0),
      child: Row(
        children: <Widget>[
          Text(
            "Create a new Scholarship",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: _large ? 20 : (_medium ? 17.5 : 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget applicationForm() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0,
          right: _width / 12.0,
          top: _height / 15.0),
      child: Form(
        key: globalForm3Key,
        child: Column(
          children: <Widget>[
            scholarshipNameTextFormField(),
            SizedBox(height: _height / 40.0),
            descriptionTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget scholarshipNameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.name,
      textEditingController: scholarshipNameController,
      icon: Icons.title,
      hint: "Scholarship Title",
    );
  }

  Widget descriptionTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      textEditingController: descriptionController,
      icon: Icons.description_outlined,
      hint: "Scholarship Details",
    );
  }

  Widget button() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () async {
        final String name = scholarshipNameController.text;
        final String description = descriptionController.text;

        final CreateModel scholarship = await createScholarship(name, description);

        setState(() {
          _scholarship = scholarship;
        });

        showDialog(
            context: context,
            builder: (_) =>
                AlertDialog(
                  title: Text('SUCCESS'),
                  content: Text('Scholarship has been created successfully'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Ok'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CreatedPg();
                            },
                          ),
                        );
                      },
                    )
                  ],
                )
        );
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: _large ? _width / 4 : (_medium ? _width / 3.75 : _width / 3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.blue[900], Colors.blueAccent],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text('CREATE',
          style: TextStyle(fontSize: _large ? 14 : (_medium ? 12 : 10)),),
      ),
    );
  }

// class AddSponsors extends StatefulWidget {
//   @override
//   _AddSponsorsState createState() => _AddSponsorsState();
// }
//
// class _AddSponsorsState extends State<AddSponsors> {
//
//   String _fullName;
//   String _description;
//
//
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   Widget _buildFullName(){
//     return TextFormField(
//       decoration: InputDecoration(labelText: 'Full Name'),
//       validator: (String value) {
//         if (value.isEmpty) {
//           return 'Name is required';
//         }
//
//         return null;
//       },
//       onSaved: (String value){
//         _fullName = value;
//       },
//     );
//   }
//
//   Widget _buildDescription(){
//     return TextFormField(
//       decoration: InputDecoration(labelText: 'Description'),
//       validator: (String value) {
//         if (value.isEmpty) {
//           return 'Postal Address is required';
//         }
//
//         return null;
//       },
//       onSaved: (String value){
//         _description = value;
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Add Sponsors")),
//       body: Container(
//         margin: EdgeInsets.all(24),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child:Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(' Add Sponsors ',
//                   style: TextStyle(
//                     color: Colors.black87,
//                     fontSize: 24.0,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 _buildFullName(),
//                 SizedBox(height: 10),
//                 _buildDescription(),
//                 SizedBox(height: 10),
//
//                 RaisedButton(
//                   child: Text(
//                     ' Submit ',
//                     style: TextStyle(
//                         color: Colors.blue,
//                         fontSize: 16
//                     ),
//                   ),
//                   onPressed: () {
//                     if (!_formKey.currentState.validate()){
//                       return;
//                     }
//
//                     _formKey.currentState.save();
//
//                     print(_fullName);
//                     print(_description);
//
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
}