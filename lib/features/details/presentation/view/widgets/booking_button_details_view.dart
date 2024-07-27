import 'package:car_store/core/constant/my_function.dart';
import 'package:car_store/core/constant/my_validators.dart';
import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/widgets/alert_dialog.dart';
import 'package:car_store/core/widgets/custom_button.dart';
import 'package:car_store/core/widgets/custom_text_filed.dart';
import 'package:car_store/features/auth/presentation/manger/provider/user_provider.dart';
import 'package:car_store/features/auth/presentation/view/login_view.dart';
import 'package:car_store/features/details/presentation/view_model/provider/send_booking_provider.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/search/presentation/view_model/model/products_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingButtonDetailsView extends StatelessWidget {
  const BookingButtonDetailsView({
    super.key,
    required this.productId,
    required this.userProvider,
    required this.getCurrentProduct,
  });

  final String productId;
  final UserProvider userProvider;
  final ProductsModel? getCurrentProduct;

  @override
  Widget build(BuildContext context) {
    return Consumer<SendBookingProvider>(builder: (context, provider, child) {
      return CustomButton(
        title: provider.isProductBooking(productId: productId)
            ? "cancellation of reservation".tr(context)
            : "Book now".tr(context),
        color: provider.isProductBooking(productId: productId)
            ? Colors.red
            : AppColor.kBackGroundColorSplash,
        onPressed: () async {
          final auth = FirebaseAuth.instance.currentUser;
          if (auth!.isAnonymous == true) {
            AlertDialogMethods.showError(
              context: context,
              subtitle: "User not found".tr(context),
              titleBottom: "Sign In".tr(context),
              lottileAnimation: Assets.imagesErrorMas,
              function: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(LoginView.routeName);
              },
            );
          } else {
            if (userProvider.getUserModel?.userPhone == null ||
                userProvider.getUserModel?.userPhone == "") {
              showModalBottomSheet(
                  scrollControlDisabledMaxHeightRatio: double.infinity,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  showDragHandle: true,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding:
                          const EdgeInsetsDirectional.symmetric(horizontal: 24),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              "Place your phone number".tr(context),
                            ),
                            const SizedBox(height: 15),
                            CustomTextFiled(
                              controller: provider.phoneTextController,
                              title: "Phone number".tr(context),
                              textInputType: TextInputType.phone,
                              maxLength: 10,
                              prefix: const Icon(
                                Icons.phone,
                                color: AppColor.kSilver,
                              ),
                              textInputAction: TextInputAction.done,
                              validator: (p0) {
                                return MyValidators.validateMobile(
                                    p0!, context);
                              },
                            ),
                            const SizedBox(height: 30),
                            // const Spacer(),
                            CustomButton(
                              onPressed: () async {
                                if (provider.phoneTextController.text.length ==
                                        10 &&
                                    provider
                                        .phoneTextController.text.isNotEmpty) {
                                  await FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(userProvider.getUserModel!.userId)
                                      .update({
                                    "userPhone":
                                        provider.phoneTextController.text,
                                  });
                                  if (!context.mounted) return;
                                  userProvider.fetchUserData();
                                  Navigator.of(context).pop();
                                }
                              },
                              title: "Save".tr(context),
                              color: AppColor.kBackGroundColorSplash,
                            ),
                            // const SizedBox(height: 15),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).viewInsets.bottom +
                                        10),
                          ],
                        ),
                      ),
                    );
                  });

              return;
            }
            userProvider.fetchUserData();
            bookingButton(provider, productId, context, getCurrentProduct);
          }
        },
      );
    });
  }
}
