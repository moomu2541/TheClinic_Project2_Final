// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';

// class Myslip extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.lightBlue,
//       ),
//       home: MyHomePage(title: 'Page Slip'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   PlatformFile pickedFile;
//   UploadTask uploadTask;

//   Future selectFile() async {
//     final result = await FilePicker.platform.pickFiles();
//     if (result == null) return;

//     setState(() {
//       pickedFile = result.files.first;
//     });
//   }

//   Future uploadFile() async {
//     final path = 'slip/${pickedFile.name}';
//     final file = File(pickedFile.path);

//     final ref = FirebaseStorage.instance.ref().child(path);
//     setState(() {
//      uploadTask = ref.putFile(file);
//     });

//     final snapshot = await uploadTask.whenComplete(() => {});
//     final urlDownload = await snapshot.ref.getDownloadURL();
//     print('Download Link: $urlDownload');

//     setState(() {
//      uploadTask = null;
//     });

//   }
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: const Text('Upload Slip'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               if (pickedFile != null)
//                 Expanded(
//                   child: Container(
//                     color: Colors.white,
//                     child: Center(
//                       child: Image.file(
//                         File(pickedFile.path),
//                         //width: double.infinity,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//               const SizedBox(height: 10),
//               ElevatedButton(
//                 child: const Text('Select File'),
//                 onPressed: selectFile,
//               ),
//               const SizedBox(height: 10),
//               ElevatedButton(
//                 child: const Text('Upload File'),
//                 onPressed: uploadFile,
//               ),
//               const SizedBox(height: 10),
//               buidProgress(),
//             ],
//           ),
//         ),
//       );

//   Widget buidProgress() => StreamBuilder<TaskSnapshot>(
//       stream: uploadTask.snapshotEvents,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           final data = snapshot.data;
//           double progress = data.bytesTransferred / data.totalBytes;

//           return SizedBox(
//             height: 50,
//             child: Stack(
//               fit: StackFit.expand,
//               children: [
//                 LinearProgressIndicator(
//                   value: progress,
//                   backgroundColor: Colors.grey,
//                   color: Colors.green,
//                 ),
//                 Center(
//                   child: Text('${(100 * progress).roundToDouble()}%',
//                   style: const TextStyle(color: Colors.white),
//                   ),
//                 )
//               ],
//               ),
//           );
//         } else {
//           return const SizedBox(height: 10);
//         }
//       });
// }
