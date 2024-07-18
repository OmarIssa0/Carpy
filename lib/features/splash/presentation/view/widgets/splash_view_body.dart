import 'package:car_store/core/utils/animation_nav.dart';
import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/features/auth/presentation/view/login_view.dart';
import 'package:car_store/root_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Center(child: SvgPicture.asset(Assets.imagesIconSplashView));
    return Center(
        child: Image.asset(
      Assets.imagesIconSplashView2,
      height: 150,
      fit: BoxFit.scaleDown,
    ));
  }

  void excuteNavigation() {
    Future.delayed(const Duration(seconds: 3), () {
      // Navigator.pushReplacementNamed(context, LoginView.routeName);
      FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified
          ? Navigator.pushReplacement(
              context, AnimationNav.navigatorAnimation(child: const RootView()))
          : Navigator.pushReplacement(context,
              AnimationNav.navigatorAnimation(child: const LoginView()));
    });
  }
}
