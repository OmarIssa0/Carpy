import 'package:car_store/features/search/presentation/view_model/model/products_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  final List<ProductsModel> _products = [];
  List<ProductsModel> get getProduct {
    return _products;
  }

  ProductsModel? findByProductId(String productId) {
    if (_products.where((element) => element.productsId == productId).isEmpty) {
      return null;
    }
    return _products.firstWhere((element) => element.productsId == productId);
  }

  List<ProductsModel> findByBrand({required String brandName}) {
    List<ProductsModel> brandList = _products
        .where((element) => element.categoryProduct
            .toLowerCase()
            .contains(brandName.toLowerCase()))
        .toList();
    return brandList;
  }

  List<ProductsModel> findBySubCategory({required String category}) {
    List<ProductsModel> categoryList = _products
        .where((element) => element.categoryTypeAd.contains(category))
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

  final productsDB = FirebaseFirestore.instance.collection("product");
  Future<List<ProductsModel>> getAllProducts() async {
    try {
      await productsDB
          .orderBy("createAt", descending: true)
          .get()
          .then((value) {
        _products.clear();
        for (var element in value.docs) {
          _products.insert(0, ProductsModel.fromFirebase(element));
        }
      });
      notifyListeners();
      return _products;
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<ProductsModel>> getAllProductsStream() {
    try {
      return productsDB.snapshots().map((event) {
        _products.clear();
        for (var element in event.docs) {
          _products.insert(0, ProductsModel.fromFirebase(element));
        }
        // notifyListeners();
        return _products;
      });
    } catch (e) {
      rethrow;
    }
  }
}