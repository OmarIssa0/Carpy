import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.name,
    required this.image,
  });

  final String name, image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.shade300,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name.tr(context),
                style: AppStyles.medium16,
              ),
              // Image.network(image, height: 45),
              // FancyShimmerImage(
              //   imageUrl: image.toString(),
              //   height: 45,
              //   width: 65,
              //   // errorWidget: const Icon(Icons.error),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
