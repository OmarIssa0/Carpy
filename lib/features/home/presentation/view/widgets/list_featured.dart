import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_image.dart';
import 'package:flutter/material.dart';

class ListFeatured extends StatelessWidget {
  const ListFeatured({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          2,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              child: Banner(
                  location: BannerLocation.topEnd,
                  layoutDirection: TextDirection.rtl,
                  color: AppColor.kBackGroundColorSplash,
                  message: "Featured",
                  child: Image.asset(Assets.imagesTesla)),
            ),
          ),
        ),
      ),
    );
  }
}
