import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/utils/size_config.dart';
import 'package:car_store/features/details/presentation/view_model/provider/send_booking_provider.dart';
import 'package:car_store/features/home/presentation/view/widgets/item_recommended.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MyBookingViewBody extends StatelessWidget {
  const MyBookingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final sendBookingProvider = Provider.of<SendBookingProvider>(context);
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: MediaQuery.sizeOf(context).width < SizeConfig.tablet
                ? const EdgeInsetsDirectional.symmetric(horizontal: 12)
                : EdgeInsetsDirectional.only(
                    start: MediaQuery.sizeOf(context).width / 6,
                    end: MediaQuery.sizeOf(context).width / 6,
                  ),
            child: sendBookingProvider.data.isEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset(Assets.imagesCarblue, fit: BoxFit.scaleDown),
                      Text(
                        "No Products Found".tr(context),
                        style:
                            AppStyles.semiBold16.copyWith(color: Colors.grey),
                      ),
                    ],
                  )
                : DynamicHeightGridView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    builder: (context, index) {
                      return ItemRecommended(
                        productId: sendBookingProvider.data.values
                            .toList()[index]
                            .productId,
                      );
                    },
                    mainAxisSpacing: 25,
                    crossAxisSpacing: 16,
                    itemCount: sendBookingProvider.data.length,
                    crossAxisCount: 2,
                  ),
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
