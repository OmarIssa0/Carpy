import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/widgets/adaptive_layout_widgets.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/my_booking/presentation/view/widgets/my_booking_view_body.dart';
import 'package:flutter/material.dart';

class MyBookingView extends StatelessWidget {
  const MyBookingView({super.key});
  static const routeName = '/MyBookingView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          'Booking requests'.tr(context),
          style: AppStyles.semiBold24
              .copyWith(color: AppColor.kBackGroundColorSplash),
        ),
        centerTitle: true,
      ),
      body: AdaptiveLayout(
        mobileLayout: (context) => const MyBookingViewBody(),
        tabletLayout: (context) => const MyBookingViewBody(),
      ),
    );
  }
}
