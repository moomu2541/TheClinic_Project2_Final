import 'package:flutter/material.dart';
import 'package:theclinic/promotion/promotion_list.dart';
import 'package:theclinic/utillity/my_style.dart';

void main() {
  runApp(MyPro());
}

class MyPro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: MyStyle().primaryColor,
          title: Text("Promotion ListView"),
        ),
        body: Promotion(),
      ),
    );
  }
}
