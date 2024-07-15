import 'dart:developer';

import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/features/home/presentation/view/home_view.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/profile/presentation/view/profile_view.dart';
import 'package:car_store/features/search/persentation/view/search_view.dart';
import 'package:car_store/features/search/persentation/view_model/provider/product_provider.dart';
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
  late PageController _controller;
  int currentScreen = 0;
  bool isLoading = true;

  List<Widget> view = [
    const HomeView(),
    const SearchView(),
    // const FavoriteView(),
    // const MyProductsView(),
    const ProfileView(),
  ];

  Future<void> fetchData() async {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    try {
      Future.wait({
        productProvider.getAllProducts(),
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
    super.initState();
    _controller = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        // physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          setState(() {
            currentScreen = value;
          });
        },
        children: view,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentScreen,
        onDestinationSelected: (value) {
          setState(() {
            // currentScreen = value;
          });
          _controller.animateToPage(value,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
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
          // Badge(
          //   alignment: const Alignment(0, .2),
          //   label: const Text(
          //     "2",
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   child: NavigationDestination(
          //     icon: const Icon(IconlyLight.bag),
          //     label: 'Cart'.tr(context),
          //     selectedIcon: const Icon(IconlyBold.bag,
          //         color: AppColor.kBackGroundColorSplash),
          //   ),
          // ),
          NavigationDestination(
            icon: const Icon(IconlyLight.profile),
            label: 'My Profile'.tr(context),
            selectedIcon: const Icon(IconlyBold.profile,
                color: AppColor.kBackGroundColorSplash),
          ),
        ],
      ),
    );
  }
}
