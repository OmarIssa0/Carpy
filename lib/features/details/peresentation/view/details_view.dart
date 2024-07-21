import 'package:car_store/core/constant/my_function.dart';
import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/widgets/adaptive_layout_widgets.dart';
import 'package:car_store/core/widgets/custom_button.dart';
import 'package:car_store/features/details/peresentation/view/widgets/details_view_body.dart';
import 'package:car_store/features/details/peresentation/view_model/provider/send_booking_provider.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/search/persentation/view_model/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});
  static const String routeName = 'details_view';

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrentProduct = productProvider.findByProductId(productId);

    return Scaffold(
      bottomNavigationBar: getCurrentProduct?.isSwitchReservation == false
          ? const SizedBox.shrink()
          : Consumer<SendBookingProvider>(builder: (context, provider, child) {
              return CustomButton(
                title: provider.isProductBooking(productId: productId)
                    ? "cancellation of reservation".tr(context)
                    : "Book now".tr(context),
                color: provider.isProductBooking(productId: productId)
                    ? Colors.red
                    : AppColor.kBackGroundColorSplash,
                onPressed: () async {
                  bookingButton(
                      provider, productId, context, getCurrentProduct);
                },
              );
            }),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),
      body: AdaptiveLayout(
        mobileLayout: (context) => const DetailsViewBody(),
        tabletLayout: (context) => const DetailsViewBody(),
      ),
    );
  }
}
