import 'package:car_store/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CategoriesRoundedWidgets extends StatelessWidget {
  const CategoriesRoundedWidgets({
    super.key,
    required this.image,
    required this.name,
    this.onTap,
  });

  final String image;
  final String name;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.grey.shade400.withOpacity(.1),
            child: Image.asset(
              image,
              fit: BoxFit.scaleDown,
              height: 40,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * .22,
            child: Text(
              // maxLines: 1,
              // overflow: TextOverflow.ellipsis,
              name,
              style: AppStyles.medium12.copyWith(
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
