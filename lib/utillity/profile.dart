import 'package:flutter/material.dart';
import 'package:theclinic/utillity/my_style.dart';

class ProFile extends StatefulWidget {
  @override
  _ProFileState createState() => _ProFileState();
}

class _ProFileState extends State<ProFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().primaryColor,
        centerTitle: true,
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'No Data',
            ),
          ],
        ),
      ),
    );
  }
}