import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quran_app_new/colors/colors.dart';
import 'package:quran_app_new/model/surah_model.dart';
import 'package:quran_app_new/screens/quran_screen/quran_screen.dart';

var surah_name = "Al-Fatihah";

class SurahScreen extends StatelessWidget {
  const SurahScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.01),
      child: ListView.builder(
          itemCount: surahModelList.length,
          itemBuilder: (_, index) {
            return Column(
              children: [
                GestureDetector(
                  child: Container(
                    height: height * 0.056,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.04, right: width * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${index + 1}.",
                                style: TextStyle(
                                    color: ColorsClass().dartColor,
                                    fontSize: 18,
                                    fontFamily: 'Roboto',
                                    package: "awesome_package"),
                              ),
                              Text(
                                "${surahModelList[index].arabic_name}",
                                style: TextStyle(
                                    color: ColorsClass().dartColor,
                                    fontSize: 18,
                                    fontFamily: 'Roboto',
                                    package: "awesome_package"),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "${surahModelList[index].eng_name}",
                                style: TextStyle(
                                    color: ColorsClass().dartColor,
                                    fontSize: 18,
                                    fontFamily:
                                        'Al Qalam Quran Majeed Web Regular',
                                    package: 'awesome_package'),
                              ),
                              Text(
                                "${surahModelList[index].arabic_num}",
                                style: TextStyle(
                                    color: ColorsClass().dartColor,
                                    fontSize: 18,
                                    fontFamily:
                                        'Al Qalam Quran Majeed Web Regular',
                                    package: 'awesome_package'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    print(
                        "..surah-name  .. ${surah_name = surahModelList[index].eng_name.toString()}");
                    if (surahModelList[index].my_surah_index == 0) {
                      Get.to(QuranPakScreen(0, 1,
                          surah_name:
                              surahModelList[index].arabic_name.toString()));
                    } else if (surahModelList[index].my_surah_index == 1) {
                      Get.to(QuranPakScreen(1, 1,
                          surah_name:
                              surahModelList[index].arabic_name.toString()));
                    } else if (surahModelList[index].my_surah_index == 49) {
                      Get.to(QuranPakScreen(49, 3,
                          surah_name:
                              surahModelList[index].arabic_name.toString()));
                    } else if (surahModelList[index].my_surah_index == 76) {
                      Get.to(QuranPakScreen(76, 4,
                          surah_name:
                              surahModelList[index].arabic_name.toString()));
                    } else if (surahModelList[index].my_surah_index == 105) {
                      Get.to(QuranPakScreen(105, 6,
                          surah_name:
                              surahModelList[index].arabic_name.toString()));
                    } else if (surahModelList[index].my_surah_index == 127) {
                      Get.to(QuranPakScreen(127, 7,
                          surah_name:
                              surahModelList[index].arabic_name.toString()));
                    } else if (surahModelList[index].my_surah_index == 150) {
                      Get.to(QuranPakScreen(150, 8,
                          surah_name:
                              surahModelList[index].arabic_name.toString()));
                    } else if (surahModelList[index].my_surah_index == 176) {
                      Get.to(QuranPakScreen(176, 9,
                          surah_name:
                              surahModelList[index].arabic_name.toString()));
                    }
                  },
                ),
                Stack(
                  children: [
                    SvgPicture.asset(
                      "assets/main/verses.svg",
                      height: height * 0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.028, left: width * 0.065),
                      child: Text(
                        "${surahModelList[index].verses.toString()}",
                        style: TextStyle(
                            color: ColorsClass().color1, fontSize: 10),
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  "assets/main/base_line.svg",
                  width: width * 0.93,
                ),
                // Divider(
                //   color: ColorsClass().light,
                //   indent: width * 0.05,
                //   endIndent: width * 0.05,
                //   thickness: 1,
                // )
              ],
            );
          }),
    );
  }
}
