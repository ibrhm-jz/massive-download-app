import 'package:floor/floor.dart';

@Entity(tableName: 'books')
class BookLocalModel {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final List<String> authorKey;
  final List<String> authorName;
  final String? coverEditionKey;
  final int? coverI;
  final int? editionCount;
  final int? firstPublishYear;
  final List<String> ia;
  final String? iaCollectionS;
  final String? key;
  final List<String> language;
  final String? lendingEditionS;
  final String? lendingIdentifierS;
  final String? title;

  BookLocalModel({
    this.id,
    required this.authorKey,
    required this.authorName,
    this.coverEditionKey,
    this.coverI,
    this.editionCount,
    this.firstPublishYear,
    required this.ia,
    this.iaCollectionS,
    this.key,
    required this.language,
    this.lendingEditionS,
    this.lendingIdentifierS,
    this.title,
  });
  String getCoverBook() {
    return "https://covers.openlibrary.org/b/id/$coverI-L.jpg";
  }
  String getAuthorProfileBook(String author) {
    return "https://covers.openlibrary.org/a/olid/$author-M.jpg";
  }
}
