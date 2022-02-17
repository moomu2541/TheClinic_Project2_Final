import 'package:theclinic/form/screen/formscreen.dart';
import 'package:theclinic/form/screen/display.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyForm());
}

class MyForm extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: TabBarView(
            children: [
              FormScreen(),
              DisplayScreen()
            ],
            ),
            backgroundColor: Colors.lightBlue,
            bottomNavigationBar: TabBar(
              tabs: [
                Tab(text: "จองคิว",),
                Tab(text: "เช็คประวัติ",)
              ],
              ),
        ),
        );
  }
}
