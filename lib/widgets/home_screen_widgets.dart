import 'package:auth_laravel/controllers/booksUsersController/booksUsersController.dart';
import 'package:auth_laravel/models/book_model.dart';
import 'package:auth_laravel/utils/constants.dart';
import 'package:auth_laravel/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

class BookSearch extends SearchDelegate<String> {
  final BooksUsersController _booksUsersController;

  BookSearch(this._booksUsersController);

  @override
  // TODO: implement searchFieldLabel
  String get searchFieldLabel => '';
  @override
  TextStyle get searchFieldStyle => TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      );
  @override
  // TODO: implement searchFieldDecorationTheme
  InputDecorationTheme get searchFieldDecorationTheme => InputDecorationTheme(
        hintStyle: TextStyle(
          color: white,
        ),
      );
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context).copyWith(
      scaffoldBackgroundColor: white,
      appBarTheme: AppBarTheme(color: black),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    );
    assert(theme != null);
    return theme;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "",
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      color: Colors.white,
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  void showResults(BuildContext context) {
    if (query.isNotEmpty) super.showResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(
        height: Get.height,
        width: Get.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            text('SEARCH', style: defaultTextStyle.copyWith(color: black, fontSize: 35), textAlign: TextAlign.center),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.search,
              size: 36,
            )
          ],
        ),
      );
    } else {
      List<Book> books = _booksUsersController.searchBooks(query);
      return books.length >= 1
          ? ListView.builder(
              itemCount: books?.length ?? 0,
              itemBuilder: (context, index) {
                return BookItem(
                  bookName: books[index].bookName,
                  bookImage: books[index].coverUrl,
                  bookAuthor: books[index].author,
                  bookReleaseDate: books[index].releaseDate,
                );
              })
          : Container(
              height: Get.height,
              width: Get.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text('No Match!',
                      style: defaultTextStyle.copyWith(color: black, fontSize: 35), textAlign: TextAlign.center),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.search_off,
                    size: 36,
                  )
                ],
              ),
            );
    }
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Book> books = _booksUsersController.searchBooks(query);
    return books.length >= 1
        ? ListView.builder(
            itemCount: books?.length ?? 0,
            itemBuilder: (context, index) {
              return BookItem(
                bookName: books[index].bookName,
                bookImage: books[index].coverUrl,
                bookAuthor: books[index].author,
                bookReleaseDate: books[index].releaseDate,
              );
            })
        : Container(
            height: Get.height,
            width: Get.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text('No Match!',
                    style: defaultTextStyle.copyWith(color: black, fontSize: 35), textAlign: TextAlign.center),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.search_off,
                  size: 36,
                )
              ],
            ),
          );
  }
}
