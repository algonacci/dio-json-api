import 'dart:convert';

import 'package:dio_json_api/models/books_model.dart';
import 'package:flutter/material.dart';

class LocalJson extends StatefulWidget {
  const LocalJson({super.key});

  @override
  State<LocalJson> createState() => _LocalJsonState();
}

class _LocalJsonState extends State<LocalJson> {
  late Future<List<Book>> filledList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filledList = readBooksJson();
  }

  @override
  Widget build(BuildContext context) {
    // readBooksJson();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Local Json',
        ),
      ),
      body: FutureBuilder<List<Book>>(
        future: filledList,
        initialData: [
          Book(
            id: 1,
            bookName: 'Coding for Cash',
            author: 'Eric Julianto',
            year: 2022,
          ),
        ],
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Book> bookList = snapshot.data!;
            return ListView.builder(
              itemCount: bookList.length,
              itemBuilder: (context, index) {
                Book currentBook = bookList[index];
                return ListTile(
                  title: Text(currentBook.bookName),
                  subtitle: Text(currentBook.author),
                  leading: CircleAvatar(
                    child: Text(
                      currentBook.id.toString(),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('You have no list'),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<List<Book>> readBooksJson() async {
    try {
      await Future.delayed(Duration(seconds: 3));
      String data = await DefaultAssetBundle.of(context)
          .loadString('assets/data/books.json');

      var jsonData = jsonDecode(data);
      List<Book> allBooks =
          (jsonData as List).map((bookMap) => Book.fromJson(bookMap)).toList();

      debugPrint(allBooks.length.toString());

      debugPrint(allBooks[0].author);

      return allBooks;
    } catch (e) {
      debugPrint(e.toString());
      return Future.error(e.toString());
    }

    // debugPrint(data);
    // debugPrint('================');
    // debugPrint(jsonData.toString());
  }
}
