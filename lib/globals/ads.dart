import 'package:firebase_admob/firebase_admob.dart';

MobileAdTargetingInfo targetingInfo = new MobileAdTargetingInfo(
  keywords: <String>['Products', 'Items', 'Technology'],
  contentUrl: 'https://flutter.io',
  birthday: new DateTime.now(),
  childDirected: false,
  designedForFamilies: false,
  gender: MobileAdGender.unknown, // or MobileAdGender.female, MobileAdGender.unknown
  testDevices: <String>[], // Android emulators are considered test devices
);

// This is exclusively for Ads!
BannerAd myBanner = new BannerAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: BannerAd.testAdUnitId,
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);

InterstitialAd myInterstitial = new InterstitialAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: InterstitialAd.testAdUnitId,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("InterstitialAd event is $event");
  },
);