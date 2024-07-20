import 'dart:async';

import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/widgets/alert_dialog.dart';
import 'package:car_store/features/auth/presentation/manger/provider/user_provider.dart';
import 'package:car_store/features/details/peresentation/view_model/model/send_booking_model.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class SendBookingProvider with ChangeNotifier {
  final Map<String, SendBookingModel> _data = {};
  Map<String, SendBookingModel> get data => _data;

  bool isProductBooking({required String productId}) {
    return _data.containsKey(productId);
  }

  final vendorDB = FirebaseFirestore.instance.collection('vendors');
  final _auth = FirebaseAuth.instance;
  Future<void> sendBookingFirebase(
      {required String productId,
      required BuildContext context,
      required String vendorID}) async {
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
    final bookingId = const Uuid().v4();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final userModel = userProvider.userModel;

    if (userModel == null) {
      Fluttertoast.showToast(msg: "User details not available");
      return;
    }
    try {
      await vendorDB.doc(vendorID).update({
        'myOrders': FieldValue.arrayUnion([
          {
            'productId': productId,
            'bookingId': bookingId,
            'userName': userModel.userName ?? '',
            'userPhone': userModel.userPhone ?? '',
            'createAt': Timestamp.now(),
          }
        ]),
      });
      await FirebaseFirestore.instance.collection("users").doc(uid).update({
        "userBooking": FieldValue.arrayUnion([
          {
            "bookingId": bookingId,
            "productId": productId,
          }
        ]),
      });
      _data[productId] = SendBookingModel(
        id: bookingId,
        productId: productId,
      );
      Fluttertoast.showToast(msg: "Reserved successfully".tr(context));
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  // Future<void> fetchBooking() async {
  //   User? user = _auth.currentUser;
  //   if (user == null) {
  //     _data.clear();
  //     return;
  //   }
  //   try {
  //     final vendorDoc = await vendorDB.doc(user.uid).get();
  //     final data = vendorDoc.data();
  //     if (data == null || !data.containsKey("userBooking")) {
  //       return;
  //     }

  //     final leng = vendorDoc.get("userBooking").length;
  //     for (int i = 0; i < leng; i++) {
  //       _data.putIfAbsent(
  //         vendorDoc.get('userBooking')[i]['productId'],
  //         () => SendBookingModel(
  //           id: vendorDoc.get('userBooking')[i]['bookingId'],
  //           productId: vendorDoc.get('userBooking')[i]['productId'],
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }

  //   notifyListeners();
  // }
  Future<void> fetchBooking() async {
    User? user = _auth.currentUser;
    if (user == null) {
      _data.clear();
      return;
    }
    try {
      // جلب بيانات المستخدم من مجموعة "users"
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      final data = userDoc.data();
      if (data == null || !data.containsKey('userBooking')) {
        return;
      }

      // مسح البيانات القديمة
      _data.clear();

      // جلب الحجوزات وتحديث _data
      final bookings = List<Map<String, dynamic>>.from(data['userBooking']);
      for (var booking in bookings) {
        _data.putIfAbsent(
          booking['productId'],
          () => SendBookingModel(
            id: booking['bookingId'],
            productId: booking['productId'],
          ),
        );
      }
    } catch (e) {
      print(e); // طباعة الخطأ لأغراض التصحيح
      rethrow;
    }

    notifyListeners();
  }

  // void sendProductsToVendors(
  //     {required String productId,
  //     required BuildContext context,
  //     required String productName,
  //     required String productImage,
  //     required String priceProducts}) {
  //   // final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   // final userModel = userProvider.userModel;
  //   if (_data.containsKey(productId)) {
  //     _data.remove(productId);
  //   } else {
  //     _data.putIfAbsent(
  //       productId,
  //       () => SendBookingModel(
  //         id: const Uuid().v4(),
  //         // userName: userModel?.userName ?? "",
  //         // userPhone: userModel?.userPhone ?? "",
  //         productId: productId,
  //         // priceProducts: priceProducts,
  //         // productName: productName,
  //         // productImage: productImage,
  //         // date: Timestamp.now(),
  //       ),
  //     );
  //   }
  //   notifyListeners();
  // }

  // Future<void> removeBooking({
  //   required String productId,
  //   required String bookingId,
  //   required BuildContext context,
  //   required String vendorID,
  // }) async {
  //   // User? user = _auth.currentUser;
  //   final auth = FirebaseAuth.instance;
  //   User? user = auth.currentUser;
  //   final uid = user!.uid;
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   final userModel = userProvider.userModel;

  //   try {
  //     await FirebaseFirestore.instance
  //         .collection("vendors")
  //         .doc(vendorID)
  //         .update({
  //       'myOrders': FieldValue.arrayRemove([
  //         {
  //           "bookingId": bookingId,
  //           "productId": productId,
  //           "userName": userModel?.userName ?? "",
  //           "userPhone": userModel?.userPhone ?? "",
  //           "createAt": Timestamp.now(),
  //         }
  //       ]),
  //     });
  //     _data.remove(productId);

  //     await FirebaseFirestore.instance
  //         .collection("users")
  //         .doc(user.uid)
  //         .update({
  //       "userBooking": FieldValue.arrayRemove([
  //         {
  //           "bookingId": bookingId,
  //           "productId": productId,
  //         }
  //       ]),
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }

  //   notifyListeners();
  // }
  Future<void> removeBooking({
    required String productId,
    required String bookingId,
    required BuildContext context,
    required String vendorID,
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
    try {
      final vendorDoc = await FirebaseFirestore.instance
          .collection("vendors")
          .doc(vendorID)
          .get();
      if (!vendorDoc.exists || !vendorDoc.data()!.containsKey('myOrders')) {
        print("No orders found");
        return;
      }

      final orders =
          List<Map<String, dynamic>>.from(vendorDoc.data()!['myOrders']);
      Map<String, dynamic>? orderToRemove;

      for (var order in orders) {
        if (order['bookingId'] == bookingId &&
            order['productId'] == productId) {
          orderToRemove = order;
          break;
        }
      }

      if (orderToRemove == null) {
        print("Order not found");
        return;
      }

      await FirebaseFirestore.instance
          .collection("vendors")
          .doc(vendorID)
          .update({
        'myOrders': FieldValue.arrayRemove([orderToRemove]),
      });

      await FirebaseFirestore.instance.collection("users").doc(uid).update({
        "userBooking": FieldValue.arrayRemove([
          {
            "bookingId": bookingId,
            "productId": productId,
          }
        ]),
      });
      _data.remove(productId);
      if (!context.mounted) return;
      Fluttertoast.showToast(msg: "Booking removed successfully".tr(context));
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Failed to remove booking. Please try again".tr(context));
    }

    notifyListeners();
  }
}
