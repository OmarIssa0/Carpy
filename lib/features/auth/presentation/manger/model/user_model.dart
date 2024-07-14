import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  final String userId;
  final String userName;
  final String userEmail;
  final String userPhone;
  final List userWishList;
  final Timestamp createAt;

  UserModel({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userWishList,
    required this.createAt,
  });
}
