// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:theclinic/profile/myData.dart';
// import 'package:theclinic/utillity/my_style.dart';

// class ShowDataPage extends StatefulWidget {
//   @override
//   _ShowDataPageState createState() => _ShowDataPageState();
// }

// class _ShowDataPageState extends State<ShowDataPage> {
//   List<myData> allData = [];

//   @override
//   void initState() {
//     DatabaseReference ref = FirebaseDatabase.instance.reference();
//     ref.child('profile_user').once().then((DataSnapshot snap) {
//       var keys = snap.value.keys;
//       var data = snap.value;
//       allData.clear();
//       for (var key in keys) {
//         myData d = new myData(
//           data[key]['Name'],
//           data[key]['Surname'],
//           data[key]['Old'],
//           data[key]['Sex'],
//           data[key]['Phone'],
//           data[key]['Information'],
//         );
//         allData.add(d);
//       }
//       setState(() {
//         print('Length : ${allData.length}');
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         backgroundColor: MyStyle().primaryColor,
//         title: new Text('Profile'),
//         //centerTitle: true,
//       ),
//       body: new Container(
//           child: allData.length == 0
//               ? new Text('No Data is Available')
//               : new ListView.builder(
//                   itemCount: allData.length,
//                   itemBuilder: (_, index) {
//                     return UI(
//                       allData[index].name,
//                       allData[index].surname,
//                       allData[index].old,
//                       allData[index].sex,
//                       allData[index].phone,
//                       allData[index].information,
//                     );
//                   },
//                 )),
//     );
//   }

//   Widget UI(String name, String surname, String old, String sex, String phone,
//       String information) {
//     return new Card(
//       elevation: 10.0,
//       child: new Container(
//         padding: new EdgeInsets.all(20.0),
//         child: new Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             new Text(
//               'Name : $name',
//               style: Theme.of(context).textTheme.title,
//             ),
//             new Text(
//               'Surname : $surname',
//               style: Theme.of(context).textTheme.title,
//             ),
//             new Text('Old : $old'),
//             new Text('Sex : $sex'),
//             new Text('Phone : $phone'),
//             new Text('Information : $information'),
//           ],
//         ),
//       ),
//     );
//   }
// }
