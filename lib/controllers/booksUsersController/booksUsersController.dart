import 'package:auth_laravel/models/book_model.dart';
import 'package:auth_laravel/models/books.dart';
import 'package:auth_laravel/services/BooksUserService.dart';
import 'package:auth_laravel/utils/Pagination.dart';
import 'package:get/get.dart';

class BooksUsersController extends GetxController {
  // AuthController _authController = Get.find<AuthController>();
  BooksService _booksService = BooksService();
  Pagination _pagination;

  Rx<List<Book>> _userBooks = Rx<List<Book>>();

  List<Book> get userBooks => _userBooks.value;

  Rx<List<Book>> _allBooks = Rx<List<Book>>();

  List<Book> get allBooks => _allBooks.value;

  //Load more books indicator
  RxBool _isLoadingMoreBooks = false.obs;
  bool get isLoading => _isLoadingMoreBooks.value;
  List<Book> _loadedBooks = [];

  //Function to get more books when user scrolls coordinating with HomeScreenUiController
  Future<void> loadMoreBooks() async {
    int currentPage = 1;
    bool fetchNext = false;
    if (_pagination == null) {
      fetchNext = true;
    } else if (_pagination != null && _pagination.currentPage < _pagination.lastPage) {
      currentPage = _pagination.currentPage + 1;
      fetchNext = true;
    } else {
      fetchNext = false;
    }
    if (fetchNext) {
      _isLoadingMoreBooks.value = true;
      Books _allBooksPaginated = await _booksService.getAllBooks(currentPage);
      _loadedBooks.addAll(_allBooksPaginated.books);
      await Future.delayed(Duration(milliseconds: 500));
      _allBooks.value = _allBooks.value + _loadedBooks;
      _pagination = _allBooksPaginated.pagination;
      _isLoadingMoreBooks.value = false;
    }
  }

  //Search about a book using search delegate
  //TODO: Make search on all books using the api
  List<Book> searchBooks(String searchTerm) {
    print(searchTerm);
    List<Book> searchResultList = _allBooks.value
        .where(
          (book) =>
              book.bookName.toLowerCase().contains(searchTerm.toLowerCase()) ||
              book.author.toLowerCase().contains(searchTerm.toLowerCase()),
        )
        .toList();
    return searchResultList;
  }

  @override
  void onReady() async {
    try {
      Books _allBooksPaginated = await _booksService.getAllBooks(1);
      _allBooks.value = _allBooksPaginated.books;
      _pagination = _allBooksPaginated.pagination;
      // Iterable tempAllBooks = await _booksService.getAllBooks();
      // _userBooks.value = List<Book>.from(tempUserBooks.map((model) => Book.fromJson(model)));
    } catch (e) {
      print(e.toString());
    }
    super.onReady();
  }
}
