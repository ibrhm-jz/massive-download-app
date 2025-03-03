import 'package:flutter/material.dart';
import 'package:flutter_exam/config/database.dart';
import 'package:flutter_exam/data/datasources/books/book_datasource.dart';
import 'package:flutter_exam/data/models/books/book_local_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class BookProvider extends ChangeNotifier {
  late final BookDataSource _bookDao;
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  List<BookLocalModel> _books = [];
  List<BookLocalModel> get books => _books;
  BookProvider() {
    _initDB();
  }
  Future<void> _initDB() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    _bookDao = database.bookDao;
    _isInitialized = true;
    _loadBooks();
  }

  Future<void> insertBooks(List<BookLocalModel> books) async {
    await _bookDao.insertBooks(books);
    await _loadBooks();
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

  Future<void> deleteBook(BookLocalModel book) async {
    await _bookDao.deleteBook(book);
    _loadBooks();
  }
}
