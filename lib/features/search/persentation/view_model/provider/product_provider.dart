import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/features/search/persentation/view_model/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductsModel> get getProduct {
    return _products;
  }

  ProductsModel? findByProductId(String productId) {
    if (_products.where((element) => element.productsId == productId).isEmpty) {
      return null;
    }
    return _products.firstWhere((element) => element.productsId == productId);
  }

  ProductsModel? findByUserId(String userId) {
    if (_products.where((element) => element.userId == userId).isEmpty) {
      return null;
    }
    return _products.firstWhere((element) => element.userId == userId);
  }

  final List<ProductsModel> _products = [
    ProductsModel(
      userId: const Uuid().v4(),
      imageCompany: Assets.imagesFerareCar,
      productsId: const Uuid().v4(),
      nameProduct: "Toyota Corolla",
      priceProduct: "20000",
      descriptionProduct: "A reliable and fuel-efficient sedan.",
      phoneNumberVendor: "1234567890",
      companyName: "Toyota",
      modelProduct: "Corolla 2022",
      categoryProduct: "Sedan",
      imagesProduct: [Assets.imagesFerareCar, Assets.imagesFerareCar],
      productsVendor: [
        ProductsModel(
          userId: const Uuid().v4(),
          imageCompany: Assets.imagesFerareCar,
          productsId: const Uuid().v4(),
          nameProduct: "Honda Civic",
          priceProduct: "22000",
          descriptionProduct: "A stylish and powerful compact car.",
          phoneNumberVendor: "0987654321",
          companyName: "Honda",
          modelProduct: "Civic 2022",
          categoryProduct: "Compact",
          imagesProduct: [Assets.imagesCarTest, Assets.imagesCarTest],
          productsVendor: ["Product3", "Product4"],
          locationVendor: "Jeddah, Saudi Arabia",
          discount: "7%",
        )
      ],
      locationVendor: "Riyadh, Saudi Arabia",
      discount: "5%",
    ),
    ProductsModel(
      userId: const Uuid().v4(),
      imageCompany: Assets.imagesFerareCar,
      productsId: const Uuid().v4(),
      nameProduct: "Honda Civic",
      priceProduct: "22000",
      descriptionProduct: "A stylish and powerful compact car.",
      phoneNumberVendor: "0987654321",
      companyName: "Honda",
      modelProduct: "Civic 2022",
      categoryProduct: "Compact",
      imagesProduct: [Assets.imagesCarTest, Assets.imagesCarTest],
      productsVendor: ["Product3", "Product4"],
      locationVendor: "Jeddah, Saudi Arabia",
      discount: "7%",
    ),
    ProductsModel(
      userId: const Uuid().v4(),
      imageCompany: Assets.imagesFerareCar,
      productsId: const Uuid().v4(),
      nameProduct: "BMW X5",
      priceProduct: "50000",
      descriptionProduct: "A luxurious and spacious SUV.",
      phoneNumberVendor: "1122334455",
      companyName: "BMW",
      modelProduct: "X5 2022",
      categoryProduct: "SUV",
      imagesProduct: [Assets.imagesTesla, Assets.imagesTesla],
      productsVendor: ["Product5", "Product6"],
    ),
  ];
}
