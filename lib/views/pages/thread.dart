import 'package:cs2_news/providers/interstitialAd_provider.dart';
import 'package:cs2_news/providers/match_provider.dart';
import 'package:cs2_news/providers/thread_provider.dart';
import 'package:cs2_news/views/widgets/InterstitialAd.dart';
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
    return Consumer2<ThreadProvider, InterstitialAdProvider>(
      builder: (context, postProvider, interstitialAdProvider, child) {
        return interstitialAdProvider.isLoading
            ? MyInterstitialAdWidget()
            : Scaffold(
          backgroundColor: Colors.black,
          body: postProvider.isLoading
              ? const loading()
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: postProvider.threads.length,
                      itemBuilder: (context, index) {
                        var item = postProvider.threads[index];
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
