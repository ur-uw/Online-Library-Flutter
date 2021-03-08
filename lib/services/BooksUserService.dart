import 'dart:io';
import 'package:auth_laravel/models/book_model.dart';
import 'package:auth_laravel/models/books.dart';
import 'package:auth_laravel/utils/Pagination.dart';
import 'package:get/get.dart';

// if (Platform.isAndroid) {
// httpClient.baseUrl = 'http://10.0.2.2:8000/api';
// } else {
// httpClient.baseUrl = 'http://localhost:8000/api';
// }

class BooksService extends GetConnect {
  Future<Books> getAllBooks(int page) async {
    if (Platform.isAndroid) {
      httpClient.baseUrl = 'http://10.0.2.2:8000/api';
    } else {
      httpClient.baseUrl = 'http://localhost:8000/api';
    }
    Response response = await get('/books?page=$page');
    //Checking for status code

    if (response.statusCode == 200) {
      //Converting the response to list of books

      List _temp = response.body['data'];
      List<Book> allBooks = _temp.map((e) => Book.fromJson(e)).toList();

      //Getting pagination meta from the response
      Map<String, dynamic> _meta = {
        'current_page': response.body['current_page'],
        'last_page': response.body['last_page'],
      };
      Pagination pagination = Pagination.fromJson(_meta);
      return new Books(pagination: pagination, books: allBooks);
    } else {
      return null;
    }
  }

  Future<List<Book>> getUserBooks(String token) async {
    if (Platform.isAndroid) {
      httpClient.baseUrl = 'http://10.0.2.2:8000/api';
    } else {
      httpClient.baseUrl = 'http://localhost:8000/api';
    }
    Response response = await get('/user/books', headers: {'Authorization': 'Bearer $token'});
    //Checking for status code

    if (response.statusCode == 200) {
      //Converting the response to list of books

      List _temp = response.body['data'];
      List<Book> userBooks = _temp.map((e) => Book.fromJson(e)).toList();

      //Getting pagination meta from the response
      // Map<String, dynamic> _meta = {
      //   'current_page': response.body['current_page'],
      //   'last_page': response.body['last_page'],
      // };
      // Pagination pagination = Pagination.fromJson(_meta);
      return userBooks;
    } else {
      return null;
    }
  }
}
