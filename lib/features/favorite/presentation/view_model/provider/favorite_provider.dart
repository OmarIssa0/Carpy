import 'package:car_store/features/favorite/presentation/view_model/model/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class FavoriteProvider extends ChangeNotifier {
  final Map<String, FavoriteModel> _favoriteList = {};

  Map<String, FavoriteModel> get favoriteList => _favoriteList;

  bool isProductsInFavoriteList(String productId) {
    return _favoriteList.containsKey(productId);
  }

  void isProductInFavoriteListAndRemove({required String productId}) {
    if (_favoriteList.containsKey(productId)) {
      _favoriteList.remove(productId);
    } else {
      favoriteList.putIfAbsent(
        productId,
        () => FavoriteModel(
          id: const Uuid().v4(),
          productId: productId,
        ),
      );
    }

    notifyListeners();
  }

  void removeFromFavoriteList({required String productId}) {
    favoriteList.remove(productId);

    notifyListeners();
  }
}
