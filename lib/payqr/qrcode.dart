import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theclinic/payqr/qrcode.dart';
import 'package:theclinic/utillity/my_style.dart';
import 'package:theclinic/payqr/slip/slip.dart';

class Qrcode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().primaryColor,
        title: Text("QR-Code"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
              child: Text('Please Scan QR-CODE\n',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          Center(
            child: Image.asset("assets/images/qr.png"),
          ),
          Center(
              child: Text('\nตรวจสุขภาพวัยเกษียณ ราคา 4,000 บาท\n',
                  style: TextStyle(
                    fontSize: 18,
                  ))),
          SizedBox(
            height: 100,
          ),
          Center(
              child: Text('Upload slip',
                  style: TextStyle(
                    fontSize: 16,
                  ))),
          ElevatedButton(
              child: Text(
                'Select',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Myslip();
                }));
              }
              ),
        ],
      ),
    );
  }
}
