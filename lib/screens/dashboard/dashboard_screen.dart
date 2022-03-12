import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quran_app_new/colors/colors.dart';
import 'package:quran_app_new/globals/globals.dart';
import 'package:quran_app_new/screens/bookmark/bookmark_screen.dart';
import 'package:quran_app_new/screens/para_screen/para_screen.dart';
import 'package:quran_app_new/screens/quran_screen/quran_screen.dart';
import 'package:quran_app_new/screens/surah_screen/surah_screen.dart';
import 'package:quran_app_new/widget/drawer/drawer.dart';
import 'package:quran_app_new/widget/search_dialog/search_Dialog.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  late TabController _controller;

  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller =
        TabController(length: 4, initialIndex: _selectedIndex, vsync: this);
    _controller.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
        onWillPop: () async => exitDialog(context),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DefaultTabController(
            length: 4,
            child: Scaffold(
                key: scaffoldKey,
                appBar: AppBar(
                  title: Text(
                    "Quran e Pak",
                    style:
                        TextStyle(color: ColorsClass().dartColor, fontSize: 24),
                  ),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: SvgPicture.asset(
                        "assets/drawer/menu.svg",
                      ),
                      onTap: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    // Status bar color
                    statusBarColor: ColorsClass().color1,

                    // Status bar brightness (optional)
                    statusBarIconBrightness:
                        Brightness.dark, // For Android (dark icons)
                    statusBarBrightness:
                        Brightness.light, // For iOS (dark icons)
                  ),
                  leadingWidth: width * 0.11,
                ),
                drawer: DrawerWidget(),
                body: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.215),
                      child: Column(
                        children: <Widget>[
                          TabBar(
                            indicatorColor: ColorsClass().dartColor,
                            controller: _controller,
                            labelColor: ColorsClass().dartColor,
                            unselectedLabelColor: ColorsClass().light,
                            tabs: [
                              Tab(
                                  icon: SvgPicture.asset(
                                "assets/main/para_unselected.svg",
                                color: _selectedIndex == 0
                                    ? ColorsClass().dartColor
                                    : ColorsClass().light,
                              )),
                              Tab(
                                  icon: SvgPicture.asset(
                                "assets/main/surah_selected.svg",
                                color: _selectedIndex == 1
                                    ? ColorsClass().dartColor
                                    : ColorsClass().light,
                              )),
                              Tab(
                                  icon: SvgPicture.asset(
                                "assets/main/book_unselected.svg",
                                color: _selectedIndex == 2
                                    ? ColorsClass().dartColor
                                    : ColorsClass().light,
                              )),
                              Tab(
                                  icon: SvgPicture.asset(
                                "assets/main/search_selected.svg",
                                color: _selectedIndex == 3
                                    ? ColorsClass().dartColor
                                    : ColorsClass().light,
                              )),
                            ],
                            onTap: (index) {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                          ),
                          Expanded(
                            flex: 1,
                            child: TabBarView(
                              controller: _controller,
                              children: [
                                ParaScreen(),
                                SurahScreen(),
                                BookmarkScreen(),
                                SearchDialogWidget()
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.03,
                          right: width * 0.03,
                          top: height * 0.0),
                      child: GestureDetector(
                        child: Image.asset("assets/main/img.png"),
                        onTap: () {
                          Get.to(QuranPakScreen(
                            pageIndex,
                            para_num,
                            surah_name: surah_name,
                          ));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.1,
                          right: width * 0.03,
                          top: height * 0.07),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Surah: $surah_name",
                            style: TextStyle(
                                color: ColorsClass().dartColor,
                                fontSize: 24,
                                fontFamily: 'Roboto',
                                package: "awesome_package"),
                          ),
                          // Text(
                          //   "Para No : $para_num",
                          //   style: TextStyle(
                          //       color: ColorsClass().dartColor,
                          //       fontSize: 18,
                          //       fontFamily: 'Roboto',
                          //       package: "awesome_package"),
                          // ),
                          // Text(
                          //   "Page No: $pageIndex",
                          //   style: TextStyle(
                          //       color: ColorsClass().dartColor,
                          //       fontSize: 18,
                          //       fontFamily: 'Roboto',
                          //       package: "awesome_package"),
                          // ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ));
  }

  exitDialog(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AlertDialog(
            backgroundColor: ColorsClass().color1,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/ad.png"),
                SizedBox(
                  height: 15,
                ),
                // Text(
                //     "Surah ${dialogBookmarkTitle.contains(pageIndex.toString())}"),
                Center(
                  child: Text(
                    "Are you want to exit?",
                    style: TextStyle(
                        color: ColorsClass().dartColor,
                        fontSize: 26,
                        fontFamily: 'Roboto',
                        package: "awesome_package"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    child: Image.asset(
                      "assets/dialog/cancel.png",
                      height: height * 0.04,
                      width: width * 0.3,
                    ),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  //SizedBox(width: width * 0.23),
                  GestureDetector(
                    child: SvgPicture.asset(
                      "assets/dialog/exit.svg",
                      height: height * 0.04,
                      width: width * 0.3,
                    ),
                    onTap: () async {
                      exit(0);
                    },
                  ),
                ],
              )
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          );
        });
  }
}
