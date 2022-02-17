import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theclinic/utillity/my_style.dart';

class Healthcheck3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: MyStyle().primaryColor,
        title: Text("Detail"),
      ),
          body: Column(
        children: [
          Center(
            child: Image.asset("assets/images/coverpro1.png"),
          ),
          Center(
            child: Text('\nตรวจสุขภาพครอบครัว ราคา 3,900 บาท\n',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('รายละเอียดการให้บริการ\n',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              Text("1.ตรวจความสมบูรณ์ของเลิอด"),
              Text("2.ตรวจปัสสาวะ"),
              Text("3.ตรวจระดับน้ำตาลในกระแสเลือด"),
              Text("4.ตรวจระดับไขมันในเลือด"),
              Text("5.ตรวจการทำงานของตับ\n"),
            ],
          ),
          ElevatedButton(
            child: Text('Buy',
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle( 
              backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
            ),
          ),
      ],
    ),
    );
  }
}
