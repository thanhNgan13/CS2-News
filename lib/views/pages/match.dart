import 'package:cs2_news/providers/interstitialAd_provider.dart';
import 'package:cs2_news/providers/match_provider.dart';
import 'package:cs2_news/views/widgets/InterstitialAd.dart';
import 'package:cs2_news/views/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cs2_news/views/widgets/match_section.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({super.key});

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<MatchProvider, InterstitialAdProvider>(
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
                      itemCount: postProvider.matchSections.length,
                      itemBuilder: (context, index) {
                        var item = postProvider.matchSections[index];
                        return MatchSectionWidget(
                          time: item.time,
                          matches: item.matches,
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
