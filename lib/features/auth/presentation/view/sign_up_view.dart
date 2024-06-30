import 'package:car_store/core/widgets/adaptive_layout_widgets.dart';
import 'package:car_store/features/auth/presentation/view/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = '/SignUp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => const SignUpViewBody(),
        tabletLayout: (context) => const SignUpViewBody(),
      ),
    );
  }
}
