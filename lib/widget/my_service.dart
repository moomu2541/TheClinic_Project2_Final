import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theclinic/date/calendar.dart';
import 'package:theclinic/date/main.dart';
import 'package:theclinic/diseases/main.dart';
import 'package:theclinic/feedback/mainfeed.dart';
import 'package:theclinic/profile/profile.dart';
import 'package:theclinic/utillity/my_style.dart';
import 'package:theclinic/widget/editprofile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:theclinic/components/category_card.dart';
import 'package:theclinic/components/doctor_card.dart';
import 'package:theclinic/components/search_bar.dart';
import 'package:theclinic/constant.dart';
import 'package:theclinic/widget/promotion.dart';
import 'package:theclinic/shop/main.dart';
import 'package:theclinic/form/main.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  String name, email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findNameAndEmail();
  }

  Future<Null> findNameAndEmail() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        setState(() {
          name = event.displayName;
          email = event.email;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
        /*centerTitle: true,
        title: Text('Home'),*/
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                    'https://image.freepik.com/free-vector/abstract-medical-wallpaper-template-design_53876-61803.jpg'),
                fit: BoxFit.cover,
              )),
              accountName: MyStyle().titleH4(name == null ? 'Name' : name),
              accountEmail: MyStyle().titleH4(email == null ? 'email' : email),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://image.freepik.com/free-vector/doctor-character-background_1270-84.jpg')),
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: const Text('ข้อมูลส่วนตัว'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ep241Page()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: const Text('โปรโมชัน'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPro()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.date_range),
              title: const Text('วันนัด'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyForm2()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.data_usage),
              title: const Text('ผลตรวจ'),
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => MyForm2()),
              //   );
              // },
            ),
            // ListTile(
            //   leading: Icon(Icons.shop_2),
            //   title: const Text('ซื้อสินค้า'),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => MyShop()),
            //     );
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: const Text('แบบสอบถาม'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedBack1()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.coronavirus),
              title: const Text('รู้เรื่องโรค'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage3()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: const Text('ออกจากระบบ'),
              onTap: () async {
                await Firebase.initializeApp().then((value) async {
                  await FirebaseAuth.instance.signOut().then((value) =>
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/authen', (route) => false));
                });
              },
            ),
          ],
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //SvgPicture.asset('assets/icons/menu.svg'),
                    //SvgPicture.asset('assets/icons/profile.svg'),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Welcome To TheClinic',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: kTitleTextColor,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: SearchBar(),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTitleTextColor,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buildCategoryList(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Doctors',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTitleTextColor,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buildDoctorList(),
            ],
          ),
        ),
      ),
    );
  }

  buildCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 30,
          ),
          CategoryCard(
            'เกี่ยวกับฟัน',
            'assets/icons/dental_surgeon.png',
            kBlueColor,
          ),
          SizedBox(
            width: 10,
          ),
          CategoryCard(
            'เกี่ยวกับหัวใจ',
            'assets/icons/heart_surgeon.png',
            kYellowColor,
          ),
          SizedBox(
            width: 10,
          ),
          CategoryCard(
            'เกี่ยวกับตา',
            'assets/icons/eye_specialist.png',
            kOrangeColor,
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }

  buildDoctorList() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: <Widget>[
          DoctorCard(
            'ดร. ปิยะฉัตร วิจาราณ์',
            'หมอหัวใจ',
            'assets/images/doctor1.png',
            kBlueColor,
          ),
          SizedBox(
            height: 20,
          ),
          DoctorCard(
            'ดร. เกรียงศักดิ์ เจี่ยมศรี',
            'หมอฟัน',
            'assets/images/doctor2.png',
            kYellowColor,
          ),
          SizedBox(
            height: 20,
          ),
          DoctorCard(
            'ดร. ปฐมพร แก่นจันทร์',
            'หมอตา',
            'assets/images/doctor3.png',
            kOrangeColor,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
