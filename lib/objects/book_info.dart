class BookInfo {
  final String title;
  final String subTitle;
  final String date;
  final String time;
  final String address;
  final String authors;
  final String program;
  final bool isFree;
  BookInfo(
      {required this.date,
      required this.time,
      required this.address,
      required this.authors,
      required this.program,
      required this.isFree,
      required this.title,
      required this.subTitle});
}
