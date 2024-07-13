import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/features/search/persentation/view_model/model/products_model.dart';
import 'package:car_store/features/vendor_stroe/presentation/view_model/model/vendor_model.dart';
import 'package:flutter/material.dart';

class VendorProvider extends ChangeNotifier {
  List<VendorModel> get getProduct {
    return _vendorList;
  }

  VendorModel? findByVendorId(String vendorId) {
    if (_vendorList.where((element) => element.vendorId == vendorId).isEmpty) {
      return null;
    }
    return _vendorList.firstWhere((element) => element.vendorId == vendorId);
  }

  final List<VendorModel> _vendorList = [
    VendorModel(
      vendorType: "market",
      imageCompany: Assets.imagesFerareCar,
      vendorId: "99",
      companyName: "companyName",
      location: "location",
      phoneNumber: "123456789",
      productList: [
        ProductsModel(
          isSwitchReservation: true,
          userId: "99",
          imageCompany: Assets.imagesFerareCar,
          productsId: "99",
          nameProduct: "Honda Civic",
          priceProduct: "22000",
          descriptionProduct: "A stylish and powerful compact car.",
          phoneNumberVendor: "0987654321",
          companyName: "Honda",
          modelProduct: "2022",
          categoryProduct: "Acura - أكورا",
          imagesProduct: [Assets.imagesCarTest, Assets.imagesCarTest],
          // productsVendor: ["Product3", "Product4"],
          locationVendor: "Jeddah, Saudi Arabia",
          discount: "7%",
        ),
      ],
    ),
    // VendorModel(
    //   vendorType: "market",
    //   imageCompany: Assets.imagesFerareCar,
    //   vendorId: "100",
    //   companyName: "TEST TEST",
    //   location: "location",
    //   phoneNumber: "123412341234",
    //   productList: [],
    // ),
    // VendorModel(
    //   vendorType: "market",
    //   imageCompany: Assets.imagesTesla,
    //   vendorId: "42",
    //   companyName: "companyName",
    //   location: "location",
    //   phoneNumber: "123456789",
    //   productList: [
    //     ProductsModel(
    //       isSwitchReservation: true,
    //       userId: "42",
    //       imageCompany: Assets.imagesFerareCar,
    //       productsId: const Uuid().v4(),
    //       nameProduct: "Honda Civic",
    //       priceProduct: "22000",
    //       descriptionProduct: "A stylish and powerful compact car.",
    //       phoneNumberVendor: "0987654321",
    //       companyName: "Honda",
    //       modelProduct: "2022",
    //       categoryProduct: "Acura - أكورا",
    //       imagesProduct: [Assets.imagesCarTest, Assets.imagesCarTest],
    //       // productsVendor: ["Product3", "Product4"],
    //       locationVendor: "Jeddah, Saudi Arabia",
    //       discount: "7%",
    //     ),
    //     ProductsModel(
    //       isSwitchReservation: true,
    //       userId: "42",
    //       imageCompany: Assets.imagesFerareCar,
    //       productsId: const Uuid().v4(),
    //       nameProduct: "Honda Civic",
    //       priceProduct: "22000",
    //       descriptionProduct: "A stylish and powerful compact car.",
    //       phoneNumberVendor: "0987654321",
    //       companyName: "Honda",
    //       modelProduct: "2022",
    //       categoryProduct: "Acura - أكورا",
    //       imagesProduct: [Assets.imagesCarTest, Assets.imagesCarTest],
    //       // productsVendor: ["Product3", "Product4"],
    //       locationVendor: "Jeddah, Saudi Arabia",
    //       discount: "7%",
    //     ),
    //     ProductsModel(
    //       isSwitchReservation: true,
    //       userId: "42",
    //       imageCompany: Assets.imagesFerareCar,
    //       productsId: const Uuid().v4(),
    //       nameProduct: "Honda Civic",
    //       priceProduct: "22000",
    //       descriptionProduct: "A stylish and powerful compact car.",
    //       phoneNumberVendor: "0987654321",
    //       companyName: "Honda",
    //       modelProduct: "2022",
    //       categoryProduct: "Acura - أكورا",
    //       imagesProduct: [Assets.imagesCarTest, Assets.imagesCarTest],
    //       // productsVendor: ["Product3", "Product4"],
    //       locationVendor: "Jeddah, Saudi Arabia",
    //       discount: "7%",
    //     ),
    //     ProductsModel(
    //       isSwitchReservation: true,
    //       userId: "42",
    //       imageCompany: Assets.imagesFerareCar,
    //       productsId: const Uuid().v4(),
    //       nameProduct: "Honda Civic",
    //       priceProduct: "22000",
    //       descriptionProduct: "A stylish and powerful compact car.",
    //       phoneNumberVendor: "0987654321",
    //       companyName: "Honda",
    //       modelProduct: "2022",
    //       categoryProduct: "Acura - أكورا",
    //       imagesProduct: [Assets.imagesCarTest, Assets.imagesCarTest],
    //       // productsVendor: ["Product3", "Product4"],
    //       locationVendor: "Jeddah, Saudi Arabia",
    //       discount: "7%",
    //     ),
    //   ],
    // ),
  ];
}
