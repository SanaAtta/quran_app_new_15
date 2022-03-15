import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quran_app_new/admob/ads.dart';
import 'package:quran_app_new/colors/colors.dart';
import 'package:quran_app_new/globals/globals.dart';
import 'package:quran_app_new/screens/dashboard/dashboard_screen.dart';
import 'package:quran_app_new/screens/surah_screen/surah_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // TODO: Add _interstitialAd
  InterstitialAd? interstitialAd;

  // TODO: Add _isInterstitialAdReady
  bool isloaded = false;
  bool isLoading = false;
  @override
  void initState() {
    _timer();
    getBookmarkIndex();
    getSurah();
    getRecentTime();
    super.initState();
    Ads.loadInterstitialAd();
  }

  getRecentTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    recentTime = prefs.getString('time')!;
    print(".........................time: $recentTime");
    setState(() {});
  }

  getSurah() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    surah_name = prefs.getString('surah')!;
    print(".........................surah: $surah_name");
    setState(() {});
  }

  getBookmarkIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    pageIndex = prefs.getInt("currentIndex")!;
    print(".........................bookmark: $pageIndex");
    setState(() {});
  }

  _timer() {
    Timer(Duration(seconds: 3), () {
      setState(() {
        isLoading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.14),
              child: Center(
                child: Column(
                  children: [
                    Container(
                        height: height * 0.025,
                        child:
                            SvgPicture.asset("assets/splash/learn_text.svg")),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                        height: height * 0.05,
                        child:
                            SvgPicture.asset("assets/splash/quran_text.svg")),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                        height: height * 0.65,
                        child: Image.asset("assets/splash/main.png")),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                isLoading == true
                    ? GestureDetector(
                        child: Center(
                            child: Padding(
                          padding: EdgeInsets.only(bottom: height * 0.06),
                          child: Image.asset("assets/splash/start.png"),
                        )),
                        onTap: () {
                          Ads.showInterstitialAd();
                          Get.to(DashboardScreen());
                        },
                      )
                    : Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: height * 0.068),
                          child: CircularProgressIndicator(
                            color: ColorsClass().dartColor,
                          ),
                        ),
                      )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: Dispose an InterstitialAd object
    // _interstitialAd?.dispose();
    super.dispose();
  }
}
