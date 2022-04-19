import 'package:flutter/material.dart';
import 'package:theclinic/diseases/books.dart';
import 'package:theclinic/utillity/my_style.dart';

class BookPage extends StatelessWidget {
  final Book book;

  const BookPage({
    Key key,
    this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(book.title),
        backgroundColor: MyStyle().primaryColor,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  book.urlImage,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text('อาการ\n',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
                Card(
                  color: Colors.lightBlue.shade100,
                  child: (Column(
                    children: [
                      Text(
                        book.detail1,
                        style: TextStyle(
                        fontSize: 16,
                      )
                      ),
                    ],
                  )),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text('วิธีรักษาเบื้องต้น\n',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
                Card(
                  color: Colors.lightBlue.shade100,
                  child: (Column(
                    children: [
                      Text(
                        book.detail2,
                        style: TextStyle(
                        fontSize: 16,
                      )
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ),
        ),
      );
}
