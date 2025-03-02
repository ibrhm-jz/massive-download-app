import 'dart:convert';
import 'package:flutter_exam/data/utils/api_response.dart';
import 'package:http/http.dart';

/// Decodifica la respuesta HTTP [response] en un modelo genérico [T].
///
/// Toma un [response] de tipo [Response] y una función [fromJson] que convierte
/// el JSON dinámico en un tipo específico [T].
///
/// Retorna un modelo [ResponseModel] que encapsula el JSON decodificado [json]
/// y el resultado de aplicar la función [fromJson] al JSON decodificado.
ApiResponse responseDecode<T>(Response response, T Function(dynamic) fromJson) {
  final json = jsonDecode(response.body);
  return ApiResponse.fromJson(
    json: json,
    data: fromJson,
  );
}
