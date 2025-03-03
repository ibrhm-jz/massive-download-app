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
    if (coverI == null) {
      return "https://static.wikia.nocookie.net/gijoe/images/b/bf/Default_book_cover.jpg/revision/latest?cb=20240508080922";
    }
    return "https://covers.openlibrary.org/b/id/$coverI-L.jpg";
  }

  String getAuthorProfileBook(String author) {
    if (author.isEmpty) {
      return "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";
    }
    return "https://covers.openlibrary.org/a/olid/$author-M.jpg";
  }
}
