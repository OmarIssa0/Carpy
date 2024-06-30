import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(vertical: 21),
            backgroundColor: AppColor.kBackGroundColorSplash),
        child: Text(
          title,
          style: AppStyles.semiBold18.copyWith(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }
}
