import 'package:flutter/material.dart';
import 'package:theclinic/utillity/my_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:theclinic/feedback/datafeedback.dart';
import 'package:theclinic/widget/my_service.dart';

void main() {
  runApp(FeedBack1());
}

class FeedBack1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feedback',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Feedback'),
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
  //เตรียม firebase
  // final Future<FirebaseApp> firebase = Firebase.initializeApp();
  // CollectionReference _feedbackCollection =
  //     FirebaseFirestore.instance.collection("FeedBack");
  final auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final firestoreInstance = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>();
  check newcheck = check();
  void _create() async {
    try {
      await firestore.collection("feed").doc(auth.currentUser.email).set({
        '1': newcheck.data1.toString(),
        '2': newcheck.data2.toString(),
        '3': newcheck.data3.toString(),
        '4': newcheck.data4.toString(),
        '5': newcheck.data5.toString()
      });
    } catch (e) {
      print(e);
    }
  }
  String t1 ="ดีมาก";
  String t2 ="ดี";
  String t3 ="พอใช้";
  String t4 ="ปรับปรุง";


  int _selectedChoice;
  int _selectedChoice2;
  int _selectedChoice3;
  int _selectedChoice4;
  int _selectedChoice5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyStyle().primaryColor,
          title: Text(widget.title),
          leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MyService();
            }));
          },
        ),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1. การให้บริการต่อลูกค้าจากทางคลินิก',
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                      title: Text('ดีมาก'),
                      leading: Radio(
                        toggleable: true,
                        value: 1,
                        groupValue: _selectedChoice,
                        onChanged: (value) {
                          setState(() {
                            _selectedChoice = value;
                            newcheck.data1 = t1;
                          }
                          );
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('ดี'),
                      leading: Radio(
                        value: 2,
                        groupValue: _selectedChoice,
                        onChanged: (value) {
                          setState(() {
                            _selectedChoice = value;
                            newcheck.data1 = t2;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('พอใช้'),
                      leading: Radio(
                        value: 3,
                        groupValue: _selectedChoice,
                        onChanged: (value) {
                          setState(() {
                            _selectedChoice = value;
                            newcheck.data1 = t3;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('ปรับปรุง'),
                      leading: Radio(
                        value: 4,
                        groupValue: _selectedChoice,
                        onChanged: (value) {
                          setState(() {
                            _selectedChoice = value;
                            newcheck.data1 = t4;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Divider(height: 10),
              Text(
                '2. ประโยชน์จากการใช้บริการจากทางคลินิก',
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                      title: Text('ดีมาก'),
                      leading: Radio(
                        toggleable: true,
                        value: 5,
                        groupValue: _selectedChoice2,
                        onChanged: (value) {
                          setState(() {
                            _selectedChoice2 = value;
                            newcheck.data2 = t1;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('ดี'),
                      leading: Radio(
                        value: 6,
                        groupValue: _selectedChoice2,
                        onChanged: (value) {
                          setState(() {
                            _selectedChoice2 = value;
                            newcheck.data2 = t2;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('พอใช้'),
                      leading: Radio(
                        value: 7,
                        groupValue: _selectedChoice2,
                        onChanged: (value) {
                          setState(() {
                            _selectedChoice2 = value;
                            newcheck.data2 = t3;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('ปรับปรุง'),
                      leading: Radio(
                        value: 8,
                        groupValue: _selectedChoice2,
                        onChanged: (value) {
                          setState(() {
                            _selectedChoice2 = value;
                            newcheck.data2 = t4;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Divider(height: 10),
              Text(
                '3. พนักงานที่บริการลูกค้าจากทางคลินิก',
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                      title: Text('ดีมาก'),
                      leading: Radio(
                        toggleable: true,
                        value: 9,
                        groupValue: _selectedChoice3,
                        onChanged: (value) {
                          setState(() {
                            _selectedChoice3 = value;
                            newcheck.data3 = t1;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('ดี'),
                      leading: Radio(
                        value: 10,
                        groupValue: _selectedChoice3,
                        onChanged: (value) {
                          setState(() {
                            _selectedChoice3 = value;
                            newcheck.data3 = t2;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('พอใช้'),
                      leading: Radio(
                        value: 11,
                        groupValue: _selectedChoice3,
                        onChanged: (value) {
                          setState(() {
                            _selectedChoice3 = value;
                            newcheck.data3 = t3;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('ปรับปรุง'),
                      leading: Radio(
                        value: 12,
                        groupValue: _selectedChoice3,
                        onChanged: (value) {
                          setState(() {
                            _selectedChoice3 = value;
                            newcheck.data3 = t4;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Divider(height: 10),
              Text(
                '4. ราคาการใช้บริการจากทางคลินิก',
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                      title: Text('ดีมาก'),
                      leading: Radio(
                        toggleable: true,
                        value: 13,
                        groupValue: _selectedChoice4,
                        onChanged: (value) {
                          setState(() {
                            _selectedChoice4 = value;
                            newcheck.data4 = t1;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('ดี'),
                      leading: Radio(
                        value: 14,
                        groupValue: _selectedChoice4,
                        onChanged: (value) {
                          setState(() {
                            _selectedChoice4 = value;
                            newcheck.data4 = t2;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('พอใช้'),
                      leading: Radio(
                        value: 15,
                        groupValue: _selectedChoice4,
                        onChanged: (value) {
                          setState(() {
                            _selectedChoice4 = value;
                            newcheck.data4 = t3;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('ปรับปรุง'),
                      leading: Radio(
                        value: 16,
                        groupValue: _selectedChoice4,
                        onChanged: (value) {
                          setState(() {
                            _selectedChoice4 = value;
                            newcheck.data4 = t4;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Divider(height: 10),
              Text(
                '5. สถานที่ที่ให้บริการต่อลูกค้าจากทางคลินิก',
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                      title: Text('ดีมาก'),
                      leading: Radio(
                        toggleable: true,
                        value: 17,
                        groupValue: _selectedChoice5,
                        onChanged: (value) {
                          setState(() {
                            _selectedChoice5 = value;
                            newcheck.data5 = t1;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('ดี'),
                      leading: Radio(
                        value: 18,
                        groupValue: _selectedChoice5,
                        onChanged: (value) {
                          setState(() {
                            _selectedChoice5 = value;
                            newcheck.data5 = t2;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('พอใช้'),
                      leading: Radio(
                        value: 19,
                        groupValue: _selectedChoice5,
                        onChanged: (value) {
                          setState(() {
                            _selectedChoice5 = value;
                            newcheck.data5 = t3;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('ปรับปรุง'),
                      leading: Radio(
                        value: 20,
                        groupValue: _selectedChoice5,
                        onChanged: (value) {
                          setState(() {
                            _selectedChoice5 = value;
                            newcheck.data5 = t4;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                child: Text(
                  'Send',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                ),
                onPressed: () async {
                  _create();
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text("บันทึกสำเร็จ"),
                        );
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MyService();
                  }));
                },
              ),
            ],
          ),
        ));
  }
}
