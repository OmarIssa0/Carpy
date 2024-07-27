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
        SizedBox(
          width: MediaQuery.of(context).size.width * .85 - 25,
          child: Text(
            title,
            style: AppStyles.regular12,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
