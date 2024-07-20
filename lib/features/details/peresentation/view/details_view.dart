import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/widgets/adaptive_layout_widgets.dart';
import 'package:car_store/core/widgets/alert_dialog.dart';
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
                  Future.delayed(
                    const Duration(days: 2),
                    () {
                      provider.removeBooking(
                        productId: productId,
                        bookingId: provider.data[productId]!.id,
                        context: context,
                        vendorID: getCurrentProduct!.userId,
                      );
                    },
                  );
                  provider.isProductBooking(productId: productId)
                      ? provider.removeBooking(
                          productId: productId,
                          bookingId: provider.data[productId]!.id,
                          context: context,
                          vendorID: getCurrentProduct!.userId,
                        )
                      : AlertDialogMethods.showDialogWaring(
                          isError: false,
                          context: context,
                          titleBottom: "Book now".tr(context),
                          subtitle: "Do you want to reserve this product?"
                              .tr(context),
                          lottileAnimation: Assets.imagesDone,
                          function: () async {
                            try {
                              if (provider.isProductBooking(
                                  productId: productId)) {
                                provider.removeBooking(
                                  productId: productId,
                                  bookingId: provider.data[productId]!.id,
                                  context: context,
                                  vendorID: getCurrentProduct!.userId,
                                );
                              } else {
                                provider.sendBookingFirebase(
                                    productId: productId,
                                    context: context,
                                    vendorID: getCurrentProduct!.userId);
                              }
                              await provider.fetchBooking();
                            } catch (e) {
                              AlertDialogMethods.showError(
                                context: context,
                                titleBottom: "Ok",
                                lottileAnimation: Assets.imagesQuestionMark,
                                subtitle: e.toString(),
                                function: () {
                                  Navigator.pop(context);
                                },
                              );
                            }
                            Navigator.of(context).pop();
                          },
                        );
                },
              );
            }),
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.share),
        //   )
        // ],
      ),
      body: AdaptiveLayout(
        mobileLayout: (context) => const DetailsViewBody(),
        tabletLayout: (context) => const DetailsViewBody(),
      ),
    );
  }
}
