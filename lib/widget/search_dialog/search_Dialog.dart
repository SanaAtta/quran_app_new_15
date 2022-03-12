import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:quran_app_new/colors/colors.dart';
import 'package:quran_app_new/screens/quran_screen/quran_screen.dart';

class SearchDialogWidget extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  String txtValue = "";
  int search_index = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: height * 0.07, left: width * 0.1, right: width * 0.1),
              child: Container(
                color: ColorsClass().color1,
                child: TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      fillColor: ColorsClass().light,
                      prefixIcon: Icon(
                        Icons.search,
                        color: ColorsClass().dartColor,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsClass().dartColor,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorsClass().dartColor))),
                  onChanged: (text) {
                    txtValue = text;
                    print("/////////$txtValue");

                    //setState(() {});
                  },
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Container(
              height: height * 0.05,
              width: width * 0.3,
              child: ElevatedButton(
                onPressed: () {
                  if (int.parse(searchController.text) > 609) {
                    Get.snackbar("Invalid Range", "Enter between 0 and 609",
                        backgroundColor: ColorsClass().color1,
                        snackPosition: SnackPosition.BOTTOM);
                  } else {
                    Get.to(
                        QuranPakScreen(int.parse(searchController.text), ''));
                  }

                  // if (searchController.text.toString() == "1") {
                  //   Get.to(QuranPakScreen(0, ""));
                  // } else if (searchController.text.toString() == "2") {
                  //   Get.to(QuranPakScreen(1, ""));
                  //   searchController.clear();
                  // } else if (searchController.text.toString() == "2") {
                  //   Get.to(QuranPakScreen(1, ""));
                  //   searchController.clear();
                  // }
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/dialog/b_selected.svg",
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Text(
                      "Go",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(ColorsClass().light),
                  shadowColor: MaterialStateProperty.all(ColorsClass().light),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  openDialog(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: height * 0.07, left: width * 0.1, right: width * 0.1),
              child: Container(
                color: ColorsClass().color1,
                child: TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      fillColor: ColorsClass().light,
                      prefixIcon: Icon(
                        Icons.search,
                        color: ColorsClass().dartColor,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsClass().dartColor,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorsClass().dartColor))),
                  onChanged: (text) {
                    txtValue = text;
                    print("/////////$txtValue");

                    //setState(() {});
                  },
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Container(
              height: height * 0.05,
              width: width * 0.3,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(QuranPakScreen(int.parse(searchController.text), ''));
                  // if (searchController.text.toString() == "1") {
                  //   Get.to(QuranPakScreen(0, ""));
                  // } else if (searchController.text.toString() == "2") {
                  //   Get.to(QuranPakScreen(1, ""));
                  //   searchController.clear();
                  // } else if (searchController.text.toString() == "2") {
                  //   Get.to(QuranPakScreen(1, ""));
                  //   searchController.clear();
                  // }
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/dialog/b_selected.svg",
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Text(
                      "Go",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(ColorsClass().light),
                  shadowColor: MaterialStateProperty.all(ColorsClass().light),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
