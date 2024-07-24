import 'package:car_store/core/utils/animation_nav.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/utils/size_config.dart';
import 'package:car_store/features/filter_category/presentation/view/filter_brand_view.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:flutter/material.dart';

class SeeMoreAndRecommended extends StatelessWidget {
  const SeeMoreAndRecommended({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.sizeOf(context).width < SizeConfig.tablet
          ? const EdgeInsetsDirectional.symmetric(horizontal: 16)
          : EdgeInsetsDirectional.only(
              start: MediaQuery.sizeOf(context).width / 6,
              end: MediaQuery.sizeOf(context).width / 6,
            ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Recommended".tr(context),
            style: AppStyles.medium20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                AnimationNav.navigatorAnimation(
                  child: const FilterBrandView(),
                ),
              );
            },
            child: Text(
              "see more".tr(context),
              style: AppStyles.medium14.copyWith(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
