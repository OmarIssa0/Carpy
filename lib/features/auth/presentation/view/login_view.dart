import 'package:car_store/core/widgets/adaptive_layout_widgets.dart';
import 'package:car_store/features/auth/presentation/view/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => const LoginViewBody(),
        tabletLayout: (context) => const LoginViewBody(),
      ),
    );
  }
}
