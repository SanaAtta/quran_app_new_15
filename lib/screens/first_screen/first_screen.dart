import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quran_app_new/colors/colors.dart';
import 'package:quran_app_new/screens/quran_screen/quran_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Timer(
        Duration(seconds: 6),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => QuranPakScreen(0, 1))));
    return WillPopScope(
        child: Scaffold(
          backgroundColor: ColorsClass().color1,
          body: Container(
            height: height,
            width: width,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.1,
                      right: width * 0.1,
                      top: height * 0.05),
                  child: Container(
                      child: Image.asset("assets/first/first_anim.gif")),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.1,
                      right: width * 0.1,
                      top: height * 0.05),
                  child: Container(
                      height: height * 0.25,
                      width: width * 0.35,
                      child: Image.asset("assets/first/img.png")),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.12,
                    right: width * 0.1,
                  ),
                  child: Container(
                      height: height * 0.25,
                      width: width * 0.6,
                      child: Image.asset("assets/first/first_quran.png")),
                ),
              ],
            ),
          ),
        ),
        onWillPop: () async => false);
  }
}
