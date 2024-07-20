import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class AlertDialogMethods {
  static Future<void> showDialogWaring({
    required BuildContext context,
    required String titleBottom,
    String? subtitle,
    required String lottileAnimation,
    required Function function,
    bool isGreen = false,
    bool isError = true,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900.withOpacity(.75),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              LottieBuilder.asset(
                lottileAnimation,
                height: 150,
                fit: BoxFit.fill,
              ),
              // TitleTextAppCustom(
              //   label: subtitle ?? '',
              //   fontSize: 18.sp,
              //   color: Colors.white,
              // ),
              Text(
                textAlign: TextAlign.center,
                subtitle ?? '',
                style: AppStyles.medium16.copyWith(color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        function();
                        // Navigator.of(context).pop();
                      },
                      child: Text(
                        titleBottom,
                        style: AppStyles.medium16.copyWith(
                            color: isGreen ? Colors.red : Colors.green),
                      ),
                      // TitleTextAppCustom(
                      //   label: titleBottom,
                      //   fontSize: 16.sp,
                      //   color: AppColor.kRedColorPrice,
                      // ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Visibility(
                      visible: !isError,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Cancel".tr(context),
                          style:
                              AppStyles.medium16.copyWith(color: Colors.white),
                        ),
                        // TitleTextAppCustom(
                        //   label: 'Cancel',
                        //   fontSize: 16.sp,
                        //   color: Colors.white,
                        // ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  static Future<void> showError({
    required BuildContext context,
    required String titleBottom,
    String? subtitle,
    required String lottileAnimation,
    required Function function,
    bool isError = true,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900.withOpacity(.75),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LottieBuilder.asset(
                lottileAnimation,
                height: 150,
                fit: BoxFit.fill,
              ),
              Text(
                  textAlign: TextAlign.center,
                  subtitle ?? '',
                  style: AppStyles.medium16.copyWith(color: Colors.white)),
              // TitleTextAppCustom(
              //   label: subtitle ?? '',
              //   fontSize: 18.sp,
              //   color: Colors.white,
              //   maxLine: 7,
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        function();
                        // Navigator.of(context).pop();
                      },
                      child: Text(titleBottom,
                          style:
                              AppStyles.medium16.copyWith(color: Colors.red)),
                      // TitleTextAppCustom(
                      //   label: titleBottom,
                      //   fontSize: 16.sp,
                      //   color: AppColor.kRedColorPrice,
                      // ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Visibility(
                      visible: !isError,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(subtitle ?? '',
                            style: AppStyles.medium16
                                .copyWith(color: Colors.white)),
                        //  TitleTextAppCustom(
                        //   label: 'Cancel',
                        //   fontSize: 16.sp,
                        //   color: Colors.white,
                        // ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  static Future<void> showDialogForgotPassword({
    required BuildContext context,
    required String titleBottom,
    String? subtitle,
    required String lottileAnimation,
    required Function function,
    bool isError = true,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900.withOpacity(.75),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LottieBuilder.asset(
                  lottileAnimation,
                  height: 120,
                ),
              ),
              // TitleTextAppCustom(
              //   label: subtitle ?? '',
              //   fontSize: 14.sp,
              //   color: Colors.white,
              //   maxLine: 2,
              // ),
              Text(
                textAlign: TextAlign.center,
                subtitle ?? '',
                style: AppStyles.medium16.copyWith(color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        function();
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        titleBottom,
                        style: AppStyles.medium16.copyWith(color: Colors.red),
                      ),
                      // TitleTextAppCustom(
                      //   label: titleBottom,
                      //   fontSize: 16.sp,
                      //   color: AppColor.kRedColorPrice,
                      // ),
                    ),
                    // SizedBox(
                    //   width: 10.w,
                    // ),
                    // Visibility(
                    //   visible: !isError,
                    //   child: TextButton(
                    //     onPressed: () {
                    //
                    //     },
                    //     child: TitleTextAppCustom(
                    //       label: 'Cancel',
                    //       fontSize: 16.sp,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
