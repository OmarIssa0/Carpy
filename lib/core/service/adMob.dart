import 'package:flutter/foundation.dart';

class AdManger {
  static String get appId {
    if (kReleaseMode) {
      return "ca-app-pub-6429610413303878/1135911986";
    } else {
      return "ca-app-pub-3940256099942544/6300978111";
    }
  }
  // static String get appId => "ca-app-pub-3940256099942544/6300978111";
}
