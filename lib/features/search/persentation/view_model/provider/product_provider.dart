import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/search/persentation/view_model/model/products_model.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<ProductsModel> get getProduct {
    return _products;
  }

  ProductsModel? findByProductId(String productId) {
    if (_products.where((element) => element.productsId == productId).isEmpty) {
      return null;
    }
    return _products.firstWhere((element) => element.productsId == productId);
  }

  // ProductsModel? findByUserId(String userId) {
  //   if (_products.where((element) => element.userId == userId).isEmpty) {
  //     return null;
  //   }
  //   return _products.firstWhere((element) => element.userId == userId);
  // }

  List<ProductsModel> findByCategory(
      {required String categoryName, required BuildContext context}) {
    List<ProductsModel> categoryList = _products
        .where((element) => element.categoryProduct
            .tr(context)
            .toLowerCase()
            .contains(categoryName.toLowerCase()))
        .toList();
    return categoryList;
  }

  List<ProductsModel> productListSearch = [];
  // TextEditingController searchController = TextEditingController();
  List<ProductsModel> searchQuery(
      {required String searchText, required List<ProductsModel> passedList}) {
    List<ProductsModel> searchList = passedList
        .where((element) => element.nameProduct
            .toLowerCase()
            .contains(searchText.toLowerCase()))
        .toList();
    notifyListeners();
    return searchList;
  }

  final List<ProductsModel> _products = [
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
    // ProductsModel(
    //   userId: "100",
    //   imageCompany: Assets.imagesFerareCar,
    //   productsId: const Uuid().v4(),
    //   nameProduct: "Honda Civic",
    //   priceProduct: "22000",
    //   descriptionProduct: "A stylish and powerful compact car.",
    //   phoneNumberVendor: "0987654321",
    //   companyName: "Honda",
    //   modelProduct: "Civic 2022",
    //   categoryProduct: "Acura",
    //   imagesProduct: [Assets.imagesCarTest, Assets.imagesCarTest],
    //   isSwitchReservation: false,
    //   locationVendor: "Jeddah, Saudi Arabia",
    //   discount: "7%",
    // ),
    // ProductsModel(
    //   userId: "123",
    //   imageCompany: Assets.imagesFerareCar,
    //   productsId: const Uuid().v4(),
    //   nameProduct: "Honda Civic",
    //   priceProduct: "22000",
    //   descriptionProduct: "A stylish and powerful compact car.",
    //   phoneNumberVendor: "0987654321",
    //   companyName: "Honda",
    //   modelProduct: "Civic 2022",
    //   categoryProduct: "أكورا",
    //   imagesProduct: [Assets.imagesCarTest, Assets.imagesCarTest],
    //   // productsVendor: ["Product3", "Product4"],
    //   locationVendor: "Jeddah, Saudi Arabia",
    //   discount: "7%", isSwitchReservation: false,
    // ),
    // ProductsModel(
    //   userId: "123",
    //   imageCompany: Assets.imagesFerareCar,
    //   productsId: const Uuid().v4(),
    //   nameProduct: "BMW X5",
    //   priceProduct: "50000",
    //   descriptionProduct: "A luxurious and spacious SUV.",
    //   phoneNumberVendor: "1122334455",
    //   companyName: "BMW",
    //   modelProduct: "X5 2022",
    //   categoryProduct: "SUV",
    //   imagesProduct: [Assets.imagesTesla, Assets.imagesTesla],
    //   isSwitchReservation: false,
    // ),
  ];
}
