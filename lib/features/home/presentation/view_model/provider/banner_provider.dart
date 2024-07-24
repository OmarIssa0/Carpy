import 'package:car_store/features/home/presentation/view_model/model/banner_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BannerProvider with ChangeNotifier {
  final List<BannerModel> _banner = [];
  List<BannerModel> get getBanner => _banner;


  

  final bannerDB = FirebaseFirestore.instance.collection('banner');

  Future<List<BannerModel>> getBannerData() async {
    try {
      await bannerDB.orderBy("createAt", descending: true).get().then((value) {
        _banner.clear();
        for (var element in value.docs) {
          _banner.insert(0, BannerModel.fromJson(element));
        }
      });
      notifyListeners();
      return _banner;
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<BannerModel>> getAllBannerStream() {
    try {
      return bannerDB.snapshots().map((event) {
        _banner.clear();
        for (var element in event.docs) {
          _banner.insert(0, BannerModel.fromJson(element));
        }
        // notifyListeners();
        return _banner;
      });
    } catch (e) {
      rethrow;
    }
  }
}
