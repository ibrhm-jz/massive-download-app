import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_exam/core/errors/operation_failure.dart';
import 'package:flutter_exam/data/models/api_models/book_response_model.dart';
import 'package:flutter_exam/data/utils/http_client.dart';
import 'package:flutter_exam/domain/interfaces/i_book_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IBookRepository)
class BookRepository implements IBookRepository {
  final HttpClient _httpClient;
  BookRepository(this._httpClient);
  @override
  Future<Either<OperationFailure, List<BookResponseModel>>> getBooks({
    required String q,
    required int page,
    int limit = 100,
  }) async {
    try {
      final response = await _httpClient.get(
          endpoint: '/search.json',
          params: {'q': q, 'page': page.toString(), 'limit': limit.toString()});
      if (response.statusCode == 200) {
        final List<BookResponseModel>? books =
            await compute(_parseBooks, response.body);
        if (books != null) {
          return right(books);
        } else {
          return left(
            OperationFailure(),
          );
        }
      }
      return left(OperationFailure());
    } on TimeoutException catch (_) {
      return left(OperationFailure(
        message:
            'La solicitud ha tardado demasiado y se agotó el tiempo de espera.',
      ));
    } catch (e) {
      return left(OperationFailure());
    }
  }

  List<BookResponseModel> _parseBooks(String jsonData) {
    final Map<String, dynamic> data = jsonDecode(jsonData);
    return (data['docs'] as List)
        .map((e) => BookResponseModel.fromJson(e))
        .toList();
  }
}
