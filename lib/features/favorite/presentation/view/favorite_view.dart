import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/widgets/adaptive_layout_widgets.dart';
import 'package:car_store/features/favorite/presentation/view/widgets/favorite_view_body.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  static const routeName = '/favorite_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: const Icon(
        //         IconlyBold.delete,
        //         color: Colors.red,
        //       ))
        // ],
        automaticallyImplyLeading: false,
        title: Text(
          'Favorite'.tr(context),
          style: AppStyles.semiBold24
              .copyWith(color: AppColor.kBackGroundColorSplash),
        ),
        centerTitle: true,
      ),
      body: AdaptiveLayout(
        tabletLayout: (context) => const FavoriteViewBody(),
        mobileLayout: (context) => const FavoriteViewBody(),
      ),
    );
  }
}
