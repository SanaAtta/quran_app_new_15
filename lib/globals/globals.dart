import 'package:flutter/material.dart';
import 'package:quran_app_new/database_bookmark/bookmark_database.dart';
import 'package:quran_app_new/model/bookmark_model.dart';
import 'package:quran_app_new/model/quran_model.dart';

bool isSound = false;
var pageIndex;
var para_num = 1;
final growableList = [];
SqfliteDatabaseHelperClass bookmarkDb = SqfliteDatabaseHelperClass();
var book;
List<QuranPakModel> imgPage = [];
Future<List<BookmarkModel>>? bookmarks;
List<Color> overlayColors = [
  Color(0xffCBCBCB),
  Color(0xffFFA5A5),
  Color(0xffFFC4F5),
  Color(0xffE0BCFF),
  Color(0xffC6BEFF),
  Color(0xffCFFFFC),
  Color(0xffC7FFD0),
  Color(0xffFFF6C7),
  Color(0xffFFE3C9),
  Color(0xffEDFFCE),
  Color(0xffFFD29E),
  Color(0xffffffff),
];

List<Color> textColors = [
  Color(0xff000000),
  Color(0xff8A0000),
  Color(0xff80006A),
  Color(0xff43007E),
  Color(0xff100081),
  Color(0xff006059),
  Color(0xff008015),
  Color(0xff9C8200),
  Color(0xff843F00),
  Color(0xff4E4E4E),
  Color(0xff909500),
  Color(0xff004572),
];
