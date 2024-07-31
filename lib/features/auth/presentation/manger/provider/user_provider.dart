import 'package:car_store/features/auth/presentation/manger/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel? userModel;
  UserModel? get getUserModel {
    return userModel;
  }

  Future<UserModel?> fetchUserData() async {
    // if (userModel == null) {
    //   return null;
    // }
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user == null || user.isAnonymous == true) {
      return null;
    }
    var uid = user.uid;
    try {
      final userDoc =
          await FirebaseFirestore.instance.collection("users").doc(uid).get();
      final userDocMap = userDoc.data();
      userModel = UserModel(
        userId: userDoc.get("userId") ?? "",
        userName: userDoc.get("userName") ?? "",
        userEmail: userDoc.get("userEmail") ?? "",
        userPhone: userDoc.get("userPhone") ?? "",
        userWishList: userDocMap!.containsKey("userWishlist")
            ? userDoc.get("userWishlist")
            : [],
        userBookingList: userDocMap.containsKey("userBooking")
            ? userDoc.get("userBooking")
            : [],
        createAt: userDoc.get("createAt") ?? Timestamp.now(),
      );
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      rethrow;
    }
    return userModel;
  }
}





