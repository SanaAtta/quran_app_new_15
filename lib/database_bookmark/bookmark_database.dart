import 'package:path/path.dart';
import 'package:quran_app_new/model/bookmark_model.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteDatabaseHelperClass {
  static const String DATABASE_NAME = "bookmarkPage.db";
  static const int DATABASE_VERSION = 2;

  final String BOOKMARK_TABLE_NAME = "bookmark_table";
  static const String COL_BOOKMARK_ID = "bookmarkID";
  static const String COL_BOOKMARK_PAGE = "bookmark_page";
  static const String COL_BOOKMARK_SURAH = "bookmark_surah";

  SqfliteDatabaseHelperClass._privateConstructor();

  SqfliteDatabaseHelperClass();

  static final SqfliteDatabaseHelperClass instance =
      SqfliteDatabaseHelperClass._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      return _database = await initializeDatabases();
    }
    return _database!;
  }

  Future<Database> initializeDatabases() async {
    var dir = await getDatabasesPath();
    var path = join(dir + "bookmark.db");

    Database database = await openDatabase(
      path,
      version: DATABASE_VERSION,
      onCreate: (db, version) async {
        await db.execute('''
         CREATE TABLE $BOOKMARK_TABLE_NAME(
          $COL_BOOKMARK_ID INTEGER PRIMARY KEY ,
          $COL_BOOKMARK_PAGE TEXT NOT NULL ,
          $COL_BOOKMARK_SURAH TEXT 
      )
        ''');
      },
    );
    return database;
  }

  void insertBookmark(BookmarkModel bookmark) async {
    var db = await this.database;
    var result = await db.insert(BOOKMARK_TABLE_NAME, bookmark.toMap());
    print('result: $result');
  }

  Future<List<BookmarkModel>> getBookmarks() async {
    List<BookmarkModel> _bookmark = [];

    var db = await this.database;
    var result = await db.query(BOOKMARK_TABLE_NAME);
    result.forEach((element) {
      var bookmark = BookmarkModel.fromMap(element);
      _bookmark.add(bookmark);
      print("...................db${bookmark.bookmarkPage}");
      print("...................db${bookmark.bookmarkSurah}");
    });

    return _bookmark;
  }

  Future<int> delete(int id) async {
    Database db = await this.database;
    return await db.delete(BOOKMARK_TABLE_NAME,
        where: '$COL_BOOKMARK_ID = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> retrieveBookmarkDetails() async {
    Database db = await instance.database;
    return await db.query(BOOKMARK_TABLE_NAME);
  }

  Future<int> insertBookmarkDetails(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    print(" : $row");
    return await db.insert(BOOKMARK_TABLE_NAME, row);
  }
}
