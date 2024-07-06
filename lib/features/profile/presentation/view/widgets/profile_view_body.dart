import 'package:car_store/core/utils/animation_nav.dart';
import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/utils/size_config.dart';
import 'package:car_store/core/widgets/drop_down_button.dart';
import 'package:car_store/features/favorite/presentation/view/favorite_view.dart';
import 'package:car_store/features/profile/presentation/view/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: MediaQuery.sizeOf(context).width < SizeConfig.tablet
            ? const EdgeInsetsDirectional.symmetric(horizontal: 12)
            : EdgeInsetsDirectional.only(
                start: MediaQuery.sizeOf(context).width / 6,
                end: MediaQuery.sizeOf(context).width / 6,
              ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(Assets.imagesIconApp),
                ),
                SizedBox(width: 19),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // 'Matilda Brown',
                      'name company',
                      style: AppStyles.medium16,
                    ),
                    Text(
                      "+962799999999",
                      style: AppStyles.medium14,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 33),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColor.kGrayColor.withOpacity(.2),
                // color: AppColor.kBackGroundColorSplash.withOpacity(.3),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  CustomListTile(
                    iconLeading: Icons.favorite,
                    iconTrailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey.shade500,
                    ),
                    title: "Favorite",
                    function: () {
                      Navigator.push(
                          context,
                          AnimationNav.navigatorAnimation(
                              child: const FavoriteView()));
                    },
                  ),
                  CustomListTile(
                      iconLeading: Icons.language,
                      iconTrailing: const DropDownButtonLocal(),
                      title: "language",
                      function: () {}),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.red.withOpacity(.2),
                // color: AppColor.kBackGroundColorSplash.withOpacity(.3),
              ),
              child: CustomListTile(
                iconLeading: IconlyBold.logout,
                iconTrailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey.shade500,
                ),
                title: "logout",
                function: () {
                  Navigator.push(
                      context,
                      AnimationNav.navigatorAnimation(
                          child: const FavoriteView()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
