import 'package:flutter/material.dart';
import 'package:scholarship_app/my_drawer.dart';

// class AddSponsors extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold
//       (
//       drawer: new DrawerCodeOnly(),
//       appBar: new AppBar
//         (
//         title: new Text(' Add Sponsors '),
//         centerTitle: true,
//       ),
//       body: new Text(' Hey I am body '),
//     );
//   }
// }
class AddSponsors extends StatefulWidget {
  @override
  _AddSponsorsState createState() => _AddSponsorsState();
}

class _AddSponsorsState extends State<AddSponsors> {

  String _fullName;
  String _description;


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

  Widget _buildDescription(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Description'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Postal Address is required';
        }

        return null;
      },
      onSaved: (String value){
        _description = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Sponsors")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(' Add Sponsors ',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                _buildFullName(),
                SizedBox(height: 10),
                _buildDescription(),
                SizedBox(height: 10),

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
                    print(_description);

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
