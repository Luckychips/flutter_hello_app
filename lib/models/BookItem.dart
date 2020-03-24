class BookItem {
  final String title;
  final String thumbnail;

  BookItem({this.title, this.thumbnail});

  factory BookItem.fromJson(Map<String, dynamic> json) {
    return BookItem(
      title: json['title'],
      thumbnail: json['thumbnail']
    );
  }
}