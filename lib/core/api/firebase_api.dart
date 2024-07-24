import 'package:car_store/features/splash/presentation/view/splash_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseApi {
  // create an instance of firebase massaging
  final _firebaseMassaging = FirebaseMessaging.instance;

  // function to initialize notifications
  Future<void> initNotifications() async {
    //request permission form user (will prompt users)
    await _firebaseMassaging.requestPermission();

    //fetch the FCM token for this device
    // final FCMToken = await _firebaseMassaging.getToken();

    // print the token (normally you would send this to your server)
    // print("Token : $FCMToken");
    initNotifications();
  }

  void handleMessage(RemoteMessage? message, BuildContext context) {
    if (message == null) return;

    Navigator.pushNamed(context, SplashView.routeName, arguments: message);
  }
}
