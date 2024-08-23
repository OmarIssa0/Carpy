import 'package:car_store/features/search/presentation/view_model/provider/product_provider.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';

class ImageDetails extends StatelessWidget {
  const ImageDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrentProduct = productProvider.findByProductId(productId);

    return getCurrentProduct == null
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .4,
                child: Swiper(
                  itemCount: getCurrentProduct.imagesProduct.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        SwipeImageGallery(
                          context: context,
                          children: List.generate(
                            getCurrentProduct.imagesProduct.length,
                            (index) => FancyShimmerImage(
                              imageUrl: getCurrentProduct.imagesProduct[index],
                              boxFit: BoxFit.fitWidth,
                              errorWidget: const Icon(Icons.error),
                            ),
                          ),
                        ).show();
                      },
                      child: FancyShimmerImage(
                        imageUrl: getCurrentProduct.imagesProduct[index],
                        errorWidget: const Icon(Icons.error),
                        boxFit: BoxFit.cover,
                      ),
                    );
                  },
                  autoplay: true,
                  // pagination: const SwiperPagination(
                  //   margin: EdgeInsets.all(0),
                  //   builder: SwiperPagination.rect,
                  //   // SwiperCustomPagination(
                  //   //   builder: (context, config) {
                  //   //     return Container(
                  //   //       color: Colors.transparent,
                  //   //       child: Text(
                  //   //           "${config.activeIndex + 1} / ${config.itemCount}"),
                  //   //     );
                  //   //   },
                  //   // ),
                  // ),
                  // pagination: const SwiperPagination(
                  //   alignment: Alignment.bottomCenter,
                  //   builder: DotSwiperPaginationBuilder(
                  //       color: AppColor.kGrayOpacity,
                  //       activeColor: AppColor.kBackGroundColorSplash),
                  // ),
                ),
              ), 
            ),
          );
  }
}
