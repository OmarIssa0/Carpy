import 'package:car_store/core/constant/my_validators.dart';
import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/utils/size_config.dart';
import 'package:car_store/core/widgets/custom_text_filed.dart';
import 'package:car_store/features/auth/presentation/manger/provider/signup_provider.dart';
import 'package:car_store/features/auth/presentation/view/login_view.dart';
import 'package:car_store/features/auth/presentation/view/widgets/forgot_password_button.dart';
import 'package:car_store/features/auth/presentation/view/widgets/google_auth.dart';
import 'package:car_store/features/auth/presentation/view/widgets/or_widgets.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/loading_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpProvider(),
      child: SingleChildScrollView(
        child: Padding(
          padding: MediaQuery.sizeOf(context).width < SizeConfig.tablet
              ? const EdgeInsetsDirectional.symmetric(horizontal: 24)
              : EdgeInsetsDirectional.only(
                  start: MediaQuery.sizeOf(context).width / 6,
                  end: MediaQuery.sizeOf(context).width / 6,
                ),
          child: Consumer<SignUpProvider>(builder: (context, provider, child) {
            return Form(
              key: provider.formKey,
              child: LoadingMangerView(
                isLoading: provider.isLoading,
                child: Column(
                  children: [
                    const SizedBox(height: 44),
                    Image.asset(Assets.imagesSplachImage, height: 76),
                    const SizedBox(height: 95),
                    Text("Sign Up".tr(context), style: AppStyles.semiBold20),
                    Text(
                      "Find your dream car!".tr(context),
                      style: AppStyles.regular14,
                    ),
                    const SizedBox(height: 19),
                    CustomTextFiled(
                      controller: provider.nameTextController,
                      focusNode: provider.nameFocusNode,
                      textInputAction: TextInputAction.next,
                      title: "Full name".tr(context),
                      textInputType: TextInputType.name,
                      prefix: const Icon(
                        IconlyBold.profile,
                        color: AppColor.kSilver,
                      ),
                      onFieldSubmitted: (p0) {
                        FocusScope.of(context)
                            .requestFocus(provider.emailFocusNode);
                      },
                      validator: (p0) {
                        return MyValidators.displayNameValidator(p0, context);
                      },
                    ),
                    const SizedBox(height: 19),
                    CustomTextFiled(
                      controller: provider.emailTextController,
                      focusNode: provider.emailFocusNode,
                      textInputAction: TextInputAction.next,
                      title: "Email address".tr(context),
                      textInputType: TextInputType.emailAddress,
                      prefix: const Icon(
                        IconlyBold.message,
                        color: AppColor.kSilver,
                      ),
                      onFieldSubmitted: (p0) {
                        FocusScope.of(context)
                            .requestFocus(provider.phoneFocusNode);
                      },
                      validator: (p0) {
                        return MyValidators.emailValidator(p0, context);
                      },
                    ),
                    const SizedBox(height: 19),
                    CustomTextFiled(
                      maxLength: 10,
                      controller: provider.phoneTextController,
                      focusNode: provider.phoneFocusNode,
                      textInputAction: TextInputAction.next,
                      title: "Phone number".tr(context),
                      textInputType: TextInputType.phone,
                      prefix: const Icon(
                        IconlyBold.call,
                        color: AppColor.kSilver,
                      ),
                      onFieldSubmitted: (p0) {
                        FocusScope.of(context)
                            .requestFocus(provider.passwordFocusNode);
                      },
                      validator: (p0) {
                        return MyValidators.validateMobile(
                            p0.toString(), context);
                      },
                    ),
                    const SizedBox(height: 19),
                    CustomTextFiled(
                      controller: provider.passwordTextController,
                      focusNode: provider.passwordFocusNode,
                      textInputAction: TextInputAction.done,
                      title: "Password".tr(context),
                      textInputType: TextInputType.visiblePassword,
                      obscureText: provider.obscureText,
                      suffixIcon: IconButton(
                        icon: Icon(
                          provider.obscureText
                              ? IconlyBold.show
                              : IconlyBold.hide,
                          color: AppColor.kSilver,
                        ),
                        onPressed: () {
                          provider.obscureText = !provider.obscureText;
                          // invalid_use_of_visible_for_testing_member
                          // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                          provider.notifyListeners();
                        },
                      ),
                      prefix: const Icon(
                        IconlyBold.password,
                        color: AppColor.kSilver,
                      ),
                      onFieldSubmitted: (p0) {
                        provider.signUpFun(context);
                      },
                      validator: (p0) {
                        return MyValidators.passwordValidator(p0, context);
                      },
                    ),
                    const SizedBox(height: 41),
                    // CustomButton(title: "Sign Up".tr(context)),
                    ForgotPasswordButton(
                      onPressed: () {
                        provider.signUpFun(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Send email".tr(context),
                              style: AppStyles.semiBold16
                                  .copyWith(color: Colors.white)),
                          const SizedBox(height: 5),
                          const Icon(
                            IconlyBold.send,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    const OrSignInAndSignUp(),
                    const SizedBox(height: 12),
                    const GoogleAuth(),
                    const SizedBox(height: 24),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?".tr(context),
                            style: AppStyles.medium14,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, LoginView.routeName);
                            },
                            child: Text(
                              "Sign In".tr(context),
                              style: AppStyles.medium14.copyWith(
                                color: AppColor.kBackGroundColorSplash,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
