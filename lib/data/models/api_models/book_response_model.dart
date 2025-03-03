class BookResponseModel {
  BookResponseModel({
    required this.authorKey,
    required this.authorName,
    required this.coverEditionKey,
    required this.coverI,
    required this.editionCount,
    required this.firstPublishYear,
    required this.ia,
    required this.iaCollectionS,
    required this.key,
    required this.language,
    required this.lendingEditionS,
    required this.lendingIdentifierS,
    required this.title,
  });

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

  factory BookResponseModel.fromJson(Map<String, dynamic> json) {
    return BookResponseModel(
      authorKey: json["author_key"] == null
          ? []
          : List<String>.from(json["author_key"]!.map((x) => x)),
      authorName: json["author_name"] == null
          ? []
          : List<String>.from(json["author_name"]!.map((x) => x)),
      coverEditionKey: json["cover_edition_key"],
      coverI: json["cover_i"],
      editionCount: json["edition_count"],
      firstPublishYear: json["first_publish_year"],
      ia: json["ia"] == null
          ? []
          : List<String>.from(json["ia"]!.map((x) => x)),
      iaCollectionS: json["ia_collection_s"],
      key: json["key"],
      language: json["language"] == null
          ? []
          : List<String>.from(json["language"]!.map((x) => x)),
      lendingEditionS: json["lending_edition_s"],
      lendingIdentifierS: json["lending_identifier_s"],
      title: json["title"],
    );
  }
}
