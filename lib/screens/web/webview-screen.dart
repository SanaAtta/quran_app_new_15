import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPrivacyScreen extends StatefulWidget {
  const WebViewPrivacyScreen({Key? key}) : super(key: key);

  @override
  _WebViewPrivacyScreenState createState() => _WebViewPrivacyScreenState();
}

class _WebViewPrivacyScreenState extends State<WebViewPrivacyScreen> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  num _stackToView = 1;

  void _handleLoad(String value) {
    setState(() {
      _stackToView = 0;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(top: 30),
            child: WebView(
              initialUrl: "https://sites.google.com/view/eyesoltech/home",
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewContrller) {
                _controller.complete(webViewContrller);
              },
            )));
  }
}
