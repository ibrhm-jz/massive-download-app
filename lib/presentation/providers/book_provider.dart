import 'package:flutter/material.dart';
import 'package:flutter_exam/config/injection.dart';
import 'package:flutter_exam/domain/interfaces/i_book_repository.dart';

class BookProvider with ChangeNotifier {
  final IBookRepository _bookRepository = getIt<IBookRepository>();
  Future<void> getBooksFromAPIAsync() async {
    final result = await _bookRepository.getBooks(q: 'b', page: 1, limit: 10);
    print(result);
  }
}
