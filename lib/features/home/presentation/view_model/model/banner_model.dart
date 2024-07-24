import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BannerModel with ChangeNotifier {
  String? image;
  String id;
  BannerModel({required this.image, required this.id});

  factory BannerModel.fromJson(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;

    return BannerModel(
      image: data['image'],
      id: data['id'],
    );
  }
}
