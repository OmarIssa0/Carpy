import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/features/lang/app_localization.dart';
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
          // Container(
          //   width: MediaQuery.of(context).size.width * .15,
          //   height: MediaQuery.of(context).size.width * .15,
          //   decoration: BoxDecoration(
          //     color: AppColor.kBackGroundColorSplash.withOpacity(.1),
          //     borderRadius: BorderRadius.circular(70),
          //     // image: DecorationImage(
          //     //   image: AssetImage(
          //     //     image,
          //     //   ),
          //     //   fit: BoxFit.scaleDown,
          //     // ),
          //   ),
          //   child: Image.asset(
          //     image,
          //     fit: BoxFit.scaleDown,
          //   ),
          // ),
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.grey.shade900.withOpacity(.1),
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
              style: AppStyles.medium12.copyWith(fontSize: 10),
            ),
          )
          // TitleTextAppCustom(
          //   label: name,
          //   fontSize: 14.sp,
          // ),
        ],
      ),
    );
  }
}
