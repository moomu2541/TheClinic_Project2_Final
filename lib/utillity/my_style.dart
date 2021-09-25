import 'package:flutter/material.dart';

class MyStyle {

  Color darkColor = Color(0xff03a9f4);
  Color primaryColor = Color(0xff03a9f4);
  Color lightColor = Color(0xff67daff);

  TextStyle redBoldStyle() => TextStyle(
      color: Colors.red.shade700,
      fontWeight: FontWeight.bold
  );

  Widget showLogo() => Image.asset('assets/images/logo.png');

  Widget titleH1(String string) => Text(
      string,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: darkColor,
      )
  );

  Widget titleH2(String string) => Text(
      string,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: darkColor,
      )
  );

  Widget titleH3(String string) => Text(
      string,
      style: TextStyle(
        fontSize: 16,
        //fontWeight: FontWeight.bold,
        color: darkColor,
      )
  );

  Widget titleH4(String string) => Text(
      string,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      )
  );

  MyStyle();
}