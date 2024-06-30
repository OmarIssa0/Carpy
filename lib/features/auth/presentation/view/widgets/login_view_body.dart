import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/widgets/custom_button.dart';
import 'package:car_store/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';
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
            const Text("Login ", style: AppStyles.semiBold20),
            const Text("Welcome to CarStore ", style: AppStyles.regular14),
            const SizedBox(height: 44),
            const CustomTextFiled(
              title: "Email address",
              textInputType: TextInputType.emailAddress,
              prefix: Icon(
                IconlyBold.profile,
                color: AppColor.kSilver,
              ),
            ),
            const SizedBox(height: 24),
            const CustomTextFiled(
              title: "Password",
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
              prefix: Icon(
                IconlyBold.password,
                color: AppColor.kSilver,
              ),
            ),
            const SizedBox(height: 24),
            Text("Forgot Password?",
                style: AppStyles.medium14.copyWith(color: AppColor.kBlack)),
            const SizedBox(height: 24),
            const CustomButton(title: 'Login'),
            const SizedBox(height: 45),
            const OrSignInAndSignUp(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don’t have an account?", style: AppStyles.medium14),
                Text(" Sign Up",
                    style: AppStyles.medium14
                        .copyWith(color: AppColor.kBackGroundColorSplash)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrSignInAndSignUp extends StatelessWidget {
  const OrSignInAndSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            thickness: .5,
            color: Color(0xffc4c4c4),
            endIndent: 12,
          ),
        ),
        Text("OR", style: AppStyles.regular12),
        Expanded(
          child: Divider(
            thickness: .5,
            indent: 12,
            color: Color(0xffc4c4c4),
          ),
        ),
      ],
    );
  }
}
