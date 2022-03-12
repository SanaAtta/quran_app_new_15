class BookmarkModel {
  final int? bookmark_id;
  String bookmarkPage;
  String bookmarkSurah;

  BookmarkModel(
      {required this.bookmarkPage,
      this.bookmark_id,
      required this.bookmarkSurah});

  factory BookmarkModel.fromMap(Map<String, dynamic> json) => BookmarkModel(
      bookmarkPage: json['bookmark_page'],
      bookmark_id: json['bookmarkID'],
      bookmarkSurah: json['bookmark_surah']);
  Map<String, dynamic> toMap() => {
        "bookmarkID": bookmark_id,
        "bookmark_page": bookmarkPage,
        "bookmark_surah": bookmarkSurah
      };
}
