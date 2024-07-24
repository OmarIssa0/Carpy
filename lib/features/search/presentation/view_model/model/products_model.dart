import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductsModel with ChangeNotifier {
  final String nameProduct,
      priceProduct,
      descriptionProduct,
      phoneNumberVendor,
      companyName,
      modelProduct,
      categoryProduct,
      productsId,
      imageCompany,
      categoryTypeAd,
      userId;
  final String? locationVendor, discount;
  List<dynamic> imagesProduct;
  // List<dynamic> productsVendor;
  bool isSwitchReservation = false;
  Timestamp? createdAt;

  ProductsModel({
    required this.categoryTypeAd,
    required this.productsId,
    required this.isSwitchReservation,
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
    // required this.productsVendor,
    this.locationVendor,
    this.discount,
    this.createdAt,
  });

  factory ProductsModel.fromFirebase(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;

    return ProductsModel(
      productsId: data['productId'],
      isSwitchReservation: data['isSwitchReservation'],
      userId: data['userId'],
      imageCompany: data['imageCompany'],
      nameProduct: data['productTitle'],
      priceProduct: data['productPrice'],
      descriptionProduct: data['productDescription'],
      phoneNumberVendor: data['phoneNumber'],
      companyName: data['companyName'],
      modelProduct: data['model'],
      categoryProduct: data['productCategory'],
      imagesProduct: data['productImage'],
      // productsVendor: data['productsVendor'],
      locationVendor: data['location'],
      discount: data['discount'],
      categoryTypeAd: data['categoryTypeAd'],
      createdAt: data['createdAt'],
    );
  }
}
