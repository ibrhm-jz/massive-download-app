import 'dart:convert';
import 'package:floor/floor.dart';

class StringListConverter extends TypeConverter<List<String>, String> {
  @override
  List<String> decode(String databaseValue) {
    return (jsonDecode(databaseValue) as List<dynamic>)
        .map((e) => e.toString())
        .toList();
  }

  @override
  String encode(List<String> value) {
    return jsonEncode(value);
  }
}
