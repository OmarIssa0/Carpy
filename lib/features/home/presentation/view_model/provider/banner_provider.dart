import 'package:car_store/features/home/presentation/view_model/model/banner_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BannerProvider with ChangeNotifier {
  // banner one home view
  final List<BannerModel> _bannerOne = [];
  List<BannerModel> get getBannerOne => _bannerOne;

  // banner Too home view
  final List<BannerModel> _bannerToo = [];
  List<BannerModel> get getBannerToo => _bannerToo;

  // banner Three home view
  final List<BannerModel> _bannerThree = [];
  List<BannerModel> get getBannerThree => _bannerThree;

  final bannerDBOne = FirebaseFirestore.instance.collection('bannerOne');
  final bannerDBToo = FirebaseFirestore.instance.collection('bannerToo');
  final bannerDBThree = FirebaseFirestore.instance.collection('bannerThree');

  Future<List<BannerModel>> getBannerDataOne() async {
    try {
      await bannerDBOne
          .orderBy("createAt", descending: true)
          .get()
          .then((value) {
        _bannerOne.clear();
        for (var element in value.docs) {
          _bannerOne.insert(0, BannerModel.fromJson(element));
        }
      });
      notifyListeners();
      return _bannerOne;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<BannerModel>> getBannerDataToo() async {
    try {
      await bannerDBToo
          .orderBy("createAt", descending: true)
          .get()
          .then((value) {
        _bannerToo.clear();
        for (var element in value.docs) {
          _bannerToo.insert(0, BannerModel.fromJson(element));
        }
      });
      notifyListeners();
      return _bannerToo;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<BannerModel>> getBannerDataThree() async {
    try {
      await bannerDBThree
          .orderBy("createAt", descending: true)
          .get()
          .then((value) {
        _bannerThree.clear();
        for (var element in value.docs) {
          _bannerThree.insert(0, BannerModel.fromJson(element));
        }
      });
      notifyListeners();
      return _bannerThree;
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<BannerModel>> getAllBannerStreamOne() {
    try {
      return bannerDBOne.snapshots().map((event) {
        _bannerOne.clear();
        for (var element in event.docs) {
          _bannerOne.insert(0, BannerModel.fromJson(element));
        }
        // notifyListeners();
        return _bannerOne;
      });
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<BannerModel>> getAllBannerStreamToo() {
    try {
      return bannerDBToo.snapshots().map((event) {
        _bannerToo.clear();
        for (var element in event.docs) {
          _bannerToo.insert(0, BannerModel.fromJson(element));
        }
        // notifyListeners();
        return _bannerToo;
      });
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<BannerModel>> getAllBannerStreamThree() {
    try {
      return bannerDBThree.snapshots().map((event) {
        _bannerThree.clear();
        for (var element in event.docs) {
          _bannerThree.insert(0, BannerModel.fromJson(element));
        }
        // notifyListeners();
        return _bannerThree;
      });
    } catch (e) {
      rethrow;
    }
  }
}
