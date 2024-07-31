import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/features/home/presentation/view_model/model/banner_model.dart';
import 'package:car_store/features/home/presentation/view_model/provider/banner_provider.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwiperHomeViewOne extends StatelessWidget {
  const SwiperHomeViewOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bannerProvider = Provider.of<BannerProvider>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.2,
        child: StreamBuilder<List<BannerModel>>(
          stream: bannerProvider.getAllBannerStreamOne(),
          builder: (context, snapshot) {
            return snapshot.data == null
                ? const SizedBox.shrink()
                : Swiper(
                    itemBuilder: (context, index) {
                      return FancyShimmerImage(
                        imageUrl: snapshot.data![index].image.toString(),
                        boxFit: BoxFit.cover,
                        errorWidget: const Icon(Icons.error),
                      );
                    },
                    autoplay: snapshot.data!.length == 1 ? false : true,
                    // autoplayDelay: 10,
                    pagination: const SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                          color: AppColor.kGrayOpacity,
                          activeColor: AppColor.kBackGroundColorSplash),
                    ),
                    itemCount: snapshot.data?.length ??
                        bannerProvider.getBannerOne.length,
                  );
          },
        ),
      ),
    );
  }
}

class SwiperHomeViewToo extends StatelessWidget {
  const SwiperHomeViewToo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bannerProvider = Provider.of<BannerProvider>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.2,
        child: StreamBuilder<List<BannerModel>>(
          stream: bannerProvider.getAllBannerStreamToo(),
          builder: (context, snapshot) {
            return snapshot.data == null
                ? const SizedBox.shrink()
                : Swiper(
                    itemBuilder: (context, index) {
                      return FancyShimmerImage(
                        imageUrl: snapshot.data![index].image.toString(),
                        boxFit: BoxFit.cover,
                        errorWidget: const Icon(Icons.error),
                      );
                    },
                    autoplay: snapshot.data!.length == 1 ? false : true,
                    // autoplayDelay: 10,
                    pagination: const SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                          color: AppColor.kGrayOpacity,
                          activeColor: AppColor.kBackGroundColorSplash),
                    ),
                    itemCount: snapshot.data?.length ??
                        bannerProvider.getBannerToo.length,
                  );
          },
        ),
      ),
    );
  }
}

class SwiperHomeViewThree extends StatelessWidget {
  const SwiperHomeViewThree({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bannerProvider = Provider.of<BannerProvider>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.2,
        child: StreamBuilder<List<BannerModel>>(
          stream: bannerProvider.getAllBannerStreamThree(),
          builder: (context, snapshot) {
            return snapshot.data == null
                ? const SizedBox.shrink()
                : Swiper(
                    itemBuilder: (context, index) {
                      return FancyShimmerImage(
                        imageUrl: snapshot.data![index].image.toString(),
                        boxFit: BoxFit.cover,
                        errorWidget: const Icon(Icons.error),
                      );
                    },
                    autoplay: snapshot.data!.length == 1 ? false : true,
                    // autoplayDelay: 10,
                    pagination: const SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                          color: AppColor.kGrayOpacity,
                          activeColor: AppColor.kBackGroundColorSplash),
                    ),
                    itemCount: snapshot.data?.length ??
                        bannerProvider.getBannerThree.length,
                  );
          },
        ),
      ),
    );
  }
}
