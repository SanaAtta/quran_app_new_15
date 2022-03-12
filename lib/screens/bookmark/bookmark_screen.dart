import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app_new/colors/colors.dart';
import 'package:quran_app_new/globals/globals.dart';
import 'package:quran_app_new/model/bookmark_model.dart';
import 'package:quran_app_new/screens/quran_screen/quran_screen.dart';

class BookmarkScreen extends StatefulWidget {
  int? bookmarkIndex;
  String? bookTitle;

  BookmarkScreen({this.bookmarkIndex, this.bookTitle});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  List<BookmarkModel> list = [];
  @override
  void initState() {
    bookmarkDb.initializeDatabases().then((value) {
      print('------bookmark database intialized');
      loadBookmarks();
      print("..........db: $loadBookmarks");
    });
    //onSave();
    super.initState();
  }

  void loadBookmarks() {
    bookmarks = bookmarkDb.getBookmarks();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: FutureBuilder<List<BookmarkModel>>(
      future: bookmarkDb.getBookmarks(),
      builder: (context, snapshot) {
        // currentBookmarks = snapshot.data;
        print(".......................$snapshot");
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    print("............length:${snapshot.data!.length}");
                    print(
                        ",,,,,,,,,,,,index: ${snapshot.data?[index].bookmarkPage}");
                    var p = snapshot.data?[index].bookmarkPage;
                    return Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.04, right: width * 0.04),
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Container(
                                height: height * 0.06,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ListTile(
                                  title: Text(
                                    "Page: ${snapshot.data?[index].bookmarkPage}",
                                    style: TextStyle(
                                        color: ColorsClass().dartColor,
                                        fontSize: 20,
                                        fontFamily: 'Roboto',
                                        package: "awesome_package"),
                                  ),
                                  subtitle: Text(
                                    "Para: ${snapshot.data?[index].bookmarkSurah}",
                                    style: TextStyle(
                                        color: ColorsClass().dartColor,
                                        fontSize: 16,
                                        fontFamily: 'Roboto',
                                        package: "awesome_package"),
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: ColorsClass().dartColor,
                                    ),
                                    onPressed: () {
                                      deleteAlarm(int.parse(snapshot
                                          .data![index].bookmark_id
                                          .toString()));
                                      // snapshot.data?.removeAt(index);
                                      // Get.to(QuranPakScreen((int.parse(p!)), ''));
                                      // print(
                                      //     "......... ${TOPICS_NAMES_ARRAY[index]}");
                                      // setState(() {
                                      //   //currentBookmarks?.removeAt(index);
                                      //   snapshot.data
                                      //       ?.indexOf(snapshot.data![index]);
                                      //   snapshot.data?.removeAt(index);
                                      //   print(
                                      //       "........remove: ${snapshot.data?.removeAt(index)}");
                                      // });
                                    },
                                  ),
                                )),
                            onTap: () {
                              Get.to(QuranPakScreen((int.parse(p!)), ''));
                            },
                          ),
                          Divider(
                            color: ColorsClass().light,
                            indent: width * 0.05,
                            endIndent: width * 0.05,
                            thickness: 1,
                          )
                        ],
                      ),
                    );
                  })
              : Center(child: CircularProgressIndicator());
        } else {
          return Container();
        }
        // if (snapshot.hasData) {
        //   return ListView.builder(
        //       itemCount: snapshot.data!.length,
        //       itemBuilder: (context, index) {
        //         print("............length:${snapshot.data!.length}");
        //         print(",,,,,,,,,,,,index: ${snapshot.data?[index].bookmarkPage}");
        //         return Center(
        //             child: Text(
        //           "${snapshot.data?[index].bookmarkPage}",
        //           style: TextStyle(color: Colors.black),
        //         ));
        //       });
        // }
        // else {
        //   return Text("oop");
        // }
      },
    ));
  }

  deleteAlarm(int id) {
    bookmarkDb.delete(id);
    //unsubscribe for notification
    loadBookmarks();
  }
}
