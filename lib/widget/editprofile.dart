import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:theclinic/profile/ShowDataPage.dart';
import 'package:theclinic/utillity/my_style.dart';

void main() => runApp(new MaterialApp(home: new MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autovalidate = false;
  String name, surname, sex, old, phone, information;
  List<DropdownMenuItem<String>> items = [
    new DropdownMenuItem(
      child: new Text('Male'),
      value: 'Male',
    ),
    new DropdownMenuItem(
      child: new Text('Female'),
      value: 'Female',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: MyStyle().primaryColor,
        title: Text('Profile'),
      ),
      body: new SingleChildScrollView(
        child: new Container(
          padding: new EdgeInsets.all(15.0),
          child: new Form(
            key: _key,
            autovalidate: _autovalidate,
            child: FormUI(),
          ),
        ),
      ),
    );
  }

  Widget FormUI() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Flexible(
              child: new TextFormField(
                decoration: new InputDecoration(hintText: 'Name'),
                validator: validateName,
                onSaved: (val) {
                  name = val;
                },
              ),
            ),
            new Flexible(
              child: new TextFormField(
                decoration: new InputDecoration(hintText: 'Surname'),
                validator: validateName,
                onSaved: (val) {
                  surname = val;
                },
              ),
            ),
          ],
        ),
        new Row(children: <Widget>[
          new Flexible(
            child: new TextFormField(
              decoration: new InputDecoration(hintText: 'Old'),
              validator: validateName,
              onSaved: (val) {
                old = val;
              },
            ),
          ),
          new SizedBox(width: 10.0),
          new DropdownButtonHideUnderline(
              child: new DropdownButton(
            items: items,
            hint: new Text('Sex'),
            value: sex,
            onChanged: (String val) {
              setState(() {
                sex = val;
              });
            },
          ))
        ]),
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Phone'),
          validator: validateName,
          onSaved: (val) {
            phone = val;
          },
        ),
        new SizedBox(height: 10.0),
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Information'),
          onSaved: (val) {
            information = val;
          },
          validator: validateMessage,
          maxLines: 5,
          maxLength: 256,
        ),
        new RaisedButton(
          color: MyStyle().primaryColor,
          onPressed: _sendToServer,
          child: new Text('Send',
            style: new TextStyle(color: Colors.white),
          ),
        ),
        new SizedBox(height: 20.0),
        new RaisedButton(
          color: MyStyle().primaryColor,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new ShowDataPage()));
          },
          child: new Text('Show Data',
            style: new TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      DatabaseReference ref = FirebaseDatabase.instance.reference();
      var data = {
        "Name": name,
        "Surname": surname,
        "Sex": sex,
        "Old": old,
        "Phone": phone,
        "Information": information,
      };
      ref.child('profile_user').push().set(data).then((v) {
        _key.currentState.reset();
      });
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }

  String validateName(String val) {
    return val.length == 0 ? "Enter Name First" : null;
  }

  String validateMessage(String val) {
    return val.length == 0 ? "Enter Email First" : null;
  }
}
