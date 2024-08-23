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

  List<String> categoryList = [
    "الكل",
    "اكسسوارات",
    "قطع غيار",
    "استئجار المركبات",
    "مركبات للبيع",
    "تعبئة على الطريق",
    "زيوت وسوائل",
    "تنظيف المركبات",
  ];

  double _minPrice = 0.0;
  double _maxPrice = 1000000;
  String? _selectedCategory;
  // String? _selectedSpecifications;

  double get minPrice => _minPrice;
  double get maxPrice => _maxPrice;
  String? get selectedCategory => _selectedCategory;
  // String? get selectedSpecifications => _selectedSpecifications;

  void setMinPrice(double value) {
    _minPrice = value;
    notifyListeners();
  }

  void setMaxPrice(double value) {
    _maxPrice = value;
    notifyListeners();
  }

  void setSelectedCategory(String? value, bool? isFilter) {
    if (isFilter == false) {
      _selectedCategory = null;
      return;
    }
    notifyListeners();

    if (value == "الكل") {
      _selectedCategory = null;
      notifyListeners();
      return;
    }

    _selectedCategory = value;
    notifyListeners();
  }

  // void setSelectedSpecifications(String? value) {
  //   _selectedSpecifications = value;
  //   notifyListeners();
  // }

  List<ProductsModel> filterProducts(
      List<ProductsModel> products, bool isFilter) {
    return products.where((product) {
      final double productPrice = double.tryParse(product.priceProduct) ?? 0.0;
      final matchesPrice =
          productPrice >= _minPrice && productPrice <= _maxPrice;

      if (isFilter == false) {
        return matchesPrice;
      }
      final matchesCategory = _selectedCategory == null ||
          product.categoryTypeAd == _selectedCategory;

      // final matchesSpecifications = _selectedSpecifications == null ||
      //     product.selectedFeatures!.contains(_selectedSpecifications!);
      // return matchesPrice && matchesCategory && matchesSpecifications;
      return matchesPrice && matchesCategory;
    }).toList();
  }

  // void addDummyProducts() {
  //   for (int i = 0; i < 10; i++) {
  //     _products.add(ProductsModel(
  //       categoryTypeAd: 'Category $i',
  //       productsId: 'Product ${_products.length + 1}',
  //       isSwitchReservation: false,
  //       userId: 'User $i',
  //       imageCompany: 'https://example.com/image$i.png',
  //       nameProduct: 'Product Name $i',
  //       priceProduct: (100.0 + i).toString(),
  //       descriptionProduct: 'Description $i',
  //       phoneNumberVendor: '123456789$i',
  //       companyName: 'Company $i',
  //       modelProduct: 'Model $i',
  //       categoryProduct: 'Category $i',
  //       imagesProduct: ['https://example.com/image$i.png'],
  //     ));
  //   }
  //   notifyListeners();
  // }
}
