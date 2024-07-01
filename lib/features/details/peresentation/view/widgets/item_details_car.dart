
import 'package:car_store/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ItemDetailsCar extends StatelessWidget {
  const ItemDetailsCar({
    super.key,
    required this.image,
    required this.title,
  });
  final String image, title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          height: 24,
        ),
        const SizedBox(width: 10),
        Text(title, style: AppStyles.regular12),
      ],
    );
  }
}
