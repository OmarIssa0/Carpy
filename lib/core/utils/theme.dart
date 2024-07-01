import 'package:car_store/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Styles {
  static ThemeData themeData({
    required BuildContext context,
    required String fontFamily,
  }) {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xffF9FAFB),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColor.kBackGroundColorSplash,
      ),
      // colorSchemeSeed: AppColor.kBackGroundColorSplash,
      dialogTheme: const DialogTheme(elevation: 0),
      // bottomSheetTheme: const BottomSheetThemeData(
      //   backgroundColor: AppColor.kBackGroundColor,
      //   elevation: 0,
      // ),
      datePickerTheme: const DatePickerThemeData(
        elevation: 0,
        // backgroundColor: AppColor.kBackGroundColor,
      ),
      appBarTheme: const AppBarTheme(
        shadowColor: Color(0xffF9FAFB),
        backgroundColor: Color(0xffF9FAFB),
        surfaceTintColor: Color(0xffF9FAFB),
        elevation: 0,
      ),
      useMaterial3: true,
      // scaffoldBackgroundColor: AppColor.kBackGroundColor,
      fontFamily: fontFamily,
    );
  }
}
