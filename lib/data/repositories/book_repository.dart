import 'package:flutter_exam/core/errors/operation_failure.dart';
import 'package:flutter_exam/data/models/api_models/book_response_model.dart';
import 'package:flutter_exam/data/utils/http_client.dart';
import 'package:flutter_exam/data/utils/response_decode.dart';
import 'package:flutter_exam/domain/interfaces/i_book_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IBookRepository)
class BookRepository implements IBookRepository {
  final HttpClient _httpClient;
  BookRepository(this._httpClient);
  @override
  Future<Either<OperationFailure, List>> getBooks({
    required String q,
    required int page,
    int limit = 100,
  }) async {
    try {
      final response = await _httpClient.get(
          endpoint: '/search.json',
          params: {'q': q, 'page': page.toString(), 'limit': limit.toString()});
      if (response.statusCode == 200) {
        final responseModel = responseDecode<List<BookResponseModel>>(
          response,
          (json) =>
              (json as List).map((e) => BookResponseModel.fromJson(e)).toList(),
        );
        List<BookResponseModel>? data = responseModel.data;
        if (data != null) {
          return right(data);
        } else {
          return left(
            OperationFailure(
              code: response.statusCode,
              message: responseModel.message,
            ),
          );
        }
      }
      return left(OperationFailure());
    } catch (e) {
      return left(OperationFailure());
    }
  }
}
