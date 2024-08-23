// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';
import 'package:car_store/core/service/adMob_provider.dart';
import 'package:car_store/core/service/widgets_ad_banner.dart';
import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/features/auth/presentation/manger/provider/user_provider.dart';
import 'package:car_store/features/details/presentation/view_model/provider/send_booking_provider.dart';
import 'package:car_store/features/favorite/presentation/view/favorite_view.dart';
import 'package:car_store/features/favorite/presentation/view_model/provider/favorite_provider.dart';
import 'package:car_store/features/home/presentation/view/home_view.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/my_booking/presentation/view/my_booking_view.dart';
import 'package:car_store/features/search/presentation/view/search_view.dart';
import 'package:car_store/features/search/presentation/view_model/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class RootView extends StatefulWidget {
  static String routeName = '/RootView';
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  // final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  late PageController _controller;
  int currentScreen = 0;

  List<Widget> view = [
    const HomeView(),
    const SearchView(),
    const MyBookingView(),
    // const ProfileView(),
    const FavoriteView(),
  ];
  bool isLoading = true;
  // BannerAd? bannerAd;
  // bool isLoaded = false;

  // void loadBannerAd() {
  //   bannerAd = BannerAd(
  //     size: AdSize.banner,
  //     adUnitId: AdManger.appId,
  //     listener: BannerAdListener(
  //       onAdLoaded: (ad) {
  //         setState(() {
  //           isLoaded = true;
  //         });
  //       },
  //       onAdFailedToLoad: (ad, error) {
  //         ad.dispose();
  //       },
  //     ),
  //     request: const AdRequest(),
  //   );
  //   bannerAd!.load();
  // }

  Future<void> fetchData() async {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    // final vendorProvider = Provider.of<VendorProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final faveProvider = Provider.of<FavoriteProvider>(context, listen: false);
    final sendBookingProvider =
        Provider.of<SendBookingProvider>(context, listen: false);

    try {
      Future.wait({
        productProvider.getAllProducts(),
        userProvider.fetchUserData(),
      });
      Future.wait({
        faveProvider.fetchWishlist(),
        sendBookingProvider.fetchBooking(),
      });
    } catch (e) {
      log(e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void didChangeDependencies() {
    if (isLoading) {
      fetchData();
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // analytics.setAnalyticsCollectionEnabled(true);
    // loadBannerAd();

    super.initState();
    _controller = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    final sendBookingProvider = Provider.of<SendBookingProvider>(context);
    // final bannerAd = adProvider.createBannerAd();
    return Consumer<AdProvider>(builder: (context, adProvider, child) {
      return Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              // physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  currentScreen = value;
                });
              },
              children: view,
            ),
            // const Positioned(
            //   bottom: 0,
            //   left: 0,
            //   right: 0,
            //   child: AdMobBanner(),
            // ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: currentScreen,
          onDestinationSelected: (value) {
            setState(() {
              // currentScreen = value;
            });
            _controller.animateToPage(value,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          },
          indicatorColor: Theme.of(context).scaffoldBackgroundColor,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          // backgroundColor: AppColor.kWhite,
          elevation: 0,
          destinations: [
            NavigationDestination(
              enabled: true,
              icon: const Icon(IconlyLight.home),
              label: 'Home'.tr(context),
              selectedIcon: const Icon(IconlyBold.home,
                  color: AppColor.kBackGroundColorSplash),
            ),
            NavigationDestination(
              icon: const Icon(IconlyLight.search),
              label: 'Search'.tr(context),
              selectedIcon: const Icon(IconlyBold.search,
                  color: AppColor.kBackGroundColorSplash),
            ),
            sendBookingProvider.data.isEmpty
                ? NavigationDestination(
                    icon: const Icon(IconlyLight.edit),
                    label: 'Bookings'.tr(context),
                    selectedIcon: const Icon(IconlyBold.edit,
                        color: AppColor.kBackGroundColorSplash),
                  )
                : Badge(
                    alignment: const Alignment(-0.1, 0),
                    label: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        sendBookingProvider.data.length.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    child: NavigationDestination(
                      icon: const Icon(IconlyLight.edit),
                      label: 'Bookings'.tr(context),
                      selectedIcon: const Icon(IconlyBold.edit,
                          color: AppColor.kBackGroundColorSplash),
                    ),
                  ),
            NavigationDestination(
              icon: const Icon(IconlyLight.heart),
              label: 'Favorite'.tr(context),
              selectedIcon: const Icon(
                IconlyBold.heart,
                color: Colors.red,
                // color: AppColor.kBackGroundColorSplash,
              ),
            ),
          ],
        ),
      );
    });
  }
}
