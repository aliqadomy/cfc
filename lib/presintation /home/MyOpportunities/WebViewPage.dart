import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  static const routename = '/WebViewPagew';

  final String url;

  WebViewPage({required this.url});

  @override
  Widget build(BuildContext context) {
    print("iiiiiii $url");
    return Scaffold(
      appBar: AppBar(

      ),
      body: WebViewWidget(
        controller: WebViewController()
          ..loadRequest(Uri.parse(url))
          ..setJavaScriptMode(JavaScriptMode.unrestricted),
      ),
    );
  }
}