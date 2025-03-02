import 'package:floor/floor.dart';
import 'package:flutter_exam/data/models/books/book_local_model.dart';

@dao
abstract class BookDataSource {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertBooks(List<BookLocalModel> books);

  @Query('SELECT * FROM BookLocalModel ORDER BY title ASC')
  Future<List<BookLocalModel>> getAllBooks();

  @Query('SELECT * FROM BookLocalModel WHERE id = :id')
  Future<BookLocalModel?> getBookById(int id);

  @insert
  Future<int> insertBook(BookLocalModel book);

  @update
  Future<int> updateBook(BookLocalModel book);

  @delete
  Future<int> deleteBook(BookLocalModel book);
}
