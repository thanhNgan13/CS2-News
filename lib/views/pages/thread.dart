import 'package:cs2_news/providers/thread_provider.dart';
import 'package:cs2_news/views/widgets/loading.dart';
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
              ? const loading()
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: provider.threads.length,
                      itemBuilder: (context, index) {
                        var item = provider.threads[index];
                        return ThreadItem(
                          thread: item,
                        );
                      },
                    ),
                  ),
                ),
        );
      },
    );
  }
}
