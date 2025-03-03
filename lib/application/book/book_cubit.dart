// ignore_for_file: unused_field

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_exam/application/book/book_state.dart';
import 'package:flutter_exam/core/storage/session_storage.dart';
import 'package:flutter_exam/data/models/api_models/book_response_model.dart';
import 'package:flutter_exam/data/models/books/book_local_model.dart';
import 'package:flutter_exam/domain/interfaces/i_book_repository.dart';
import 'package:flutter_exam/presentation/providers/book_provider.dart';

class BookCubit extends Cubit<BookState> {
  final IBookRepository _bookRepository;
  final BookProvider _bookProvider;
  int totalBooks = 1000;
  int limit = 100;

  BookCubit({
    required IBookRepository bookRepository,
    required BookProvider bookProvider,
  })  : _bookRepository = bookRepository,
        _bookProvider = bookProvider,
        super(BookInitial()) {
    _initConnectivityListener();
  }
  bool _isPaused = false;
  bool _noInternet = false;

  bool get isPaused => _isPaused;
  bool get noInternet => _noInternet;

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  void _initConnectivityListener() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (event) {
        ConnectivityResult result = event.first;
        if (result == ConnectivityResult.none) {
          _noInternet = true;
          _isPaused = true;
          emit(BookError("Sin conexión a internet"));
        } else {
          _noInternet = false;
          if (_isPaused) {
            _isPaused = false;
            emit(BookLoading(0));
            getBooksFromAPIAsync();
          }
        }
      },
    );
  }

  void togglePause() {
    _isPaused = !_isPaused;
    emit(BookPaused(_isPaused));
  }

  Future<void> getBooksFromAPIAsync() async {
    totalBooks = int.parse(_bookProvider.maxDownloadCountCtrl.text);
    int insertedBooksCount = await SessionStorage.getInsertedBookCount();
    int lastPage = await SessionStorage.getLastDownloadedPage();
    bool downloadComplete = await SessionStorage.getDownloadComplete();

    if (downloadComplete) {
      emit(BookSuccess("Descarga ya completada previamente."));
      return;
    }

    emit(BookLoading((insertedBooksCount / totalBooks * 100).toDouble()));

    try {
      List<BookResponseModel> allBooks = [];
      int page = lastPage;

      while (insertedBooksCount < totalBooks) {
        while (_isPaused || _noInternet) {
          await Future.delayed(const Duration(milliseconds: 500));
        }

        final result =
            await _bookRepository.getBooks(q: 'b', page: page, limit: limit);

        if (result.isLeft()) {
          emit(BookError("Error en la API al obtener libros."));
          return;
        }

        result.fold(
          (l) => emit(BookError(l.message.toString())),
          (r) async {
            if (insertedBooksCount + r.length > totalBooks) {
              r = r.take(totalBooks - insertedBooksCount).toList();
            }

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
            insertedBooksCount += booksToStore.length;
            allBooks.addAll(r);
            await SessionStorage.saveProgress(insertedBooksCount, page);
            emit(BookLoading(
                (insertedBooksCount / totalBooks * 100).toDouble()));
          },
        );

        page++;
      }

      await SessionStorage.saveComplete(true);
      emit(BookSuccess("Descarga completada."));
    } catch (e) {
      emit(BookError("Error al obtener los libros"));
    }
  }
}
