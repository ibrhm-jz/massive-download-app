import 'package:flutter_exam/core/errors/operation_failure.dart';
import 'package:flutter_exam/data/models/api_models/book_response_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@factoryMethod
abstract class IBookRepository {
  Future<Either<OperationFailure, List<BookResponseModel>>> getBooks({
    required String q,
    required int page,
    int limit = 100,
  });
}
