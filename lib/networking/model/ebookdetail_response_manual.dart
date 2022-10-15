class EbookDetailResponseManual {
  final String? error;
  final String? title;
  final String? subtitle;
  final String? authors;
  final String? publisher;
  final String? language;
  final String? isbn10;
  final String? isbn13;
  final String? year;

  EbookDetailResponseManual({
    this.error,
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.language,
    this.isbn10,
    this.isbn13,
    this.year,
  });

  factory EbookDetailResponseManual.fromJson(dynamic json) {
    // List<String> filmList = [];
    // for (var item in json['films']) {
    //   filmList.add(item);
    // }

    return EbookDetailResponseManual(
      error: json['error'],
      title: json['title'],
      subtitle: json['subtitle'],
      authors: json['authors'],
      publisher: json['publisher'],
      language: json['language'],
      isbn10: json['isbn10'],
      isbn13: json['isbn13'],
      year: json['year'],
    );
  }
}
