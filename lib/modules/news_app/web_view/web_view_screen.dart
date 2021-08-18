import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {

  String url;

  WebViewScreen(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    backgroundColor: Colors.teal,
    iconTheme: IconThemeData(
      color: Colors.white
    ),
    title: Text('WebView',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
  ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
