import 'package:flutter/material.dart';

class FavoriteModel  with ChangeNotifier {
  final String productId, id;

  FavoriteModel({required this.productId, required this.id});
}
