import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quran_app_new/colors/colors.dart';
import 'package:quran_app_new/globals/globals.dart';
import 'package:quran_app_new/model/quran_model.dart';
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
            return GestureDetector(
              child: Column(
                children: [
                  Container(
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
              ),
              onTap: () {
                imgPage = quran_pak_model_list;
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
                } else if (surahModelList[index].my_surah_index == 186) {
                  Get.to(QuranPakScreen(186, 10,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 207) {
                  Get.to(QuranPakScreen(207, 11,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 220) {
                  Get.to(QuranPakScreen(220, 11,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 234) {
                  Get.to(QuranPakScreen(234, 12,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 248) {
                  Get.to(QuranPakScreen(248, 13,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 254) {
                  Get.to(QuranPakScreen(254, 13,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 260) {
                  Get.to(QuranPakScreen(260, 13,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 266) {
                  Get.to(QuranPakScreen(266, 14,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 281) {
                  Get.to(QuranPakScreen(281, 15,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 292) {
                  Get.to(QuranPakScreen(292, 15,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 304) {
                  Get.to(QuranPakScreen(304, 16,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 311) {
                  Get.to(QuranPakScreen(311, 16,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 321) {
                  Get.to(QuranPakScreen(321, 17,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 330) {
                  Get.to(QuranPakScreen(330, 17,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 341) {
                  Get.to(QuranPakScreen(341, 18,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 349) {
                  Get.to(QuranPakScreen(349, 18,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 358) {
                  Get.to(QuranPakScreen(358, 18,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 365) {
                  Get.to(QuranPakScreen(365, 19,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 375) {
                  Get.to(QuranPakScreen(375, 19,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 384) {
                  Get.to(QuranPakScreen(384, 20,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 395) {
                  Get.to(QuranPakScreen(395, 20,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 403) {
                  Get.to(QuranPakScreen(403, 21,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 410) {
                  Get.to(QuranPakScreen(410, 21,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 414) {
                  Get.to(QuranPakScreen(414, 21,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 417) {
                  Get.to(QuranPakScreen(417, 21,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 427) {
                  Get.to(QuranPakScreen(427, 22,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 433) {
                  Get.to(QuranPakScreen(433, 22,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 439) {
                  Get.to(QuranPakScreen(439, 22,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 444) {
                  Get.to(QuranPakScreen(444, 23,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 451) {
                  Get.to(QuranPakScreen(451, 23,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 457) {
                  Get.to(QuranPakScreen(457, 23,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 466) {
                  Get.to(QuranPakScreen(466, 24,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 476) {
                  Get.to(QuranPakScreen(476, 24,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 482) {
                  Get.to(QuranPakScreen(482, 25,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 488) {
                  Get.to(QuranPakScreen(488, 25,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 494) {
                  Get.to(QuranPakScreen(494, 25,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 497) {
                  Get.to(QuranPakScreen(497, 25,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 501) {
                  Get.to(QuranPakScreen(501, 26,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 505) {
                  Get.to(QuranPakScreen(505, 26,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 510) {
                  Get.to(QuranPakScreen(510, 26,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 514) {
                  Get.to(QuranPakScreen(514, 26,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 517) {
                  Get.to(QuranPakScreen(517, 26,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 519) {
                  Get.to(QuranPakScreen(519, 26,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 522) {
                  Get.to(QuranPakScreen(522, 27,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 525) {
                  Get.to(QuranPakScreen(525, 27,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 527) {
                  Get.to(QuranPakScreen(527, 27,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 530) {
                  Get.to(QuranPakScreen(530, 27,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 533) {
                  Get.to(QuranPakScreen(533, 27,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 536) {
                  Get.to(QuranPakScreen(536, 27,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 541) {
                  Get.to(QuranPakScreen(541, 28,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 544) {
                  Get.to(QuranPakScreen(544, 28,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 548) {
                  Get.to(QuranPakScreen(548, 28,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 550) {
                  Get.to(QuranPakScreen(550, 28,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 552) {
                  Get.to(QuranPakScreen(552, 28,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 553) {
                  Get.to(QuranPakScreen(553, 28,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 555) {
                  Get.to(QuranPakScreen(555, 28,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 557) {
                  Get.to(QuranPakScreen(557, 28,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 559) {
                  Get.to(QuranPakScreen(559, 28,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 561) {
                  Get.to(QuranPakScreen(561, 29,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 563) {
                  Get.to(QuranPakScreen(563, 29,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 566) {
                  Get.to(QuranPakScreen(566, 29,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 568) {
                  Get.to(QuranPakScreen(568, 29,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 570) {
                  Get.to(QuranPakScreen(570, 29,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 572) {
                  Get.to(QuranPakScreen(572, 29,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 575) {
                  Get.to(QuranPakScreen(575, 29,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 577) {
                  Get.to(QuranPakScreen(577, 29,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 579) {
                  Get.to(QuranPakScreen(579, 29,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 581) {
                  Get.to(QuranPakScreen(581, 29,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 583) {
                  Get.to(QuranPakScreen(583, 29,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 585) {
                  Get.to(QuranPakScreen(585, 30,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 586) {
                  Get.to(QuranPakScreen(586, 30,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 588) {
                  Get.to(QuranPakScreen(588, 30,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 589) {
                  Get.to(QuranPakScreen(589, 30,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 590) {
                  Get.to(QuranPakScreen(590, 30,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 591) {
                  Get.to(QuranPakScreen(591, 30,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 593) {
                  Get.to(QuranPakScreen(593, 30,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 594) {
                  Get.to(QuranPakScreen(594, 30,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 595) {
                  Get.to(QuranPakScreen(595, 30,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 596) {
                  Get.to(QuranPakScreen(596, 30,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 597) {
                  Get.to(QuranPakScreen(597, 30,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 599) {
                  Get.to(QuranPakScreen(599, 30,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 600) {
                  Get.to(QuranPakScreen(600, 30,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 601) {
                  Get.to(QuranPakScreen(601, 30,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 602) {
                  Get.to(QuranPakScreen(602, 30,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 603) {
                  Get.to(QuranPakScreen(603, 30,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 604) {
                  Get.to(QuranPakScreen(604, 30,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 605) {
                  Get.to(QuranPakScreen(605, 30,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 606) {
                  Get.to(QuranPakScreen(606, 30,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 607) {
                  Get.to(QuranPakScreen(607, 30,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 608) {
                  Get.to(QuranPakScreen(608, 30,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                } else if (surahModelList[index].my_surah_index == 609) {
                  Get.to(QuranPakScreen(609, 30,
                      surah_name:
                          surahModelList[index].arabic_name.toString()));
                }
              },
            );
          }),
    );
  }
}
