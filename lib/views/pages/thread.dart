import 'package:cs2_news/providers/thread_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/thread_item.dart';

class ThreadPage extends StatefulWidget {
  const ThreadPage({super.key});

  @override
  State<ThreadPage> createState() => _ThreadPageState();
}

class _ThreadPageState extends State<ThreadPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThreadProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: provider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: provider.threads
                      .map((item) => ThreadItem(
                            thread: item,
                          ))
                      .toList(),
                ),
        );
      },
    );
  }
}
