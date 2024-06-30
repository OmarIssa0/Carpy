import 'package:car_store/core/widgets/adaptive_layout_widgets.dart';
import 'package:car_store/features/auth/presentation/view/widgets/forget_password_view_body.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const routeName = '/ForgetPasswordView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => const ForgetPasswordViewBody(),
        tabletLayout: (context) => const ForgetPasswordViewBody(),
      ),
    );
  }
}
