import 'package:flutter/material.dart';
import 'package:ui_project/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TestingSample extends StatefulWidget {
  const TestingSample({Key? key}) : super(key: key);

  @override
  State<TestingSample> createState() => _TestingSampleState();
}

class _TestingSampleState extends State<TestingSample> {
  // @override
  // void initState() {
  //   Services.getData();
  //   print('...........................................');
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebView(
      initialUrl: 'https://pub.dev/packages/webview_flutter/example',
          javascriptMode: JavascriptMode.unrestricted,
    ));
  }
}
