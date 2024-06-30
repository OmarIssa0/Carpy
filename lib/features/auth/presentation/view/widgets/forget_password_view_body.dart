import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/widgets/custom_text_filed.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 44),
            Image.asset(Assets.imagesNewIconApp, height: 76),
            const SizedBox(height: 95),
            Text("Forgot Password".tr(context), style: AppStyles.semiBold20),
            const SizedBox(height: 5),
            Text(
                "Please enter the email address you'd like your password reset information sent to"
                    .tr(context),
                textAlign: TextAlign.center,
                style: AppStyles.regular14),
            const SizedBox(height: 44),
            CustomTextFiled(
              title: "Email address".tr(context),
              textInputType: TextInputType.emailAddress,
              prefix: const Icon(
                IconlyBold.message,
                color: AppColor.kSilver,
              ),
            ),
            const SizedBox(height: 44),
            ForgotPasswordButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Send email".tr(context),
                      style:
                          AppStyles.semiBold16.copyWith(color: Colors.white)),
                  const SizedBox(height: 5),
                  const Icon(
                    IconlyBold.send,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: AppColor.kBackGroundColorSplash),
        child: child,
        onPressed: () {},
      ),
    );
  }
}
