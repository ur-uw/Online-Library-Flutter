import 'package:auth_laravel/controllers/booksUsersController/booksUsersController.dart';
import 'package:get/get.dart';

class BooksUsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BooksUsersController>(() => BooksUsersController());
  }
}
