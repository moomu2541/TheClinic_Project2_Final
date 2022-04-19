import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theclinic/payqr/qrcode.dart';
import 'package:theclinic/utillity/my_style.dart';

class Healthcheck extends StatelessWidget {
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
            child: Image.asset("assets/images/coverpro2.png"),
          ),
          Center(
            child: Text('\nตรวจสุขภาพวัยเกษียณ ราคา 4,000 บาท\n',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('รายละเอียดการให้บริการ\n',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              Text("1.ตรวจความสมบูรณ์ของเลิอด"),
              Text("2.ตรวจปัสสาวะ"),
              Text("3.ตรวจอุจจาระ"),
              Text("4.ตรวจระดับน้ำตาลในกระแสเลือด"),
              Text("5.ตรวจระดับไขมันในเลือด"),
              Text("6.ตรวจการทำงานของตับ"),
              Text("7.ตรวจการทำงานของไต"),
              Text("8.ตรวจการทำงานของต่อมไทรอยด์\n"),
            ],
          ),
          ElevatedButton(
            child: Text('Buy',
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle( 
              backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Qrcode();
              }));
            }
          ),
      ],
    ),
    );
  }
}
