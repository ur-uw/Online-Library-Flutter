import 'package:auth_laravel/models/book_model.dart';
import 'package:auth_laravel/utils/Pagination.dart';
import 'package:flutter/cupertino.dart';

class Books {
  final Pagination pagination;
  final List<Book> books;
  Books({@required this.pagination, @required this.books});
}
