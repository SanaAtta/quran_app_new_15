import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quran_app_new/screens/dashboard/dashboard_screen.dart';
import 'package:quran_app_new/screens/first_screen/first_screen.dart';
import 'package:quran_app_new/screens/splash/splash_screen.dart';
import 'package:wakelock/wakelock.dart';

import 'model/sound_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  // AdmobHelper.initialize();
  //AdmobHelper2.initialization();
  await Wakelock.enable();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      themeMode: ThemeMode.system,
      darkTheme: Themes.dark,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/dashboard', page: () => DashboardScreen()),
        GetPage(name: '/first', page: () => FirstScreen()),
      ],
    );
  }
}
