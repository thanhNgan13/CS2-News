import 'package:flutter/material.dart';

class loadImageNetwork extends StatelessWidget {
  const loadImageNetwork({
    super.key,
    required this.url,
    required this.width,
    required this.height,
  });

  final String url;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    if (url.contains('assets/images/placeholder.png')) {
      return Image.asset(
        url,
        width: width,
        height: height,
      );
    } else {
      return Image.network(
        url,
        width: width,
        height: height,
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          return Image.asset(
            'assets/images/placeholder.png',
            width: width,
            height: height,
          );
        },
      );
    }
  }
}
