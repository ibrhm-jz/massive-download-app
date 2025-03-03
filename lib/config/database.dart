import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_exam/data/datasources/books/book_datasource.dart';
import 'package:flutter_exam/data/models/books/book_local_model.dart';
import 'package:flutter_exam/data/utils/string_list_coverter.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there
@TypeConverters([StringListConverter]) 
@Database(version: 1, entities: [BookLocalModel])
abstract class AppDatabase extends FloorDatabase {
  BookDataSource get bookDao;
}