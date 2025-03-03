import 'package:flutter/material.dart';
import 'package:flutter_exam/config/database.dart';
import 'package:flutter_exam/core/storage/session_storage.dart';
import 'package:flutter_exam/data/datasources/books/book_datasource.dart';
import 'package:flutter_exam/data/models/books/book_local_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class BookProvider extends ChangeNotifier {
  late final BookDataSource _bookDao;
  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;
  TextEditingController maxDownloadCountCtrl =
      TextEditingController(text: '1000');

  List<BookLocalModel> _books = [];
  List<BookLocalModel> get books => _books;

  bool loading = false;
  bool _loadingMore = false;
  bool _canLoadMore = true;
  bool get loadingMore => _loadingMore;
  bool get canLoadMore => _canLoadMore;
  int _page = 1;
  int get page => _page;

  BookProvider() {
    _initDB();
  }
  void setPage() {
    _page++;
    notifyListeners();
  }

  Future<void> _initDB() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    _bookDao = database.bookDao;
    _isInitialized = true;
    _loadPaginateBooks();
  }

  Future<void> insertBooks(List<BookLocalModel> books) async {
    await _bookDao.insertBooks(books);
    await _loadPaginateBooks();
    notifyListeners();
  }

  Future<void> _loadBooks() async {
    _books = await _bookDao.getAllBooks();
    notifyListeners();
  }

  Future<void> insertBook(BookLocalModel book) async {
    await _bookDao.insertBook(book);
    _loadBooks();
  }

  Future<List<BookLocalModel>> getAllBooks() async {
    if (!_isInitialized) {
      await _initDB();
    }
    return await _bookDao.getAllBooks();
  }

  Future<void> _loadPaginateBooks() async {
    if (!_isInitialized) {
      await _initDB();
    }
    _books = await _bookDao.getBooksPaginated(10, (_page - 1) * 10);
    notifyListeners();
  }

  Future<void> getAllPaginateBooks() async {
    if (!_isInitialized) {
      await _initDB();
    }
    _loadingMore = true;
    if (page == 1) {
      loading = true;
    }
    List<BookLocalModel> books =
        await _bookDao.getBooksPaginated(10, (_page - 1) * 10);
    _books.addAll(books);
    if (books.isEmpty) {
      _canLoadMore = false;
    }
    _loadingMore = false;

    loading = false;
    notifyListeners();
  }

  Future<BookLocalModel?> getBook(int identificator) async {
    if (!_isInitialized) {
      await _initDB();
    }
    return await _bookDao.getBookById(identificator);
  }

  Future<void> deleteBook(BookLocalModel book) async {
    await _bookDao.deleteBook(book);
    _loadBooks();
  }

  Future<void> clearBooks() async {
    await SessionStorage.clearData();
    await _bookDao.clearBooks();
    _loadBooks();
  }
}
