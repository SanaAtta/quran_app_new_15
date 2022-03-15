import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quran_app_new/admob/admob_helper.dart';
import 'package:quran_app_new/colors/colors.dart';
import 'package:quran_app_new/controller/mainController.dart';
import 'package:quran_app_new/globals/globals.dart';
import 'package:quran_app_new/model/bookmark_model.dart';
import 'package:quran_app_new/model/quran_model.dart';
import 'package:quran_app_new/model/sound_model.dart';
import 'package:quran_app_new/screens/surah_screen/surah_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranPakScreen extends StatefulWidget {
  var para_index;
  var parah_no;
  String? surah_name;

  QuranPakScreen(this.para_index, this.parah_no, {this.surah_name});
  @override
  State<QuranPakScreen> createState() => _QuranPakScreenState();
}

class _QuranPakScreenState extends State<QuranPakScreen> {
  MainController mainController = Get.put(MainController());
  PageController page_controller = PageController();
  ColorSwatch? tempMainColor;
  ColorSwatch? mainColor = Colors.blue;

  String songpath = "assets/sound/bookpage.mp3";

  var ContainerColor = Colors.white;
  var ImageColor = null;
  bool isdarkMode = false;
  bool isSound = false;

  Color currentColor = Colors.amber;
  List<Color> currentColors = [Colors.yellow, Colors.green];
  List<Color> colorHistory = [];
  double _borderRadius = 30;
  double _blurRadius = 5;
  double _iconSize = 24;

  void changeContainerColor(Color color) =>
      setState(() => ContainerColor = color);
  void changeCImageColor(Color color) => setState(() => ImageColor = color);
  void changeColors(List<Color> colors) =>
      setState(() => currentColors = colors);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  int i = 2;
  var bannerAd;
  bool isBannerAdReady = false;
  @override
  void initState() {
    //para_num = widget.parah_no;
    if (widget.para_index == null) {
      page_controller = PageController(initialPage: 0);
    } else if (widget.para_index != null) {
      page_controller = PageController(initialPage: widget.para_index);
    } else {
      page_controller = PageController(initialPage: pageIndex);
      print(".........");
    }
    imgPage = quran_pak_model_list;
    getDarkMode();
    getBackgroundColor();
    getImageColor();
    getSoundMode();
    getBookmarkIndex();
    //getParahNo();
    getSurah();

    LoadQuranPage;
    loadbannerAd();
    super.initState();
  }

  loadbannerAd() {
    bannerAd = BannerAd(
      adUnitId: AdmobHelper().bannerId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isBannerAdReady = true;
          bannerAd = ad;
          print("baner ad calling");
          setState(() {});
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          isBannerAdReady = false;
          setState(() {});
          ad.dispose();
        },
      ),
    );
    bannerAd.load();
  }

  getDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isdarkMode = prefs.getBool("dark")!;
    print(".......................dark mode $isdarkMode");
    setState(() {});
  }

  setDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("dark", isdarkMode);
    print(".......................set dark mode $isdarkMode");
  }

  setBackgroundColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('background_color', ContainerColor.value);
  }

  getBackgroundColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ContainerColor =
        Color(prefs.getInt('background_color') ?? Colors.white.value);
    print(".......................back color value $ContainerColor");
    setState(() {});

// change Colors.blue to a default color
  }

  getImageColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ImageColor = Color(prefs.getInt('image_color')!);
    print(".......................img color value $ImageColor");
    setState(() {});

// change Colors.blue to a default color
  }

  setImageColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('image_color', ImageColor.value);
  }

  getSoundMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isSound = prefs.getBool("sound")!;
    print(".......................sound mode $isSound");
    setState(() {});
  }

  setSoundMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("sound", isSound);
  }

  getBookmarkIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    pageIndex = prefs.getInt("currentIndex")!;
    print(".........................bookmark: $pageIndex");
    setState(() {});
  }

  getParahNo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    widget.parah_no = prefs.getInt("para")!;
    print(".........................para: ${widget.parah_no}");
    setState(() {});
  }

  getSurah() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    surah_name = prefs.getString('surah')!;
    print(".........................surah: $surah_name");
    setState(() {});
  }

  void LoadQuranPage(int index) {
    setState(() {
      // imgPage = quran_pak_model_list[index].quran_image;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      // key: scaffoldKey,
      // appBar: AppBar(
      //   title: Text(
      //     "Quran e Pak",
      //     style: TextStyle(color: ColorsClass().dartColor, fontSize: 23),
      //   ),
      //   centerTitle: true,
      //   automaticallyImplyLeading: false,
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   leading: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: GestureDetector(
      //       child: Image.asset(
      //         "assets/main/home.png",
      //       ),
      //       onTap: () {
      //         Get.back();
      //       },
      //     ),
      //   ),
      //   leadingWidth: width * 0.11,
      // ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.05),
              child: PageView.builder(
                  itemCount: quran_pak_model_list.length,
                  reverse: true,
                  controller: page_controller,
                  onPageChanged: (value) async {
                    if (mainController.isPlaying.value == true) {
                      ByteData bytes = await rootBundle
                          .load(songpath); //load sound from assets
                      Uint8List soundbytes = bytes.buffer.asUint8List(
                          bytes.offsetInBytes, bytes.lengthInBytes);
                      await mainController.player.value.playBytes(soundbytes);
                      isSound = true;
                    } else {
                      print("*******");
                    }

                    // setSoundMode();
                  },
                  itemBuilder: (_, pagePosition) {
                    print(".......page index -----$pagePosition");
                    pageIndex = pagePosition;
                    return Container(
                      child: Image.asset(
                        imgPage[pagePosition].quran_image,
                        color: ImageColor,
                      ),
                      decoration: BoxDecoration(
                          // image: DecorationImage(
                          //     image: AssetImage(
                          //       quran_pak_model_list[pagePosition].quran_image,
                          //     ),
                          //     colorFilter:
                          //         ColorFilter.mode(ImageColor, BlendMode.xor)),
                          color: ContainerColor
                          //color: Get.isDarkMode ? Colors.black : Colors.white
                          // image: DecorationImage(
                          //     image: AssetImage("assets/page4.png")
                          // )
                          ),
                    );
                  }),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: height * 0.098,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              openColorDialog(context);
                            },
                            icon: SvgPicture.asset(
                                "assets/dialog/setting_selected.svg")),
                        Text(
                          "Settings",
                          style: TextStyle(
                              color: ColorsClass().dartColor, fontSize: 12),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  // Get.changeThemeMode(Get.isDarkMode
                                  //     ? ThemeMode.light
                                  //     : ThemeMode.dark);
                                  // Get.isDarkMode
                                  //     ? Get.changeTheme(ThemeData.light())
                                  //     : Get.changeTheme(ThemeData.dark());
                                  if (ContainerColor == Colors.white) {
                                    setState(() {
                                      ContainerColor = Colors.black;
                                      ImageColor = Colors.white;
                                      isdarkMode = true;
                                    });
                                  } else {
                                    setState(() {
                                      ContainerColor = Colors.white;
                                      imgPage = quran_pak_model_list;
                                      ImageColor = null;
                                      isdarkMode = false;
                                    });
                                  }
                                  // setImageColor();
                                  //setDarkMode();
                                  // setBackgroundColor();
                                },
                                icon: isdarkMode
                                    ? SvgPicture.asset(
                                        "assets/dialog/dark_mode.svg")
                                    : SvgPicture.asset(
                                        "assets/dialog/light_mode.svg")),
                            Text(
                              isdarkMode ? "Dark Mode" : "Light Mode",
                              style: TextStyle(
                                  color: ColorsClass().dartColor, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Obx(
                          () => IconButton(
                            onPressed: () {
                              //openSoundDialog(BuildContext);
                              if (!mainController.isPlaying.value) {
                                mainController.play();
                              } else {
                                mainController.stop();
                              }
                              setSoundMode();
                            },
                            icon: mainController.isPlaying.value
                                ? mainController.volume_icon.value
                                : mainController.mute_icon.value,
                          ),
                        ),
                        Text(
                          "Page Sound",
                          style: TextStyle(
                              color: ColorsClass().dartColor, fontSize: 12),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              _bookmarkDialog(context);
                            },
                            icon: SvgPicture.asset(
                                "assets/dialog/b_selected.svg")),
                        Text(
                          "Bookmark",
                          style: TextStyle(
                              color: ColorsClass().dartColor, fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _bookmarkDialog(BuildContext context) {
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
                isBannerAdReady
                    ? Padding(
                        padding: EdgeInsets.only(top: height * 0.05),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 300,
                            height: 250,
                            child: AdWidget(
                              ad: bannerAd,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        height: height * 0.25,
                        width: width,
                        child: Center(
                          child: Text("Ad"),
                        ),
                      ),
                SizedBox(
                  height: 10,
                ),
                // Text(
                //     "Surah ${dialogBookmarkTitle.contains(pageIndex.toString())}"),
                Center(
                  child: Container(
                    height: height * 0.05,
                    width: width * 0.6,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Selected Page $pageIndex",
                        style: TextStyle(color: ColorsClass().light),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Center(
                  child: Container(
                    height: height * 0.05,
                    width: width * 0.6,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Para ${widget.parah_no}",
                        style: TextStyle(color: ColorsClass().light),
                      ),
                    ),
                  ),
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
                    child: Image.asset(
                      "assets/dialog/save.png",
                      height: height * 0.04,
                      width: width * 0.3,
                    ),
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setInt("currentIndex", pageIndex);
                      print(
                          "..........................................................page index......$pageIndex");
                      para_num = widget.parah_no;
                      surah_name = widget.surah_name.toString();
                      //prefs.setInt("para", widget.parah_no);
                      prefs.setString('surah', surah_name);
                      prefs.setString('time', recentTime);
                      print(
                          ".........................................................para no.......$para_num");
                      print(
                          ".........................................................surah no.......$surah_name");
                      print(
                          ".........................................................time.......$recentTime");
                      growableList.addAll({pageIndex});
                      print(growableList);
                      onSave();
                      Get.back();
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

  openColorDialog(BuildContext context) {
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
                Center(
                  child: Text(
                    "Preview Settings",
                    style: TextStyle(color: ColorsClass().dartColor),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Text(
                //     "Surah ${dialogBookmarkTitle.contains(pageIndex.toString())}"),
                Center(
                  child: GestureDetector(
                      child: Center(
                        child: Image.asset(
                          "assets/dialog/overlay.png",
                          height: height * 0.045,
                          width: width * 0.45,
                        ),
                      ),
                      onTap: () {
                        mainController.overlayVisibilty();
                        print(
                            "............visible value ${mainController.isVisibleOverlay}");
                      }),
                ),
                SizedBox(
                  height: 15,
                ),
                Obx(
                  () => Center(
                    child: Visibility(
                      child: mainController.isVisibleOverlay.value == true
                          ? Container(
                              height: height * 0.23,
                              color: Colors.white,
                              child: BlockPicker(
                                pickerColor: ContainerColor,
                                onColorChanged: changeContainerColor,
                                availableColors: colorHistory.isNotEmpty
                                    ? colorHistory
                                    : overlayColors,
                                //layoutBuilder: pickerLayoutBuilder,
                                itemBuilder: pickerItemBuilderContainer,
                              ),
                            )
                          : Container(),
                      visible: mainController.isVisibleOverlay.value,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Center(
                  child: GestureDetector(
                      child: Center(
                        child: Image.asset(
                          "assets/dialog/text_color.png",
                          height: height * 0.045,
                          width: width * 0.45,
                        ),
                      ),
                      onTap: () {
                        mainController.textVisibilty();
                      }),
                ),
                SizedBox(
                  height: 15,
                ),
                Obx(
                  () => Center(
                    child: Visibility(
                      child: mainController.isVisibleText.value
                          ? Container(
                              height: height * 0.23,
                              color: Colors.white,
                              child: BlockPicker(
                                pickerColor: ImageColor == null
                                    ? Colors.white
                                    : ImageColor,
                                onColorChanged: changeCImageColor,
                                availableColors: colorHistory.isNotEmpty
                                    ? colorHistory
                                    : textColors,
                                //layoutBuilder: pickerLayoutBuilder,
                                itemBuilder: pickerItemBuilderImage,
                              ),
                            )
                          : Container(),
                      visible: mainController.isVisibleText.value,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: GestureDetector(
                    child: Center(
                      child: Image.asset(
                        "assets/dialog/page_sound.png",
                        height: height * 0.045,
                        width: width * 0.45,
                      ),
                    ),
                    onTap: () {
                      mainController.soundVisibilty();
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(() => Visibility(
                      child: Container(
                        height: height * 0.23,
                        width: width * 0.6,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: ListView.builder(
                                itemCount: soundModelList.length,
                                padding: EdgeInsets.all(8),
                                itemBuilder: (_, index) {
                                  return GestureDetector(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            "assets/dialog/volume_selected.svg",
                                            height: height * 0.02,
                                            width: width * 0.02,
                                          ),
                                          SizedBox(
                                            width: width * 0.05,
                                          ),
                                          Text(
                                              "${soundModelList[index].soundTitle}"),
                                        ],
                                      ),
                                    ),
                                    onTap: () async {
                                      songpath =
                                          soundModelList[index].page_sound;
                                      ByteData bytes = await rootBundle.load(
                                          songpath); //load sound from assets
                                      Uint8List soundbytes = bytes.buffer
                                          .asUint8List(bytes.offsetInBytes,
                                              bytes.lengthInBytes);
                                      int result = await mainController
                                          .player.value
                                          .playBytes(soundbytes);
                                      if (result == 1) {
                                        //play success
                                        mainController.isPlaying.value = true;

                                        print("Sound playing successful.");
                                      } else {
                                        print("Error while playing sound.");
                                      }
                                    },
                                  );
                                })),
                      ),
                      visible: mainController.isVisibleSound.value,
                    ))
              ],
            ),
            actions: [
              Row(
                children: [
                  GestureDetector(
                    child: Image.asset(
                      "assets/dialog/cancel.png",
                      height: height * 0.04,
                      width: width * 0.23,
                    ),
                    onTap: () {
                      ContainerColor = Colors.white;
                      //LoadQuranPage(6);
                      setState(() {});
                      ImageColor = null;
                      // setState(() {});
                      // ImageColor = Colors.black;
                      Get.back();
                      setImageColor();
                      setBackgroundColor();
                    },
                  ),
                  GestureDetector(
                    child: Image.asset(
                      "assets/dialog/save.png",
                      height: height * 0.04,
                      width: width * 0.23,
                    ),
                    onTap: () {
                      setImageColor();
                      setBackgroundColor();
                      setState(() {});
                      Get.back();
                    },
                  ),
                  GestureDetector(
                    child: Image.asset(
                      "assets/dialog/reset.png",
                      height: height * 0.04,
                      width: width * 0.23,
                    ),
                    onTap: () {
                      // setImageColor();
                      // setBackgroundColor();
                      ContainerColor = Colors.white;
                      //LoadQuranPage(6);
                      setState(() {});
                      ImageColor = null;
                      setImageColor();
                      setBackgroundColor();
                      Get.back();
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

  openSoundDialog(BuildContext) {
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
                Center(
                  child: Text(
                    "Preview Settings",
                    style: TextStyle(color: ColorsClass().dartColor),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Text(
                //     "Surah ${dialogBookmarkTitle.contains(pageIndex.toString())}"),
                Center(
                  child: Container(
                    height: height * 0.35,
                    width: width * 0.6,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: ListView.builder(
                            itemCount: soundModelList.length,
                            itemBuilder: (_, index) {
                              return ListTile(
                                title:
                                    Text("${soundModelList[index].soundTitle}"),
                                onTap: () async {
                                  songpath = soundModelList[index].page_sound;
                                  ByteData bytes = await rootBundle
                                      .load(songpath); //load sound from assets
                                  Uint8List soundbytes = bytes.buffer
                                      .asUint8List(bytes.offsetInBytes,
                                          bytes.lengthInBytes);
                                  int result = await mainController.player.value
                                      .playBytes(soundbytes);
                                  if (result == 1) {
                                    //play success
                                    mainController.isPlaying.value = true;

                                    print("Sound playing successful.");
                                  } else {
                                    print("Error while playing sound.");
                                  }
                                },
                              );
                            })),
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.12),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/dialog/cancel.svg",
                          height: height * 0.15,
                          width: width * 0.3,
                        )),
                    SizedBox(width: width * 0.23),
                    IconButton(
                        onPressed: () async {
                          setState(() {
                            isSound = true;
                          });
                          // openSoundDialog(BuildContext);
                          // if (!mainController.isPlaying.value) {
                          //   mainController.play();
                          // } else {
                          //   mainController.stop();
                          // }
                          Get.back();
                        },
                        icon: SvgPicture.asset("assets/dialog/save.svg")),
                  ],
                ),
              )
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          );
        });
  }

  Widget pickerItemBuilderContainer(
      Color color, bool isCurrentColor, void Function() changeColor) {
    return Container(
      height: 20,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        color: color,
        boxShadow: [
          BoxShadow(
              color: color.withOpacity(0.8),
              offset: const Offset(1, 2),
              blurRadius: _blurRadius)
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: changeColor,
          borderRadius: BorderRadius.circular(_borderRadius),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: isCurrentColor ? 1 : 0,
            child: Icon(
              Icons.done,
              size: _iconSize,
              color: useWhiteForeground(color) ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget pickerItemBuilderImage(
      Color color, bool isCurrentColor, void Function() changeColor) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        color: color,
        boxShadow: [
          BoxShadow(
              color: color.withOpacity(0.8),
              offset: const Offset(1, 2),
              blurRadius: _blurRadius)
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: changeColor,
          borderRadius: BorderRadius.circular(_borderRadius),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: isCurrentColor ? 1 : 0,
            child: Icon(
              Icons.done,
              size: _iconSize,
              color: useWhiteForeground(color) ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  onSave() async {
    // Map<String, dynamic> lastRecord = existingAlarms.last;
    // existingAlarms =
    //     await SqfliteDatabaseHelperClass.instance.retrieveBookmarkDetails();
    // int id = lastRecord[SqfliteDatabaseHelperClass.COL_BOOKMARK_ID];
    book = BookmarkModel(
        bookmarkPage: pageIndex.toString(),
        bookmarkSurah: para_num.toString(),
        bookmarkTime:
            "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}");
    bookmarkDb.insertBookmark(book);
    bookmarkDb.getBookmarks();
    print("...............saved: $pageIndex ");
    print("...............saved: $surah_name ");
    print("...............saved: $para_num ");
  }
}
