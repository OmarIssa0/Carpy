import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/features/auth/presentation/view/login_view.dart';
import 'package:car_store/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const CarApp());
}

class CarApp extends StatelessWidget {
  const CarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColor.kBackGroundColorSplash,
            ),
            useMaterial3: true,
            fontFamily: 'Poppins',
            scaffoldBackgroundColor: const Color(0xffF9FAFB)),
        debugShowCheckedModeBanner: false,
        initialRoute: SplashView.routeName,
        routes: {
          SplashView.routeName: (context) => const SplashView(),
          LoginView.routeName: (context) => const LoginView(),
        },
      ),
    );
  }
}
