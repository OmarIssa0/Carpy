import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/widgets/custom_button.dart';
import 'package:car_store/core/widgets/custom_text_filed.dart';
import 'package:car_store/features/auth/presentation/view/forget_password_view.dart';
import 'package:car_store/features/auth/presentation/view/sign_up_view.dart';
import 'package:car_store/features/auth/presentation/view/widgets/or_widgets.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/root_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:iconly/iconly.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

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
            Text("Login".tr(context), style: AppStyles.semiBold20),
            Text("Welcome to CarStore ".tr(context),
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
            const SizedBox(height: 24),
            CustomTextFiled(
              title: "Password".tr(context),
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
              prefix: const Icon(
                IconlyBold.password,
                color: AppColor.kSilver,
              ),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ForgetPasswordView.routeName);
                },
                child: Text("Forgot Password?".tr(context),
                    style: AppStyles.medium14.copyWith(color: AppColor.kBlack)),
              ),
            ),
            const SizedBox(height: 24),
            CustomButton(
              title: 'Login'.tr(context),
              onPressed: () {
                Navigator.pushNamed(context, RootView.routeName);
              },
            ),
            const SizedBox(height: 45),
            const OrSignInAndSignUp(),
            const SizedBox(height: 12),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 28,
              child: Image.asset(
                Assets.imagesGoogle,
                height: 48,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don’t have an account?".tr(context),
                    style: AppStyles.medium14),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignUpView.routeName);
                  },
                  child: Text(" Sign Up".tr(context),
                      style: AppStyles.medium14
                          .copyWith(color: AppColor.kBackGroundColorSplash)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}