import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class BodyThread extends StatefulWidget {
  const BodyThread({super.key, required this.link});

  final String link;

  @override
  State<BodyThread> createState() => _BodyThreadState();
}

class _BodyThreadState extends State<BodyThread> {
  WebViewController controller = WebViewController();

  @override
  void initState() {
    super.initState();
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.link));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.grey,
          size: 25,
        ),
        actions: const [
          Icon(
            Icons.menu_book_rounded,
          ),
        ]
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
