import 'dart:convert';

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
    debugPrint(data);
    debugPrint('================');
    debugPrint(jsonData.toString());
  }
}
