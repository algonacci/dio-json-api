import 'dart:convert';

import 'package:dio_json_api/models/books_model.dart';
import 'package:flutter/material.dart';

class LocalJson extends StatefulWidget {
  const LocalJson({super.key});

  @override
  State<LocalJson> createState() => _LocalJsonState();
}

class _LocalJsonState extends State<LocalJson> {
  @override
  Widget build(BuildContext context) {
    readBooksJson();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Local Json',
        ),
      ),
    );
  }

  readBooksJson() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString('assets/data/books.json');

    var jsonData = jsonDecode(data);
    List<Book> allBooks =
        (jsonData as List).map((bookMap) => Book.fromJson(bookMap)).toList();

    debugPrint(allBooks.length.toString());

    debugPrint(allBooks[0].author);

    // debugPrint(data);
    // debugPrint('================');
    // debugPrint(jsonData.toString());
  }
}
