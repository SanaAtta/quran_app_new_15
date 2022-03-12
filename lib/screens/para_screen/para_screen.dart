import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app_new/colors/colors.dart';
import 'package:quran_app_new/model/para_model.dart';
import 'package:quran_app_new/screens/first_screen/first_screen.dart';
import 'package:quran_app_new/screens/quran_screen/quran_screen.dart';

class ParaScreen extends StatelessWidget {
  const ParaScreen({Key? key}) : super(key: key);

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
