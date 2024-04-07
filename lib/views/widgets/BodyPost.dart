import 'package:cs2_news/providers/interstitialAd_provider.dart';
import 'package:cs2_news/providers/post_provider.dart';
import 'package:cs2_news/views/widgets/BannerAd.dart';
import 'package:cs2_news/views/widgets/InterstitialAd.dart';
import 'package:cs2_news/views/widgets/load_image_network.dart';
import 'package:cs2_news/views/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:cs2_news/models/post_model.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BodyPost extends StatefulWidget {
  const BodyPost({super.key, required this.post});

  final Post post;

  @override
  State<BodyPost> createState() => _BodyPostState();
}

class _BodyPostState extends State<BodyPost> {
  bool isWebView = false;
  WebViewController controller = WebViewController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.post.link));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<PostProvider, InterstitialAdProvider>(
        builder: (context, provider, interstitialAdProvider, child) {
      return interstitialAdProvider.isLoading
          ? MyInterstitialAdWidget()
          : Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.black,
                iconTheme: const IconThemeData(
                  color: Colors.grey,
                  size: 25,
                ),
                actions: [
                  const Icon(
                    Icons.menu_book_rounded,
                  ),
                ],
              ),
              body: isWebView
                  ? WebViewWidget(controller: controller)
                  : provider.isLoading
                      ? const loading()
                      : SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyBannerAdWidget(),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  widget.post.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Spacer(),
                                  Text(
                                    widget.post.pubDate,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                color: Colors.grey[900],
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      loadImageNetwork(
                                        url: widget.post.imageUrl,
                                        width: double.infinity,
                                        height: 250,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        widget.post.contents.join('\n\n'),
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                isWebView = !isWebView;
                                              });

                                              interstitialAdProvider
                                                  .checkMoveTab();
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      Colors.blueGrey[900]!),
                                            ),
                                            child: const Text(
                                              'Read more',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
            );
    });
  }
}
