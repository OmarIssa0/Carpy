import 'package:car_store/features/search/persentation/view_model/model/products_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VendorModel with ChangeNotifier {
  final String vendorId,
      companyName,
      location,
      phoneNumber,
      imageCompany,
      vendorType;
  final List<ProductsModel> productList;

  VendorModel({
    required this.vendorId,
    required this.vendorType,
    required this.imageCompany,
    required this.productList,
    required this.companyName,
    required this.location,
    required this.phoneNumber,
  });

  factory VendorModel.firebase(DocumentSnapshot snapshot) {
    Map data = snapshot.data() as Map<String, dynamic>;
    return VendorModel(
      // vendorId: snapshot.id,
      vendorId: data['vendorId'],
      companyName: data['companyName'],
      location: data['location'],
      phoneNumber: data['phoneNumber'],
      imageCompany: data['imageCompany'],
      vendorType: data['vendorType'],
      productList: data['productList'],
    );
  }
}
