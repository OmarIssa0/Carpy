import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/widgets/alert_dialog.dart';
import 'package:car_store/features/details/peresentation/view_model/provider/send_booking_provider.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/search/persentation/view_model/model/products_model.dart';
import 'package:flutter/material.dart';

void bookingButton(SendBookingProvider provider, String productId,
    BuildContext context, ProductsModel? getCurrentProduct) {
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
          subtitle: "Do you want to reserve this product?".tr(context),
          lottileAnimation: Assets.imagesDone,
          function: () async {
            try {
              if (provider.isProductBooking(productId: productId)) {
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
}
