// import 'package:car_store/core/service/adMob.dart';
// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class AdProvider with ChangeNotifier {
//   bool isLoaded = false;
//   BannerAd? bannerAd;

//   AdProvider() {
//     _initializeAd();
//   }

//   void _initializeAd() {
//     bannerAd = BannerAd(
//       adUnitId: AdManger.appId,
//       size: AdSize.banner,
//       request: const AdRequest(),
//       listener: BannerAdListener(
//         onAdLoaded: (_) {
//           isLoaded = true;
//           notifyListeners();
//         },
//         onAdFailedToLoad: (ad, error) {
//           ad.dispose();
//           isLoaded = false;
//           notifyListeners();
//           print('Ad failed to load: $error');
//         },
//       ),
//     )..load();
//   }

//   @override
//   void dispose() {
//     bannerAd?.dispose();
//     super.dispose();
//   }
// }

import 'package:car_store/core/service/adMob.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdProvider with ChangeNotifier {
  BannerAd createBannerAd(
      {required Function(BannerAd) onAdLoaded,
      required Function(BannerAd, LoadAdError) onAdFailedToLoad}) {
    BannerAd bannerAd = BannerAd(
      adUnitId: AdManger.appId, // استبدل بـ ID الإعلان الخاص بك
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          onAdLoaded(ad as BannerAd);
          notifyListeners();
        },
        onAdFailedToLoad: (ad, error) {
          onAdFailedToLoad(ad as BannerAd, error);
          notifyListeners();
        },
      ),
    );
    bannerAd.load();
    return bannerAd;
  }
}
