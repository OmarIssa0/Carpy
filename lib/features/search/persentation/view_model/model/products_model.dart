import 'package:flutter/material.dart';

class ProductsModel extends ChangeNotifier {
  final String nameProduct,
      priceProduct,
      descriptionProduct,
      phoneNumberVendor,
      companyName,
      modelProduct,
      categoryProduct,
      productsId,
      imageCompany,
      userId;
  final String? locationVendor, discount;
  List<dynamic> imagesProduct;
  List<dynamic> productsVendor;
  // Timestamp? createdAt;

  ProductsModel({
    required this.productsId,
    required this.userId,
    required this.imageCompany,
    required this.nameProduct,
    required this.priceProduct,
    required this.descriptionProduct,
    required this.phoneNumberVendor,
    required this.companyName,
    required this.modelProduct,
    required this.categoryProduct,
    required this.imagesProduct,
    required this.productsVendor,
    this.locationVendor,
    this.discount,
  });
}
