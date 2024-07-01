import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';

class ImageDetails extends StatelessWidget {
  const ImageDetails({
    super.key,
  });

  static List<String> item = [
    Assets.imagesFerareCar,
    Assets.imagesTesla,
    Assets.imagesCarTest
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .4,
          child: Swiper(
            itemCount: 3,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  SwipeImageGallery(
                    context: context,
                    children: List.generate(
                        item.length,
                        (index) => Image.asset(
                              item[index],
                              fit: BoxFit.fitWidth,
                            )),
                    // [
                    //   Image.asset(Assets.imagesFerareCar),
                    // ],
                  ).show();
                },
                // child: Image.asset(Assets.imagesFerareCar, fit: BoxFit.cover),
                child: Image.asset(item[index], fit: BoxFit.cover),
              );
            },
            autoplay: true,
            pagination: const SwiperPagination(
              alignment: Alignment.bottomCenter,
              builder: DotSwiperPaginationBuilder(
                  color: AppColor.kGrayOpacity,
                  activeColor: AppColor.kBackGroundColorSplash),
            ),
          ),
        ),
      ),
    );
  }
}
