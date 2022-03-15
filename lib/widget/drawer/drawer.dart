import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:quran_app_new/colors/colors.dart';
import 'package:quran_app_new/screens/web/webview-screen.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  PackageInfo packageInfo =
      PackageInfo(buildNumber: '', version: '', appName: '', packageName: '');
  String text =
      "Hey I found an smart music player app\nCheckout this link\nhttps://play.google.com/store/apps/details?id=";
  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      packageInfo = info;
    });
  }

  String _url = "https://sites.google.com/view/eyesoltech/home";
  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url + packageInfo.packageName)
      : throw 'Could not launch ${_url}';

  @override
  void initState() {
    _initPackageInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Drawer(
      elevation: 0,
      backgroundColor: ColorsClass().color1,
      child: Column(
        children: [
          Container(
            width: width,
            height: height * 0.3,
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.11),
              child: Center(child: Image.asset("assets/first/first_quran.png")),
            ),
          ),
          SizedBox(
            height: height * 0.1,
          ),
          // ListTile(
          //   leading: SvgPicture.asset("assets/drawer/remove_ad.svg"),
          //   title: Text(
          //     "Remove Ads",
          //     style: TextStyle(
          //         color: ColorsClass().dartColor,
          //         fontSize: 16,
          //         fontFamily: 'Al Qalam Quran Majeed Web Regular',
          //         package: 'awesome_package'),
          //   ),
          //   onTap: () {
          //     // Get.to(Main_Screen(
          //     //   my_index: pageIndex,
          //     // ));
          //   },
          // ),
          ListTile(
            leading: SvgPicture.asset("assets/drawer/share.svg"),
            title: Text(
              "Share App",
              style: TextStyle(
                  color: ColorsClass().dartColor,
                  fontSize: 16,
                  fontFamily: 'Al Qalam Quran Majeed Web Regular',
                  package: 'awesome_package'),
            ),
            onTap: () {
              _onShare(context);
            },
          ),
          ListTile(
            leading: SvgPicture.asset("assets/drawer/feedback.svg"),
            title: GestureDetector(
              child: Text(
                "Feedback",
                style: TextStyle(
                    color: ColorsClass().dartColor,
                    fontSize: 16,
                    fontFamily: 'Al Qalam Quran Majeed Web Regular',
                    package: 'awesome_package'),
              ),
              onTap: () {
                //Get.to(QuranInfoScreen());
              },
            ),
          ),
          ListTile(
              leading: SvgPicture.asset("assets/drawer/privacy.svg"),
              title: Text(
                "Privacy Policy",
                style: TextStyle(
                    color: ColorsClass().dartColor,
                    fontSize: 16,
                    fontFamily: 'Al Qalam Quran Majeed Web Regular',
                    package: 'awesome_package'),
              ),
              onTap: () {
                Get.to(WebViewPrivacyScreen());
              }),
          ListTile(
              leading: SvgPicture.asset("assets/drawer/more.svg"),
              title: Text(
                "More Apps",
                style: TextStyle(
                    color: ColorsClass().dartColor,
                    fontSize: 16,
                    fontFamily: 'Al Qalam Quran Majeed Web Regular',
                    package: 'awesome_package'),
              ),
              onTap: () {
                _launchURL();
              }),
        ],
      ),
    );
  }

  //////////////////// sharing App link to social media//////////////
  _onShare(BuildContext context) async {
    final RenderBox box = context.findRenderObject() as RenderBox;
    await Share.share(text + packageInfo.packageName,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  _onShareWithEmptyOrigin(BuildContext context) async {
    await Share.share("text");
  }
}
