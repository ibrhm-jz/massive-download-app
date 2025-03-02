import 'package:flutter_exam/core/errors/operation_failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@factoryMethod
abstract class IBookRepository {
  Future<Either<OperationFailure, List<dynamic>>> getBooks({
    required String q,
    required int page,
    int limit = 100,
  });
}
