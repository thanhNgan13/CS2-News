import 'package:flutter/material.dart';

class RatingPage extends StatelessWidget {
  const RatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rating'),
        ),
        body: const Center(
          child: Text('Rating Page'),
        ),
      ),
    );
  }
}
