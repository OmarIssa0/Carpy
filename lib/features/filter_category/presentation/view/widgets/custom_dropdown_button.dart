import 'package:car_store/core/utils/app_color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropdown extends StatelessWidget {
  const CustomDropdown({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(
          color: AppColor.kSilver.withOpacity(.2),
        ),
      ),
      child: child,
    );
  }
}
