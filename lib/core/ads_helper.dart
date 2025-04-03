import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  static String? get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4137919994051588/2215131610';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-4137919994051588/3112985162';
    } else {
      throw UnsupportedError('Unsupported platform for banner ads');
    }
  }

  static final BannerAdListener bannerListener = BannerAdListener(
    onAdLoaded: (ad) => debugPrint('Ad Loaded'),
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      debugPrint('Ad failed to load $error');
    },
    onAdClosed: (ad) => debugPrint('Ad closed'),
  );
}