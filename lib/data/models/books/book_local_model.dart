import 'package:floor/floor.dart';

@entity
class BookLocalModel {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String title;
  final String author;
  final String coverUrl;

  BookLocalModel({
    this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
  });
}
