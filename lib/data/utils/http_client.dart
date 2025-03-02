import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_exam/config/enviroments.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

enum HttpClientType {
  json(value: 'application/json'),
  image(value: 'multipart/form-data');

  final String value;

  const HttpClientType({
    required this.value,
  });
}

@injectable
class HttpClient {
  Future<http.Response> post({
    required String endpoint,
    dynamic body,
    HttpClientType type = HttpClientType.json,
  }) async {
    final url = Uri.parse(Enviroments.apiUrl + endpoint);
    final headers = {
      'Content-Type': type.value,
    };
    if (body == null) {
      return http.post(url, headers: headers);
    }
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );
    if (Enviroments.isDebug) {
      final Logger logger = Logger();
      logger.f(
        stackTrace: StackTrace.empty,
        {
          "status": response.statusCode.toString(),
          "url": url,
          "body": json.decode(response.body)
        },
      );
    }
    return response;
  }

  Future<http.Response> put({
    required String endpoint,
    required dynamic body,
  }) async {
    final url = Uri.parse(Enviroments.apiUrl + endpoint);
    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );
    if (Enviroments.isDebug) {
      final Logger logger = Logger();
      logger.i(
        stackTrace: StackTrace.empty,
        {
          "status": response.statusCode.toString(),
          "url": url,
          "body": json.decode(response.body)
        },
      );
    }
    return response;
  }

  Future<http.Response> delete({required String endpoint}) async {
    final url = Uri.parse(Enviroments.apiUrl + endpoint);
    final response = await http.delete(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (Enviroments.isDebug) {
      final Logger logger = Logger();
      logger.e(
        stackTrace: StackTrace.empty,
        {
          "status": response.statusCode.toString(),
          "url": url,
          "body": json.decode(response.body)
        },
      );
    }
    return response;
  }

  Future<http.Response> postFile({
    required String endpoint,
    dynamic body,
    required String fileName,
    required Uint8List file,
    HttpClientType type = HttpClientType.json,
  }) async {
    final request =
        http.MultipartRequest('POST', Uri.parse(Enviroments.apiUrl + endpoint));
    final multipartFile = http.MultipartFile.fromBytes(
      'image',
      file,
      filename: fileName,
    );
    request.files.add(multipartFile);
    final response = await request.send();
    if (Enviroments.isDebug) {
      final Logger logger = Logger();
      logger.i(error: response.statusCode.toString(), response.statusCode);
    }
    return await http.Response.fromStream(response);
  }

  Future<http.Response> get({
    required String endpoint,
    bool enableCache = false,
    Map<String, String>? params,
  }) async {
    final url = Uri.parse(Enviroments.apiUrl + endpoint)
        .replace(queryParameters: params);
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json'
      },
    );
    if (Enviroments.isDebug) {
      final Logger logger = Logger();
      logger.f(
        stackTrace: StackTrace.empty,
        {
          "status": response.statusCode.toString(),
          "url": url,
          "body": json.decode(response.body)
        },
      );
    }
    return response;
  }

  Uri buildUri(String path, {Map<String, String>? params}) {
    Uri baseUri = Uri.parse(Enviroments.apiUrl);
    if (baseUri.scheme == 'http') {
      return Uri.http(
        baseUri.host,
        path,
        params,
      );
    } else {
      return Uri.https(baseUri.host, path, params);
    }
  }

}
