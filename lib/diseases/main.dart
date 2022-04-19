import 'package:flutter/material.dart';
import 'package:theclinic/diseases/page.dart';
import 'package:theclinic/utillity/my_style.dart';
import 'books.dart';

class MainPage3 extends StatefulWidget {
  MainPage3({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPage3State createState() => _MainPage3State();
}

class _MainPage3State extends State<MainPage3> {
  final controller = TextEditingController();
  List<Book> books = allBooks;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Learn Diseases'),
          backgroundColor: MyStyle().primaryColor,
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'ค้นหาโรค',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: const BorderSide(color: Colors.blue),
                    )),
                    onChanged: searchBook,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];

                  return ListTile(
                    leading: Image.asset(
                      book.urlImage,
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                    title: Text(book.title),
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (context) => BookPage(book: book),
                    )),
                  );
                },
              ),
            ),
          ],
        ),
      );

      void searchBook(String query){
        final suggestions = allBooks.where((book){
          final BookTitle = book.title.toLowerCase();
          final input = query.toLowerCase();

          return BookTitle.contains(input);

        }).toList();

        setState(() => books = suggestions);
      }
}

