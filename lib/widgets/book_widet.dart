import 'package:explore_app/constants.dart';
import 'package:explore_app/objects/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookWidget extends StatefulWidget {
  final Book book;
  const BookWidget({super.key, required this.book});

  @override
  State<BookWidget> createState() => _BookWidgetState();
}

class _BookWidgetState extends State<BookWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.14),
            spreadRadius: 0.2,
            blurRadius: 4.4,
          ),
        ]
      ),
      child: Row(
        children: [
          Container(
            height: 125,
            width: 125,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0), 
                bottomLeft: Radius.circular(15.0)
              ),
              image: DecorationImage(image: AssetImage(widget.book.imagePath), fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,  
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  Text(
                    widget.book.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 16
                    ), 
                    maxLines: 2, 
                    overflow: TextOverflow.ellipsis, 
                    softWrap: true,
                    textAlign: TextAlign.start, 
                  ),
                  Text(
                    widget.book.city,
                    style: const TextStyle(
                      fontWeight: FontWeight.w200, 
                      fontSize: 12,
                      color: Colors.black54
                    ), 
                    maxLines: 2, 
                    overflow: TextOverflow.ellipsis, 
                    softWrap: true,
                    textAlign: TextAlign.start, 
                  ),
                  const Spacer(),
                  Text(
                    widget.book.date,
                    style: const TextStyle(
                      fontWeight: FontWeight.w200, 
                      fontSize: 12,
                      color: Colors.black54
                    ), 
                    maxLines: 2, 
                    overflow: TextOverflow.ellipsis, 
                    softWrap: true,
                    textAlign: TextAlign.start, 
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                child: CircleAvatar(
                  radius: 18.0,
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  child: SvgPicture.asset(widget.book.isFavourite ? 'assets/serce_filled.svg' : 'assets/serce_outlined.svg', width: 15.0, height: 15.0),
                ),
                onTap: (){
                  //jeśli kliknie serce zmienia się właściwość isFavourite obiektu book w tablicy book na true
                  setState(() {
                    books[books.indexOf(widget.book)].isFavourite = !books[books.indexOf(widget.book)].isFavourite;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
