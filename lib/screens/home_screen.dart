import 'package:auth_laravel/controllers/authController.dart';
import 'package:auth_laravel/controllers/booksUsersController/booksUsersController.dart';
import 'package:auth_laravel/controllers/uiControllers/home_screen_uiController.dart';
import 'package:auth_laravel/models/book_model.dart';
import 'package:auth_laravel/utils/constants.dart';
import 'package:auth_laravel/utils/widget_functions.dart';
import 'package:auth_laravel/widgets/home_screen_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();
  final BooksUsersController _booksUsersController = Get.find<BooksUsersController>();
  final HomeScreenUiController _uiController = Get.find<HomeScreenUiController>();

  Widget _buildBooksList(List<Book> books) {
    if (books.length > 1) {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
                controller: _uiController.scrollController,
                physics: BouncingScrollPhysics(),
                itemCount: books?.length ?? 0,
                itemBuilder: (context, index) {
                  return BookItem(
                    bookAuthor: books[index].author,
                    bookImage: books[index].coverUrl,
                    bookName: books[index].bookName,
                    bookReleaseDate: books[index].releaseDate,
                  );
                }),
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: _booksUsersController.isLoading ? 1 : 0,
            child: _booksUsersController.isLoading
                ? Container(
                    padding: EdgeInsets.only(bottom: 5),
                    height: 60,
                    width: Get.width,
                    child: Center(
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(
                          backgroundColor: black,
                          strokeWidth: 3,
                        ),
                      ),
                    ),
                  )
                : Container(),
          )
        ],
      );
    } else {
      return Center(
        child: text('There is no books yet', style: defaultTextStyle),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFAFA),
        appBar: AppBar(
          title: text('Books'),
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () => showSearch(context: context, delegate: BookSearch(_booksUsersController)))
          ],
        ),
        drawer: Obx(
          () => _authController.currentUser != null
              ? appDrawer(_authController.currentUser.profileImage, _authController.currentUser.name)
              //TODO: delete this widget after debugging
              : Container(
                  child: Center(
                    child: TextButton(
                      child: text('delete local Storage'),
                      onPressed: () => FlutterSecureStorage().deleteAll(),
                    ),
                  ),
                ),
        ),
        body: Container(
          width: Get.width,
          child: Obx(() {
            if (_authController != null &&
                _authController.currentUser != null &&
                _booksUsersController.allBooks != null) {
              return _buildBooksList(_booksUsersController.allBooks);
            } else {
              return Center(
                child: text('Loading...', color: black, fontSize: 36),
              );
            }
          }),
        ),
      ),
    );
  }
}
