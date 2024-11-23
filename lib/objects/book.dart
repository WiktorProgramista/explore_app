import 'package:explore_app/objects/book_info.dart';

class Book {
  final String imagePath;
  final String title;
  final String city;
  final String date;
  bool isFavourite;
  final BookInfo bookInfo;
  Book(
      {required this.imagePath,
      required this.title,
      required this.city,
      required this.date,
      required this.isFavourite,
      required this.bookInfo});
}
