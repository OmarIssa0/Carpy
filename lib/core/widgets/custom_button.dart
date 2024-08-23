import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.title,
      this.onPressed,
      this.color,
      this.colorFont,
      this.colorBorder});

  final String title;
  final void Function()? onPressed;
  final Color? color, colorFont, colorBorder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: colorBorder ?? Colors.transparent)),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          backgroundColor: color ?? AppColor.kBackGroundColorSplash,
        ),
        onPressed: onPressed,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            title,
            style:
                AppStyles.semiBold16.copyWith(color: colorFont ?? Colors.white),
          ),
        ),
      ),
    );
  }
}
