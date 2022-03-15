class BookmarkModel {
  final int? bookmark_id;
  String bookmarkPage;
  String bookmarkSurah;
  String bookmarkTime;

  BookmarkModel(
      {required this.bookmarkPage,
      this.bookmark_id,
      required this.bookmarkSurah,
      required this.bookmarkTime});

  factory BookmarkModel.fromMap(Map<String, dynamic> json) => BookmarkModel(
      bookmarkPage: json['bookmark_page'],
      bookmark_id: json['bookmarkID'],
      bookmarkSurah: json['bookmark_surah'],
      bookmarkTime: json['bookmark_time']);
  Map<String, dynamic> toMap() => {
        "bookmarkID": bookmark_id,
        "bookmark_page": bookmarkPage,
        "bookmark_surah": bookmarkSurah,
        "bookmark_time": bookmarkTime,
      };
}
