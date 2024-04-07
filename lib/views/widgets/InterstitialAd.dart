import 'dart:io';

import 'package:cs2_news/providers/interstitialAd_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class MyInterstitialAdWidget extends StatefulWidget {
  final String adUnitId = Platform.isAndroid
      ? 'ca-app-pub-4623668474328138/6552998075'
      : 'ca-app-pub-4623668474328138/3682489823';

  MyInterstitialAdWidget({super.key});

  @override
  State<MyInterstitialAdWidget> createState() => _MyInterstitialAdWidget();
}

class _MyInterstitialAdWidget extends State<MyInterstitialAdWidget> {
  InterstitialAd? _interstitialAd;
  bool _isAdLoaded = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: _isAdLoaded ? AdWidgets(interstitialAd: _interstitialAd, onAdClosed: _adClosed) : SizedBox(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  void _loadAd() {
    InterstitialAd.load(
      adUnitId: widget.adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isAdLoaded = true;
          setState(() {});
        },
        onAdFailedToLoad: (error) {
          _isAdLoaded = false;
          dispose();
        },
      ),
    );
  }

  void _adClosed() {
    // This method will be called when the interstitial ad is closed.
    // Call reset function of InterstitialAdProvider here.
    Provider.of<InterstitialAdProvider>(context, listen: false).reset();
  }
}

class AdWidgets extends StatefulWidget {
  const AdWidgets({super.key, required this.interstitialAd, required this.onAdClosed});

  final InterstitialAd? interstitialAd;
  final VoidCallback onAdClosed;

  @override
  State<AdWidgets> createState() => _AdWidgetsState();
}

class _AdWidgetsState extends State<AdWidgets> {
  @override
  void initState() {
    super.initState();
    widget.interstitialAd?.show();
    widget.interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        // This callback will be called when the interstitial ad is dismissed.
        widget.onAdClosed();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
