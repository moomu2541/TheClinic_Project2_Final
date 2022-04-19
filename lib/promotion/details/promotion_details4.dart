import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theclinic/utillity/my_style.dart';

class Healthcheck4 extends StatelessWidget {
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
            child: Image.asset("assets/images/coverpro4.png"),
          ),
          Center(
            child: Text('\nตรวจสุขภาพวัยทำงาน ราคา 2,690 บาท\n',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('รายละเอียดการให้บริการ\n',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              Text("1.ตรวจความสมบูรณ์ของเลิอด"),
              Text("2.ตรวจระดับน้ำตาลในกระแสเลือด"),
              Text("3.ตรวจระดับไขมันในเลือด"),
              Text("4.ตรวจสารบ่งชี้มะเร็ง"),
              Text("5.ตรวจหาอัตราเสี่่ยงการเกิดโรคหัวใจ\n"),
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
