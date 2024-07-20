import 'dart:developer';

import 'package:car_store/core/utils/animation_nav.dart';
import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/features/auth/presentation/manger/provider/user_provider.dart';
import 'package:car_store/features/auth/presentation/view/login_view.dart';
import 'package:car_store/features/details/peresentation/view_model/provider/send_booking_provider.dart';
import 'package:car_store/features/favorite/presentation/view_model/provider/favorite_provider.dart';
import 'package:car_store/features/search/persentation/view_model/provider/product_provider.dart';
import 'package:car_store/root_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  // bool isLoading = true;

  // Future<void> fetchData() async {
  //   final productProvider =
  //       Provider.of<ProductProvider>(context, listen: false);
  //   // final vendorProvider = Provider.of<VendorProvider>(context, listen: false);
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   final faveProvider = Provider.of<FavoriteProvider>(context, listen: false);
  //   final sendBookingProvider =
  //       Provider.of<SendBookingProvider>(context, listen: false);

  //   try {
  //     Future.wait({
  //       productProvider.getAllProducts(),
  //       userProvider.fetchUserData(),
  //     });
  //     Future.wait({
  //       faveProvider.fetchWishlist(),
  //       sendBookingProvider.fetchBooking(),
  //     });
  //   } catch (e) {
  //     log(e.toString());
  //   } finally {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  // @override
  // void didChangeDependencies() {
  //   if (isLoading) {
  //     fetchData();
  //   }
  //   super.didChangeDependencies();
  // }

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
