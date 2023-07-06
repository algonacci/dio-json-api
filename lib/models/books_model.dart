import 'dart:convert';

List<Book> bookFromJson(String str) =>
    List<Book>.from(json.decode(str).map((x) => Book.fromJson(x)));

String bookToJson(List<Book> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Book {
  int id;
  String bookName;
  String author;
  int year;

  Book({
    required this.id,
    required this.bookName,
    required this.author,
    required this.year,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        bookName: json["book_name"],
        author: json["author"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "book_name": bookName,
        "author": author,
        "year": year,
      };
}
