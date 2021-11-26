import 'package:flutter/material.dart';
import 'package:theclinic/promotion/promotion_details.dart';
import 'package:theclinic/utillity/my_style.dart';

class Promotion extends StatefulWidget {
  @override
  _PromotionState createState() => _PromotionState();
}

class _PromotionState extends State<Promotion> {
  List<List<dynamic>> promotionLists = [
    [
      "https://www.bumrungrad.com/getattachment/739ef34b-a492-4970-93c3-2e53f14533ba/image.jpg",
      "ตรวจสุขภาพวัยเกษียณ",
      '4000฿',
    ],
    [
      "https://www.hongthongrice.com/life/wp-content/uploads/2015/11/01.%E0%B8%AD%E0%B8%AD%E0%B8%81%E0%B8%81%E0%B8%B3%E0%B8%A5%E0%B8%B1%E0%B8%87%E0%B8%81%E0%B8%B2%E0%B8%A2%E0%B8%84%E0%B8%99%E0%B8%9B%E0%B9%88%E0%B8%A7%E0%B8%A2.jpg",
      "ตรวจสุขภาพสำหรับฟิตเนส",
      '2690฿',
    ],
    [
      "https://static.posttoday.com/media/content/2020/04/14/A85697FC49691E6AFAE8392ACAC904AF.jpg",
      "ตรวจสุขภาพครอบครัว",
      '3900฿',
    ],
    [
      "https://www.cigna.co.th/sites/default/files/pictures/Cancer-in-30-above-20181024-1.jpg",
      "ตรวจสุขภาพวัยทำงาน",
      '1590฿',
    ],
    [
      "https://media.istockphoto.com/photos/six-preteen-friends-piggybacking-in-a-park-close-up-portrait-picture-id839295596?b=1&k=20&m=839295596&s=170667a&w=0&h=psoRo47-LlSUg8zPxY4Crf2xWz_ZAEggkDpJmuGSI2w=",
      "ตรวจสุขภาพวัยเด็ก",
      '1390฿',
    ],
    [
      "https://www.vejthani.com/wp-content/uploads/2019/12/vejthani-blog-1-e1575443436645.jpg",
      "ตรวจสุขภาพประจำปี",
      '7990฿',
    ],
    [
      "https://www.efinancethai.com/news/picture/2021/11/15/T/5957512.jpg",
      "ตรวจโควิด",
      '1290฿',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: promotionLists.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: Container(
            height: 100,
            width: double.infinity,
            child: Stack(
              children: [
                Row(
                  children: [
                    Image.network(
                      promotionLists[index][0],
                      fit: BoxFit.cover,
                      height: 100,
                      width: 150,
                    ),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${promotionLists[index][1]}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${promotionLists[index][2]}",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  alignment: Alignment.bottomRight,
                  child: ActionChip(
                    backgroundColor: MyStyle().primaryColor,
                    label: Text(
                      "Details",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Healthcheck()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
