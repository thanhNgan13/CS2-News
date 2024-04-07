import 'package:cs2_news/providers/interstitialAd_provider.dart';
import 'package:cs2_news/views/widgets/BannerAd.dart';
import 'package:cs2_news/views/widgets/InterstitialAd.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cs2_news/providers/post_provider.dart';
import '../widgets/MyPost.dart';
import '../widgets/loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<PostProvider, InterstitialAdProvider>(
      builder: (context, postProvider, interstitialAdProvider, child) {
        return interstitialAdProvider.isLoading
            ? MyInterstitialAdWidget()
            : Scaffold(
                backgroundColor: Colors.black,
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      postProvider.isLoading
                          ? const loading()
                          : Expanded(
                              child: SingleChildScrollView(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  itemCount: postProvider.posts.length,
                                  itemBuilder: (context, index) {
                                    var item = postProvider.posts[index];
                                    return MyPost(
                                      post: item,
                                    );
                                  },
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
