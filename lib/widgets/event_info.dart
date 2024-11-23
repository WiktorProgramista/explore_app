import 'package:explore_app/objects/book.dart';
import 'package:explore_app/widgets/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EventInfo extends StatelessWidget {
  final Book book;
  const EventInfo({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(15.0),
          children: [
            Row(
              children: [
                GestureDetector(
                    child: SvgPicture.asset(
                      'assets/wstecz.svg',
                      width: 25.0,
                      height: 25.0,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              book.bookInfo.title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
            Text(
              book.bookInfo.subTitle,
              style:
                  const TextStyle(fontWeight: FontWeight.w300, fontSize: 23.0),
            ),
            Text(
              '${book.bookInfo.date} ${book.bookInfo.time}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.blue.shade900),
            ),
            Text(
              book.bookInfo.address,
              style:
                  const TextStyle(fontWeight: FontWeight.w100, fontSize: 15.0),
            ),
            const SizedBox(height: 10.0),
            Image.asset(book.imagePath),
            const SizedBox(height: 10.0),
            Flexible(
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: circleButton(
                          'assets/calendar.svg', 'Dodaj do kalendarza'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CalendarForm()));
                      },
                    ),
                    circleButton('assets/share.svg', 'Udostępnij'),
                    circleButton('assets/map.svg', 'Pokaż na mapie'),
                    circleButton('assets/global.svg', 'Strona www'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Text(
              book.bookInfo.authors,
              style: const TextStyle(fontSize: 14.0),
            ),
            const SizedBox(height: 15.0),
            Text(
              book.bookInfo.program,
              style: const TextStyle(fontSize: 14.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/free.svg'),
                const SizedBox(width: 10.0),
                const Text(
                  'Wydarzenie bezpłatne',
                  style: TextStyle(fontSize: 13.0, color: Colors.grey),
                ),
                const SizedBox(width: 10.0),
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              children: [
                SvgPicture.asset('assets/social.svg'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget circleButton(String imagePath, String text) {
    return Flexible(
      child: Column(
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.grey.withOpacity(0.2),
            child: Center(
              child: SvgPicture.asset(
                imagePath,
                width: 30,
                height: 30,
              ),
            ),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
