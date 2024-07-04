import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

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