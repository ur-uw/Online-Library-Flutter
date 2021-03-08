import 'package:auth_laravel/utils/constants.dart';
import 'package:auth_laravel/utils/widget_functions.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final String bookImage;
  final String bookName;
  final String bookAuthor;
  final String bookReleaseDate;
  const BookItem({this.bookImage, this.bookName, this.bookAuthor, this.bookReleaseDate});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: Container(
          height: 70,
          width: 80,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(bookImage),
            fit: BoxFit.cover,
          )),
        ),
        title: text(
          bookName,
          style: defaultTextStyle.copyWith(color: black),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text(bookAuthor,
                style: defaultTextStyle.copyWith(color: black, fontWeight: FontWeight.normal, fontSize: 11)),
            text(bookReleaseDate, style: defaultTextStyle.copyWith(color: black, fontSize: 11)),
          ],
        ),
        trailing: GestureDetector(
          child: Icon(Icons.favorite_border),
          onTap: () => print('add to user books'),
        ),
      ),
    );
  }
}
