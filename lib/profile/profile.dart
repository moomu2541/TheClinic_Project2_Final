
import 'package:flutter/material.dart';
import '../widget/Ep241Widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//==================================================================
// MAIN CLASS
//==================================================================
class Ep241Page extends StatefulWidget {
  @override
  _Ep241PageState createState() => _Ep241PageState();
}

//==================================================================
// STATE CLASS
//==================================================================
class _Ep241PageState extends State<Ep241Page> {
//==================================================================
// DECLARE VARIABLE
//==================================================================
//======================================================
// STEP#1: SNACKBAR
//======================================================
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final firestoreInstance = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final TextEditingController nameController = TextEditingController()..text;
  // final TextEditingController passwordController =  TextEditingController();
  final TextEditingController mobileNoController = TextEditingController()
    ..text;
  final TextEditingController addressController = TextEditingController()..text;
  final TextEditingController emailController = TextEditingController()..text;
  final TextEditingController lineIdController = TextEditingController()..text;
  final TextEditingController heightController = TextEditingController()..text;
  final TextEditingController weightController = TextEditingController()..text;
  final TextEditingController cdController = TextEditingController()..text;
  final TextEditingController adController = TextEditingController()..text;
  final RegExp emailRegExpression =
      RegExp('[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}');
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("Profile")
        .doc(auth.currentUser.email)
        .get()
        .then((value) {
      emailController.text = value.data()["age"];
      nameController.text = value.data()["name"];
      mobileNoController.text = value.data()["mobileNo"];
      lineIdController.text = value.data()["lineID"];
      addressController.text = value.data()["address"];
      heightController.text = value.data()["height"];
      weightController.text = value.data()["weight"];
      cdController.text = value.data()["congenital disease"];
      adController.text = value.data()["allergic drug"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//======================================================
// STEP#2: SNACKBAR : DEFINE KEY
//======================================================
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        children: <Widget>[
//==================================================================
// TEXTFORM FIELD: E-MAIL
//==================================================================

//==================================================================
// TEXTFORM FIELD: NAME
//==================================================================
          TextFormFieldWidget(
            obscureText: false,
            textController: nameController,
            autovalidate: true,
            textInputType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Name-Sermane',
              hintText: 'Enter Name-Sermane',
              icon: Icon(Icons.person),
            ),
            validator: (String value) {
              // if (value.isEmpty) {return 'Enter Name';}
              return null;
            },
          ),
          TextFormFieldWidget(
            obscureText: false,
            textController: emailController,
            autovalidate: true,
            textInputType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'age',
              hintText: 'Enter age',
              icon: Icon(Icons.emoji_people),
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Enter Mobile No';
              }
              return null;
            },
          ),
          TextFormFieldWidget(
            obscureText: false,
            textController: weightController,
            autovalidate: true,
            textInputType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'weight',
              hintText: 'Enter weight',
              icon: Icon(Icons.monitor_weight),
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Enter Mobile No';
              }
              return null;
            },
          ),
          TextFormFieldWidget(
            obscureText: false,
            textController: heightController,
            autovalidate: true,
            textInputType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'height',
              hintText: 'Enter height',
              icon: Icon(Icons.height),
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Enter Mobile No';
              }
              return null;
            },
          ),
          TextFormFieldWidget(
            obscureText: false,
            textController: cdController,
            autovalidate: true,
            textInputType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Congenital disease',
              hintText: 'Congenital disease',
              icon: Icon(Icons.line_style),
            ),
            validator: (String value) {
              // if (value.isEmpty) {return 'Enter Line ID';}
              return null;
            },
          ),
          TextFormFieldWidget(
            obscureText: false,
            textController: adController,
            autovalidate: true,
            textInputType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Allergic drug',
              hintText: 'Allergic drug',
              icon: Icon(Icons.line_style),
            ),
            validator: (String value) {
              // if (value.isEmpty) {return 'Enter Line ID';}
              return null;
            },
          ),
//==================================================================
// TEXTFORM FIELD: ADDRESS
//==================================================================
          TextFormFieldWidget(
            obscureText: false,
            textController: addressController,
            autovalidate: true,
            textInputType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Address',
              hintText: 'Enter Address',
              icon: Icon(Icons.home),
            ),
            validator: (String value) {
              // if (value.isEmpty) {return 'Enter Address';}
              return null;
            },
          ),
//==================================================================
// TEXTFORM FIELD: MOBILE
//==================================================================
          TextFormFieldWidget(
            obscureText: false,
            textController: mobileNoController,
            autovalidate: true,
            textInputType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Mobile No',
              hintText: 'Enter Mobile No',
              icon: Icon(Icons.phone),
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Enter Mobile No';
              }
              return null;
            },
          ),
//==================================================================
// TEXTFORM FIELD: LINE
//==================================================================
          TextFormFieldWidget(
            obscureText: false,
            textController: lineIdController,
            autovalidate: true,
            textInputType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Line',
              hintText: 'Line',
              icon: Icon(Icons.online_prediction),
            ),
            validator: (String value) {
              // if (value.isEmpty) {return 'Enter Line ID';}
              return null;
            },
          ),
//==================================================================
// SAVE BUTTON
//==================================================================
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 360.0,
                height: 50.0,
                color: Colors.blue.shade100,
                child: RaisedButton(
                    onPressed: () async {
                      fnSaveProfile(
                          email: emailController.text,
                          name: nameController.text,
                          address: addressController.text,
                          mobileNo: mobileNoController.text,
                          lineId: lineIdController.text,
                          height: heightController.text,
                          weight: weightController.text,
                          cd: cdController.text,
                          ad: adController.text,
                          );
                    },
                    child: Text('Save',
                        style: TextStyle(color: Colors.black, fontSize: 15))),
              ),
            ],
          ),

//==================================================================
// END LISVIEW
//==================================================================
        ],
      ),
    );
  }

//======================================================
// SAVE PROFILE FUNCTION
//======================================================
  fnSaveProfile(
      {String email,
      String name,
      String address,
      String mobileNo,
      String lineId,
      String height,
      String weight,
      String cd,
      String ad}
      ) async {
    await firestore.collection("Profile").doc(auth.currentUser.email).set({
      'age': email,
      'name': name,
      'address': address,
      'mobileNo': mobileNo,
      'lineID': lineId,
      'height': height,
      'weight': weight,
      'congenital disease': cd,
      'allergic drug': ad,
    }).then((value) {
      scaffoldKey.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text('Register $email profile completed. ')));
    }).catchError((error) {
      scaffoldKey.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text('Register $email profile error $error ')));
    });

//======================================================
// SAVE TO DB "FIREBASE STORE"
//======================================================

//
//======================================================
// STEP#4: SNACKBAR : SHOW SNACKBAR
//======================================================
  }
}
