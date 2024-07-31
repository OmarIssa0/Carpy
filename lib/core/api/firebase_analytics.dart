// import 'package:flutter/foundation.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';

// class AnalyticsService extends ChangeNotifier {
//   final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

//   // تحديد نوع التطبيق: 'user' أو 'vendor'
//   final String appType;

//   AnalyticsService(this.appType);

//   Future<void> logEvent({
//     required String eventName,
//     Map<String, Object>?
//         parameters, // استخدام Map<String, Object> بدلاً من Map<String, dynamic>
//   }) async {
//     final Map<String, Object> updatedParameters = {
//       'app_type': appType,
//       if (parameters != null) ...parameters,
//     };

//     await _analytics.logEvent(
//       name: eventName,
//       parameters: updatedParameters,
//     );
//   }
// }

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';

class AnalyticsService extends ChangeNotifier {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  final String appType;

  AnalyticsService(this.appType);

  Future<Map<String, Object>> _getDeviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();
    final deviceData = <String, Object>{};

    try {
      if (kIsWeb) {
        deviceData['platform'] = 'web';
      } else {
        if (defaultTargetPlatform == TargetPlatform.android) {
          final androidInfo = await deviceInfo.androidInfo;
          deviceData['platform'] = 'android';
          deviceData['model'] = androidInfo.model ?? 'unknown';
          deviceData['version'] = androidInfo.version.release ?? 'unknown';
        } else if (defaultTargetPlatform == TargetPlatform.iOS) {
          final iosInfo = await deviceInfo.iosInfo;
          deviceData['platform'] = 'ios';
          deviceData['model'] = iosInfo.model ?? 'unknown';
          deviceData['version'] = iosInfo.systemVersion ?? 'unknown';
        }
      }
    } catch (e) {
      // في حالة حدوث أي استثناء، يمكنك تسجيل الاستثناء أو التعامل معه بشكل ملائم
      log('Failed to get device info: $e');
    }

    return deviceData;
  }

  Future<String> _getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  // Future<void> logEvent({
  //   required String eventName,
  //   Map<String, Object>? parameters,
  // }) async {
  //   final appVersion = await _getAppVersion();
  //   final deviceInfo = await _getDeviceInfo();

  //   final Map<String, Object> updatedParameters = {
  //     'app_type': appType,
  //     'app_version': appVersion,
  //     ...deviceInfo,
  //     if (parameters != null) ...parameters,
  //   };

  //   await _analytics.logEvent(
  //     name: eventName,
  //     parameters: updatedParameters,
  //   );
  // }
  Future<void> logEvent({
    required String eventName,
    Map<String, Object>? parameters,
  }) async {
    try {
      final appVersion = await _getAppVersion();
      final deviceInfo = await _getDeviceInfo();

      final Map<String, Object> updatedParameters = {
        'app_type': appType,
        'app_version': appVersion,
        ...deviceInfo,
        if (parameters != null) ...parameters,
      };

      await _analytics.logEvent(
        name: eventName,
        parameters: updatedParameters,
      );

      log('Event $eventName logged with parameters: $updatedParameters');
    } catch (e) {
      log('Failed to log event: $e');
    }
  }
}
