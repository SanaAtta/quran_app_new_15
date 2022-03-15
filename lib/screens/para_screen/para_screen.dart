import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app_new/admob/ads.dart';
import 'package:quran_app_new/colors/colors.dart';
import 'package:quran_app_new/controller/mainController.dart';
import 'package:quran_app_new/globals/globals.dart';
import 'package:quran_app_new/model/para_model.dart';
import 'package:quran_app_new/model/quran_model.dart';
import 'package:quran_app_new/screens/first_screen/first_screen.dart';
import 'package:quran_app_new/screens/quran_screen/quran_screen.dart';

class ParaScreen extends StatelessWidget {
  MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.01),
      child: ListView.builder(
          itemCount: paraModelList.length,
          itemBuilder: (_, index) {
            return Column(
              children: [
                GestureDetector(
                  child: Container(
                    height: height * 0.05,
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
                                "${paraModelList[index].para_title_eng}",
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
                                "${paraModelList[index].para_title}",
                                style: TextStyle(
                                    color: ColorsClass().dartColor,
                                    fontSize: 18,
                                    fontFamily:
                                        'Al Qalam Quran Majeed Web Regular',
                                    package: 'awesome_package'),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "${paraModelList[index].arabic_num}",
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
                    mainController.paraIncrement();
                    if (mainController.paraCount.value == 4)
                      Ads.showInterstitialAd();
                    print(
                        ".......count valueee${mainController.paraCount.value}");

                    imgPage = quran_pak_model_list;
                    if (paraModelList[index].para_index == 0) {
                      Get.to(FirstScreen());
                    } else if (paraModelList[index].para_index == 21) {
                      Get.to(QuranPakScreen(21, 2));
                    } else if (paraModelList[index].para_index == 41) {
                      Get.to(QuranPakScreen(41, 3));
                    } else if (paraModelList[index].para_index == 61) {
                      Get.to(QuranPakScreen(61, 4));
                    } else if (paraModelList[index].para_index == 81) {
                      Get.to(QuranPakScreen(81, 5));
                    } else if (paraModelList[index].para_index == 101) {
                      Get.to(QuranPakScreen(101, 6));
                    } else if (paraModelList[index].para_index == 121) {
                      Get.to(QuranPakScreen(121, 7));
                    } else if (paraModelList[index].para_index == 141) {
                      Get.to(QuranPakScreen(141, 8));
                    } else if (paraModelList[index].para_index == 161) {
                      Get.to(QuranPakScreen(161, 9));
                    } else if (paraModelList[index].para_index == 181) {
                      Get.to(QuranPakScreen(181, 10));
                    } else if (paraModelList[index].para_index == 201) {
                      Get.to(QuranPakScreen(201, 11));
                    } else if (paraModelList[index].para_index == 221) {
                      Get.to(QuranPakScreen(221, 12));
                    } else if (paraModelList[index].para_index == 241) {
                      Get.to(QuranPakScreen(241, 13));
                    } else if (paraModelList[index].para_index == 261) {
                      Get.to(QuranPakScreen(261, 14));
                    } else if (paraModelList[index].para_index == 281) {
                      Get.to(QuranPakScreen(281, 15));
                    } else if (paraModelList[index].para_index == 301) {
                      Get.to(QuranPakScreen(301, 16));
                    } else if (paraModelList[index].para_index == 321) {
                      Get.to(QuranPakScreen(321, 17));
                    } else if (paraModelList[index].para_index == 341) {
                      Get.to(QuranPakScreen(341, 18));
                    } else if (paraModelList[index].para_index == 361) {
                      Get.to(QuranPakScreen(361, 19));
                    } else if (paraModelList[index].para_index == 381) {
                      Get.to(QuranPakScreen(381, 20));
                    } else if (paraModelList[index].para_index == 401) {
                      Get.to(QuranPakScreen(401, 21));
                    } else if (paraModelList[index].para_index == 421) {
                      Get.to(QuranPakScreen(421, 22));
                    } else if (paraModelList[index].para_index == 441) {
                      Get.to(QuranPakScreen(441, 23));
                    } else if (paraModelList[index].para_index == 461) {
                      Get.to(QuranPakScreen(461, 24));
                    } else if (paraModelList[index].para_index == 481) {
                      Get.to(QuranPakScreen(481, 25));
                    } else if (paraModelList[index].para_index == 501) {
                      Get.to(QuranPakScreen(501, 26));
                    } else if (paraModelList[index].para_index == 521) {
                      Get.to(QuranPakScreen(521, 27));
                    } else if (paraModelList[index].para_index == 541) {
                      Get.to(QuranPakScreen(541, 28));
                    } else if (paraModelList[index].para_index == 561) {
                      Get.to(QuranPakScreen(561, 29));
                    } else if (paraModelList[index].para_index == 585) {
                      Get.to(QuranPakScreen(585, 30));
                    }
                  },
                ),
                Divider(
                  color: ColorsClass().light,
                  indent: width * 0.05,
                  endIndent: width * 0.05,
                  thickness: 1,
                )
              ],
            );
          }),
    );
  }
}
