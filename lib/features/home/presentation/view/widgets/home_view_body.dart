import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/utils/size_config.dart';
import 'package:car_store/features/home/presentation/view/widgets/item_recommended.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const ListFeatured(),
          Padding(
            padding: MediaQuery.sizeOf(context).width < SizeConfig.tablet
                ? const EdgeInsetsDirectional.symmetric(horizontal: 16)
                : EdgeInsetsDirectional.only(
                    start: MediaQuery.sizeOf(context).width / 6,
                    end: MediaQuery.sizeOf(context).width / 6,
                  ),
            child: const SwiperHomeView(),
          ),
          const SizedBox(height: 34),
          Padding(
            padding: MediaQuery.sizeOf(context).width < SizeConfig.tablet
                ? const EdgeInsetsDirectional.symmetric(horizontal: 16)
                : EdgeInsetsDirectional.only(
                    start: MediaQuery.sizeOf(context).width / 6,
                    end: MediaQuery.sizeOf(context).width / 6,
                  ),
            child: Text(
              "Recommended".tr(context),
              style: AppStyles.medium20,
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: DynamicHeightGridView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              builder: (context, index) {
                return const ItemRecommended();
              },
              mainAxisSpacing: 25,
              crossAxisSpacing: 16,
              itemCount: 25,
              crossAxisCount:
                  MediaQuery.sizeOf(context).width < SizeConfig.tablet ? 2 : 3,
            ),
          ),
        ],
      ),
    );
  }
}

class SwiperHomeView extends StatelessWidget {
  const SwiperHomeView({
    super.key,
  });
  static List<String> images = [
    Assets.imagesBannar1,
    Assets.imagesBanner2,
    Assets.imagesBanner3,
  ];
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.2,
        child: Swiper(
          itemBuilder: (context, index) {
            return Image.asset(
              images[index],
              fit: BoxFit.fill,
            );
          },
          autoplay: true,
          // autoplayDelay: 3,
          pagination: const SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
                color: AppColor.kGrayOpacity,
                activeColor: AppColor.kBackGroundColorSplash),
          ),
          itemCount: 3,
        ),
      ),
    );
  }
}
