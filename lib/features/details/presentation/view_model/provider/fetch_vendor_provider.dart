import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FetchVendorDetails with ChangeNotifier {
  Map<String, dynamic>? _vendorData;

  Map<String, dynamic>? get vendorData => _vendorData;

  Future<void> fetchVendorData(String userId) async {
    try {
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection('vendors')
          .doc(userId)
          .get();

      if (docSnapshot.exists) {
        _vendorData = docSnapshot.data() as Map<String, dynamic>?;
      } else {
        _vendorData = null;
      }
      notifyListeners();
    } catch (error) {
      print('Error fetching vendor data: $error');
    }
  }
}
