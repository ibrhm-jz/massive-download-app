import 'package:bloc/bloc.dart';
import 'package:flutter_exam/application/book/book_state.dart';
import 'package:flutter_exam/data/models/api_models/book_response_model.dart';
import 'package:flutter_exam/data/models/books/book_local_model.dart';
import 'package:flutter_exam/domain/interfaces/i_book_repository.dart';
import 'package:flutter_exam/presentation/providers/book_provider.dart';

class BookCubit extends Cubit<BookState> {
  final IBookRepository _bookRepository;
  final BookProvider _bookProvider;
  int totalBooks = 100;
  int limit = 10;

  BookCubit({
    required IBookRepository bookRepository,
    required BookProvider bookProvider,
  })  : _bookRepository = bookRepository,
        _bookProvider = bookProvider,
        super(BookInitial());

  Future<void> getBooksFromAPIAsync() async {
    emit(BookLoading(0));
    try {
      List<BookResponseModel> allBooks = [];
      int page = 1;
      int insertedBooksCount = 0;

      do {
        final result =
            await _bookRepository.getBooks(q: 'b', page: page, limit: limit);
        result.fold(
          (l) {
            emit(BookError(l.message.toString()));
          },
          (r) async {
            // await _bookProvider.insertBook( BookLocalModel(authorKey: [], authorName: ["Ibraham"], ia: [], language: ["mx"],
            // title: "Mi librito"));
            if (insertedBooksCount + r.length <= totalBooks) {
              final booksToStore = r
                  .map((book) => BookLocalModel(
                      title: book.title ?? "",
                      authorKey: book.authorKey,
                      authorName: book.authorName,
                      ia: book.ia,
                      language: book.language,
                      coverEditionKey: book.coverEditionKey,
                      coverI: book.coverI,
                      editionCount: book.editionCount,
                      firstPublishYear: book.firstPublishYear,
                      iaCollectionS: book.iaCollectionS,
                      key: book.key,
                      lendingEditionS: book.lendingEditionS,
                      lendingIdentifierS: book.lendingIdentifierS))
                  .toList();
              await _bookProvider.insertBooks(booksToStore);
              insertedBooksCount += r.length;
              allBooks.addAll(r);

              emit(BookLoading(
                  (insertedBooksCount / totalBooks * 100).toDouble()));
            } else {
              // Insertar libros necesaios
              final remainingBooks = totalBooks - insertedBooksCount;
              final listRemaining = r.take(remainingBooks);
              final booksToStore = listRemaining
                  .map((book) => BookLocalModel(
                      title: book.title ?? "",
                      authorKey: book.authorKey,
                      authorName: book.authorName,
                      ia: book.ia,
                      language: book.language,
                      coverEditionKey: book.coverEditionKey,
                      coverI: book.coverI,
                      editionCount: book.editionCount,
                      firstPublishYear: book.firstPublishYear,
                      iaCollectionS: book.iaCollectionS,
                      key: book.key,
                      lendingEditionS: book.lendingEditionS,
                      lendingIdentifierS: book.lendingIdentifierS
                      
                      ))
                  .toList();
              await _bookProvider.insertBooks(booksToStore);

              insertedBooksCount += booksToStore.length;
              allBooks.addAll(listRemaining);

              emit(BookLoading(
                  (insertedBooksCount / totalBooks * 100).toDouble()));
              return;
            }
          },
        );
        page++;
      } while (allBooks.length < totalBooks);
    } catch (e) {
      emit(BookError("Error al obtener los libros"));
    }
  }
}
