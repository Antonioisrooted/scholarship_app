import 'package:flutter/material.dart';
import 'package:scholarship_app/all_sponsorships.dart';
import 'package:scholarship_app/textformfield.dart';
import 'package:scholarship_app/responsive_ui.dart';
import 'package:scholarship_app/bio_model.dart';
import 'package:scholarship_app/bio_service.dart';

class UserBio extends StatefulWidget {

  int scholarship_id;

  UserBio(
  {Key key, this.scholarship_id}
      ): super (key: key);

  @override
  _UserBioState createState() => _UserBioState();
}

class _UserBioState extends State<UserBio> {

  int scholarship_id;

  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;

  BioModel _apply;

  TextEditingController first_nameController = TextEditingController();
  TextEditingController last_nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController school_nameController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController cover_letterController = TextEditingController();
  TextEditingController postal_codeController = TextEditingController();


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  void initState() {
    super.initState();
    scholarship_id = widget.scholarship_id;
  }

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
        child: Scaffold(
          body: Container(
            height: _height,
            width: _width,
            padding: EdgeInsets.only(bottom: 5),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: _height / 10),
                  personalTextRow(),
                  personalForm(),
                  SizedBox(height: _height / 20),
                  educationTextRow(),
                  educationForm(),
                  SizedBox(height: _height / 20),
                  button(),
                ],
              ),
            ),
          ),
        )

    );
  }

  Widget personalTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 15.0),
      child: Row(
        children: <Widget>[
          Text(
            "Personal Information",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: _large ? 20 : (_medium ? 17.5 : 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget personalForm() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 15.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            first_nameTextFormField(),
            SizedBox(height: _height / 40.0),
            last_nameTextFormField(),
            SizedBox(height: _height / 40.0),
            mobileTextFormField(),
            SizedBox(height: _height / 40.0),
            countryTextFormField(),
            SizedBox(height: _height / 40.0),
            cityTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget first_nameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.name,
      textEditingController: first_nameController,
      icon: Icons.title,
      hint: "First Name",
    );
  }

  Widget last_nameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.name,
      textEditingController: last_nameController,
      icon: Icons.title,
      hint: "Last Name",
    );
  }

  Widget mobileTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.number,
      textEditingController: mobileController,
      icon: Icons.title,
      hint: "Mobile",
    );
  }

  Widget countryTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.name,
      textEditingController: countryController,
      icon: Icons.title,
      hint: "Country",
    );
  }

  Widget cityTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.name,
      textEditingController: cityController,
      icon: Icons.title,
      hint: "City",
    );
  }

  Widget educationTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 15.0),
      child: Row(
        children: <Widget>[
          Text(
            "Education Information",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: _large ? 20 : (_medium ? 17.5 : 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget educationForm() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 15.0),
      child: Form(
        key: _formKey2,
        child: Column(
          children: <Widget>[
            school_nameTextFormField(),
            SizedBox(height: _height / 40.0),
            degreeTextFormField(),
            SizedBox(height: _height / 40.0),
            cover_letterTextFormField(),
            SizedBox(height: _height / 40.0),
            postal_codeTextFormField(),
            SizedBox(height: _height / 40.0),
          ],
        ),
      ),
    );
  }

  Widget school_nameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.name,
      textEditingController: school_nameController,
      icon: Icons.title,
      hint: "School Name",
    );
  }


  Widget degreeTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      textEditingController: degreeController,
      icon: Icons.title,
      hint: "Degree",
    );
  }

  Widget cover_letterTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      textEditingController: cover_letterController,
      icon: Icons.title,
      hint: "Cover Letter",
    );
  }

  Widget postal_codeTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      textEditingController: postal_codeController,
      icon: Icons.title,
      hint: "Postal Code",
    );
  }

  Widget button() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () async {
        final String first_name = first_nameController.text;
        final String last_name = last_nameController.text;
        final String mobile = mobileController.text;
        final String country = countryController.text;
        final String city = cityController.text;
        final String school_name = school_nameController.text;
        final String degree = degreeController.text;
        final String cover_letter = cover_letterController.text;
        final String postal_code = postal_codeController.text;


            final BioModel apply = await createApplications(widget.scholarship_id,
            first_name, last_name,
            mobile, country, city, school_name, degree, cover_letter,
            postal_code);

        setState(() {
        _apply = apply;
        });

        showDialog(
        context: context,
        builder: (_) =>
        AlertDialog(
        title: Text('SUCCESS'),
        content: Text('Application has been created successfully'),
        actions: <Widget>[
        FlatButton(
        child: Text('Ok'),
        onPressed: () {
        Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) {
        return AllSponsorships();
        },
        ),
        );
        },
        )
        ]
        ,
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

}
