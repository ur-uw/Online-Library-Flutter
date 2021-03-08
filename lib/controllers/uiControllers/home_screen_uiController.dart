import 'package:auth_laravel/controllers/booksUsersController/booksUsersController.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeScreenUiController extends GetxController {
  ScrollController scrollController = ScrollController();
  final BooksUsersController _booksUsersController = Get.find<BooksUsersController>();
  @override
  void onInit() {
    scrollController.addListener(() {
      double maxScrollPosition = scrollController.position.maxScrollExtent;
      double currentScrollPosition = scrollController.position.pixels;
      if ((currentScrollPosition >= maxScrollPosition && currentScrollPosition - maxScrollPosition >= 80) &&
          !_booksUsersController.isLoading) {
        _booksUsersController.loadMoreBooks();
      }
    });
    super.onInit();
  }
}
