import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/widgets/alert_dialog.dart';
import 'package:car_store/features/favorite/presentation/view_model/model/favorite_model.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

class FavoriteProvider with ChangeNotifier {
  final Map<String, WishlistModel> _wishlistItems = {};

  Map<String, WishlistModel> get getWishlistItem {
    return _wishlistItems;
  }

  //check id product
  bool isProductInWishlist({required String productId}) {
    return _wishlistItems.containsKey(productId);
  }

// firebase
  final usersDB = FirebaseFirestore.instance.collection("users");
  final _auth = FirebaseAuth.instance;
  Future<void> addToWishlistFirebase({
    required String productId,
    required BuildContext context,
  }) async {
    final User? user = _auth.currentUser;
    if (user == null) {
      AlertDialogMethods.showError(
        context: context,
        subtitle: "User not found".tr(context),
        titleBottom: "Ok",
        lottileAnimation: Assets.imagesErrorMas,
        function: () {
          Navigator.of(context).pop();
        },
      );
      return;
    }

    final uid = user.uid;
    final wishlistId = const Uuid().v4();

    try {
      usersDB.doc(uid).update({
        "userWishlist": FieldValue.arrayUnion([
          {
            "wishlistId": wishlistId,
            "productId": productId,
          }
        ])
      });
      // await fetchWishlist();
      Fluttertoast.showToast(
          msg: "Item has been added to wishlist".tr(context));
    } catch (e) {}
  }

  Future<void> fetchWishlist() async {
    User? user = _auth.currentUser;
    if (user == null) {
      // log("the function has been called and the user is null");
      _wishlistItems.clear();
      return;
    }
    try {
      final userDoc = await usersDB.doc(user.uid).get();
      final data = userDoc.data();
      if (data == null || !data.containsKey("userWishlist")) {
        return;
      }
      final leng = userDoc.get("userWishlist").length;
      for (int index = 0; index < leng; index++) {
        _wishlistItems.putIfAbsent(
          userDoc.get('userWishlist')[index]['productId'],
          () => WishlistModel(
            id: userDoc.get('userWishlist')[index]['wishlistId'],
            productId: userDoc.get('userWishlist')[index]['productId'],
          ),
        );
      }
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  // Future<void> clearCartFromFirebase() async {
  //   User? user = _auth.currentUser;

  //   try {
  //     await usersDB.doc(user!.uid).update({
  //       "userWishlist": [],
  //     });
  //     _wishlistItems.clear();
  //   } catch (e) {
  //     rethrow;
  //   }
  //   notifyListeners();
  // }

  Future<void> removeWishlistItemFromFirebase({
    required String wishlistId,
    required String productId,
  }) async {
    User? user = _auth.currentUser;

    try {
      await usersDB.doc(user!.uid).update({
        "userWishlist": FieldValue.arrayRemove([
          {
            "wishlistId": wishlistId,
            "productId": productId,
          }
        ]),
      });
      _wishlistItems.remove(productId);
      // await fetchWishlist();
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  // add wishlist
  // void addProductToCartAndRemoveWishlist({required String productID}) {
  //   //  اذا المنتح موجود وكبست عليه راح يحذف
  //   if (_wishlistItems.containsKey(productID)) {
  //     _wishlistItems.remove(productID);
  //   } else {
  //     _wishlistItems.putIfAbsent(
  //       productID,
  //       () => WishlistModel(
  //         id: const Uuid().v4(),
  //         productId: productID,
  //       ),
  //     );
  //   }
  //   notifyListeners();
  // }

  // نزيد عدد المنتج

  // delete all product => clear all cart
  // void clearLocalWishlist() {
  //   _wishlistItems.clear();
  //   notifyListeners();
  // }
}
