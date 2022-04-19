import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theclinic/utillity/my_style.dart';

class Healthcheck6 extends StatelessWidget {
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
            child: Image.asset("assets/images/covid.png"),
          ),
          Center(
            child: Text('\nตรวจโควิด-19 ราคา 1,200 บาท\n',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('รายละเอียดการให้บริการ\n',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              Text("1.ตรวจด้วยวิธี Rapid Antigen"),
              Text("2.เก็บตัวอย่างสารคัดหลั่ง จมูก"),
              Text("3.รับผลภายใน 1 ชั่วโมง\n"),
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
