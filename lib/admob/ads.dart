import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'admob_helper.dart';

class Ads {
  int bannerAdRunTimes = 0;
  static AdmobHelper admobHelper = AdmobHelper();

  Widget showBannerAd(double width, double height) {
    print("aaaaaaaaaaaaaaaaa");
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      width: width,
      height: height,
      // color: Colors.red,
      child: AdWidget(
        ad: AdmobHelper().getBannerAd()..load(),
      ),
    );
  }

  static Future<void> showInterstitialAd() async {
    /*admobHelper.createInterstitialAd().then((value) =>
        admobHelper.showInterstitialAd());*/

    admobHelper.showInterstitialAd();
  }

  static Future<void> loadInterstitialAd() async {
    /*admobHelper.createInterstitialAd().then((value) =>
        admobHelper.showInterstitialAd());*/

    admobHelper.loadInterstitialAd();
  }
}
