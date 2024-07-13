import 'package:car_store/features/lang/app_localization.dart';
import 'package:flutter/material.dart';

class MyValidators {
  static String? displayNameValidator(
      String? displayName, BuildContext context) {
    if (displayName == null || displayName.isEmpty) {
      // return 'Display name cannot be empty';
      return "Display name cannot be empty".tr(context);
    }
    if (displayName.length < 3 || displayName.length > 20) {
      return 'Display name must be between 3 and 20 characters'.tr(context);
    }

    return null; // Return null if display name is valid
  }

  static String? emailValidator(String? value, BuildContext context) {
    // اذا مش فاضي بطبع
    if (value!.isEmpty) {
      return 'Please enter an email'.tr(context);
    }
    // اذا الفورم الي الداخل غلط
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(value)) {
      return 'Please enter a valid email'.tr(context);
    }
    return null;
  }

  static String? passwordValidator(String? value, BuildContext context) {
    //  اذا فاضي اطبع
    if (value!.isEmpty) {
      return 'Please enter a password'.tr(context);
    }
    // اذا اقل من 6 احرف
    if (value.length < 6) {
      return 'Password must be at least 6 characters long'.tr(context);
    }
    return null;
  }

  static String? validateMobile(String value, BuildContext context) {
    String pattern = r'07[789]\d{7}$';
    // String pattern = r'^\+9627[789]\d{7}$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter mobile number'.tr(context);
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number'.tr(context);
    }
    return null;
  }

  // static String? repeatPasswordValidator({String? value, String? password}) {
  //   if (value != password) {
  //     return 'Passwords do not match';
  //   }
  //   return null;
  // }
}
