import 'dart:developer';

import 'package:car_store/features/vendor_stroe/presentation/view_model/model/vendor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VendorProvider with ChangeNotifier {
  final List<VendorModel> _vendorList = [];
  List<VendorModel> get getProduct {
    return _vendorList;
  }

  VendorModel? findByVendorId(String vendorId) {
    if (_vendorList.where((element) => element.vendorId == vendorId).isEmpty) {
      return null;
    }
    return _vendorList.firstWhere((element) => element.vendorId == vendorId);
  }

  Future<List<VendorModel>> getAllVendors() async {
    final vendorDB = FirebaseFirestore.instance.collection('vendors');
    try {
      await vendorDB.get().then((value) {
        // _vendorList.clear();
        for (var element in value.docs) {
          _vendorList.insert(0, VendorModel.firebase(element));
        }
      });
      log(_vendorList.toString());
      notifyListeners();
      return _vendorList;
    } catch (e) {
      rethrow;
    }
  }

  // final List<VendorModel> _vendorList = [
  //   VendorModel(
  //     vendorType: "market",
  //     imageCompany: Assets.imagesFerareCar,
  //     vendorId: "99",
  //     companyName: "companyName",
  //     location: "location",
  //     phoneNumber: "123456789",
  //     productList: [
  //       ProductsModel(
  //         isSwitchReservation: true,
  //         userId: "99",
  //         imageCompany: Assets.imagesFerareCar,
  //         productsId: "99",
  //         nameProduct: "Honda Civic",
  //         priceProduct: "22000",
  //         descriptionProduct: "A stylish and powerful compact car.",
  //         phoneNumberVendor: "0987654321",
  //         companyName: "Honda",
  //         modelProduct: "2022",
  //         categoryProduct: "Acura - أكورا",
  //         imagesProduct: [Assets.imagesCarTest, Assets.imagesCarTest],
  //         // productsVendor: ["Product3", "Product4"],
  //         locationVendor: "Jeddah, Saudi Arabia",
  //         discount: "7%",
  //       ),
  //     ],
  //   ),
  // ];
}
