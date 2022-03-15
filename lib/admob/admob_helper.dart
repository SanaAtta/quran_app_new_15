import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobHelper {
  String bannerId = 'ca-app-pub-3940256099942544/6300978111';
  String interstitalId = 'ca-app-pub-3940256099942544/1033173712';

  static initialize() {
    var adRequest = MobileAds.instance;
    adRequest.updateRequestConfiguration(RequestConfiguration(
        testDeviceIds: ["407BB805436619133B0E5D3B32728966"]));
    adRequest.initialize();
  }

  BannerAd? bannerAd;
  InterstitialAd? _interstitialAd;
  int num_of_attempts_loaded = 0;
  static int num_of_attempts_loaded_for_banner = 0;

  BannerAd getBannerAd() {
    /*if(request == "manageLocation"){
      print("manage location banner ad call value is: ${Globals.manageLocationBannerAdCall}");
      if(Globals.manageLocationBannerAdCall == 2){
        print("manage location banner ad loaded");
        bannerAd = BannerAd(size: AdSize.fullBanner, adUnitId: 'ca-app-pub-3940256099942544/6300978111',
            listener: BannerAdListener(
                onAdClosed: (Ad ad){
                  print("Banner Ad closed");
                },
                onAdLoaded: (Ad ad){
                  print("Banner Ad Loaded");
                },
                onAdOpened: (Ad ad){
                  print("Banner Ad Opened");
                }
            ), request: AdRequest());
      }
    }else{*/
    return BannerAd(
      size: AdSize.fullBanner,
      adUnitId: bannerId,
      listener: BannerAdListener(onAdClosed: (Ad ad) {
        print("Banner Ad closed");
      }, onAdLoaded: (Ad ad) {
        bannerAd = ad as BannerAd;
        print("Banner Ad Loaded");
      }, onAdOpened: (Ad ad) {
        print("Banner Ad Opened");
      }, onAdFailedToLoad: (ad, error) {
        print("Ad failed with error: $error");
        ad.dispose();
      }),
      request: AdRequest(),
    );
    // }
    // return bannerAd;
  }

// TODO: Add _isInterstitialAdReady
  bool _isInterstitialAdReady = false;
  /*Future<void> createInterstitialAd() async{
    InterstitialAd.load(adUnitId: 'ca-app-pub-3940256099942544/1033173712',
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad){
              _interstitialAd = ad;
              num_of_attempts_loaded = 0;
              showInterstitialAd();
            },
            onAdFailedToLoad: (LoadAdError error){
              num_of_attempts_loaded++;
              _interstitialAd = null;

              if(num_of_attempts_loaded <= 2){
                createInterstitialAd();
              }
            }));
  }*/

  void showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        loadInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        loadInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;

    // if (_interstitialAd == null) {
    //   return;
    // }
    //
    // _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
    //     onAdShowedFullScreenContent: (InterstitialAd ad) {
    //   print("Interstitial Ad is showing");
    // }, onAdDismissedFullScreenContent: (InterstitialAd ad) {
    //   print("Interstitial Ad dismissed");
    //   loadInterstitialAd();
    // }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
    //   print("Interstitial Ad $ad is failed due to error: $error");
    //   //createInterstitialAd();
    // });
    // _interstitialAd?.show();
    // print("showInterstitialAd");
    //_interstitialAd = null;
  }

  // TODO: Implement _loadInterstitialAd()
  void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: interstitalId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          print("loadInterstitialAd");
          _interstitialAd!.setImmersiveMode(true);

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              //_moveToHome();
              loadInterstitialAd();
            },
          );

          _isInterstitialAdReady = true;
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
          _isInterstitialAdReady = false;
          _interstitialAd = null;
        },
      ),
    );
    /*static Widget showNativeAd(double width, double height){
    final _nativeAdController = NativeAdmobController();
    return Container(
      width: width,
      height: height,
      child: NativeAdmob(
        adUnitID: 'ca-app-pub-3940256099942544/2247696110',
        controller: _nativeAdController,
        type: NativeAdmobType.full,
        loading: Center(child: CircularProgressIndicator(),),
        error: Text("Problem loading ad"),
        options: NativeAdmobOptions(
          showMediaContent: true
        ),
      ),
    );
  }*/
  }
}

// String bannerIdTest = '/6499/example/banner';
// //'ca-app-pub-3940256099942544/6300978111';
//
// String interstitalIdTest = '/6499/example/interstitial';
// //'ca-app-pub-3940256099942544/1033173712';
// String nativeAdIdTest = '/6499/example/native';
// //'ca-app-pub-3940256099942544/2247696110';
class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/1033173712";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/4411468910";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/5224354917";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1712485313";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}
