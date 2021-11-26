import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theclinic/utillity/dialog.dart';
import 'package:theclinic/utillity/my_style.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  double screen;
  String user, password, name;

  @override
  Container buildUser() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white54,
        ),
        margin: EdgeInsets.only(top: 16),
        width: screen *0.8,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) => user = value.trim(),
          style: TextStyle(color: MyStyle().darkColor),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: MyStyle().darkColor),
            hintText: 'Email',
            prefixIcon: Icon(
              Icons.perm_identity,
              color: MyStyle().darkColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: MyStyle().darkColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: MyStyle().lightColor),
            ),
          ),
        )
    );
  }


  Container buildPassword() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white54,
        ),
        margin: EdgeInsets.only(top: 16),
        width: screen *0.8,
        child: TextField(
          onChanged: (value) => password = value.trim(),
          style: TextStyle(color: MyStyle().darkColor),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: MyStyle().darkColor),
            hintText: 'Password',
            prefixIcon: Icon(
              Icons.lock_outline,
              color: MyStyle().darkColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: MyStyle().darkColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: MyStyle().lightColor),
            ),
          ),
        )
    );
  }

  Container buildName() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white54,
        ),
        margin: EdgeInsets.only(top: 16),
        width: screen *0.8,
        child: TextField(
          onChanged: (value) => name = value.trim(),
          style: TextStyle(color: MyStyle().darkColor),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: MyStyle().darkColor),
            hintText: 'Name',
            prefixIcon: Icon(
              Icons.fingerprint,
              color: MyStyle().darkColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: MyStyle().darkColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: MyStyle().lightColor),
            ),
          ),
        )
    );
  }

  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: buildFloatingActionButton(),
      appBar: AppBar(
        backgroundColor: MyStyle().primaryColor,
        title: Text('Register'),
      ),
      body: Center(
        child: Column(
          children: [
            buildUser(),
            buildPassword(),
            buildName(),
          ],
        ),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        print('name = $name, user = $user,\ password = $password');
        if ((name?.isEmpty??true)||(user?.isEmpty??true)||(password?.isEmpty??true)){
          print('Have Space');
          normalDialog(context, 'Please enter information');
        } else{
          print('No Spacce');
          registerFirebase();
        }
      },
      child: Icon(Icons.cloud_upload_rounded),
    );
  }

  Future<Null> registerFirebase() async{
    await Firebase.initializeApp().then((value) async{
      print('######## information to database ########');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: user, password: password)
          .then((value) async {
            print('Register Success');
            await value.user.updateProfile(displayName: name).then((value) =>
                Navigator.pushNamedAndRemoveUntil(
                    context, '/myService', (route) => false));
                    /*String uid = value.user.uid;
                    print('uid = $uid');*/


              /*UserModel model = UserModel(email: user, password: password, name: name );
              Map<String, dynamic> data = model.toMap();

              await FirebaseFirestore.instance.collection('UserClinic')
                  .doc(user)
                  .set(data)
                  .then((value) => print('Save to Firestore Success'));*/


      }).catchError((value) {
        normalDialog(context, value.message);
      });
    });
  }
}
