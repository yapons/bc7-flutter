class EbookResponseManual {
  final String? title;
  final String? subtitle;
  final String? isbn13;
  final String? price;
  final String? image;
  final String? url;

  EbookResponseManual({
    this.title,
    this.subtitle,
    this.isbn13,
    this.price,
    this.image,
    this.url,
  });

  factory EbookResponseManual.fromJson(Map<String, dynamic> json) {
    // List<String> filmList = [];
    // for (var item in json['films']) {
    //   filmList.add(item);
    // }

    return EbookResponseManual(
      title: json['title'],
      subtitle: json['subtitle'],
      price: json['price'],
      image: json['image'],
      isbn13: json['isbn13'],
      url: json['url'],
    );
  }
}
