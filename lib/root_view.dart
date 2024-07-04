// import 'package:car_store/core/utils/size_config.dart';
// import 'package:car_store/features/favorite/presentation/view/favorite_view.dart';
// import 'package:car_store/features/home/presentation/view/home_view.dart';
// import 'package:car_store/features/profile/presentation/view/profile_view.dart';
// import 'package:car_store/features/search/persentation/view/search_view.dart';
// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:iconly/iconly.dart';

// class RootView extends StatefulWidget {
//   const RootView({super.key});

//   static String routeName = '/kRoot';

//   @override
//   State<RootView> createState() => _RootViewState();
// }

// class _RootViewState extends State<RootView> {
//   late PageController controller;
//   int currentScreen = 0;
//   bool isLoading = true;
//   List<Widget> screen = [
//     const HomeView(),
//     const SearchView(),
//     const FavoriteView(),
//     const ProfileView(),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     controller = PageController(
//       initialPage: currentScreen,
//     );
//   }

//   // Future<void> fetchFCT() async {
//   //   final productsProvider =
//   //       Provider.of<ProductProvider>(context, listen: false);
//   //   final cartProvider = Provider.of<CartProvider>(context, listen: false);
//   //   final wishlistProvider =
//   //       Provider.of<WishlistProvider>(context, listen: false);
//   //   final userProvider = Provider.of<UserProvider>(context, listen: false);
//   //   try {
//   //     Future.wait({
//   //       productsProvider.fetchProducts(),
//   //       userProvider.fatchUserInfo(),
//   //     });
//   //     Future.wait({
//   //       cartProvider.fetchCart(),
//   //       wishlistProvider.fetchWishlist(),
//   //     });
//   //   } catch (error) {
//   //     log(error.toString());
//   //   } finally {
//   //     setState(() {
//   //       isLoading = false;
//   //     });
//   //   }
//   // }

//   // @override
//   // void didChangeDependencies() {
//   //   if (isLoading) {
//   //     fetchFCT();
//   //   }

//   //   super.didChangeDependencies();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       resizeToAvoidBottomInset: false,
//       backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//       bottomNavigationBar: SafeArea(
//         bottom: true,
//         child: Padding(
//           // padding: const EdgeInsets.all(22.0),
//           padding: MediaQuery.sizeOf(context).width < SizeConfig.tablet
//               ? const EdgeInsetsDirectional.only(start: 22, end: 22, bottom: 22)
//               : EdgeInsetsDirectional.only(
//                   start: MediaQuery.sizeOf(context).width / 6,
//                   end: MediaQuery.sizeOf(context).width / 6,
//                   bottom: 22,
//                 ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(25),
//             child: GNav(
//               selectedIndex: currentScreen,
//               // iconSize: 24.spMin,
//               onTabChange: (index) {
//                 setState(() {
//                   currentScreen = index;
//                 });
//                 controller.jumpToPage(currentScreen);
//               },
//               activeColor: Colors.white,
//               // activeColor: AppColor.kBackGroundColorSplash,
//               backgroundColor: const Color(0xff121212).withOpacity(.75),
//               // backgroundColor: const Color(0xffFFFFFF), //.withOpacity(.75),
//               color: const Color(0xff888888).withOpacity(1),
//               tabs: const [
//                 GButton(
//                   icon: IconlyBold.home,
//                 ),
//                 GButton(
//                   icon: IconlyBold.search,
//                 ),
//                 GButton(
//                   icon: IconlyBold.heart,
//                 ),
//                 GButton(
//                   icon: IconlyBold.profile,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: PageView(
//         physics: const NeverScrollableScrollPhysics(),
//         controller: controller,
//         children: screen,
//       ),
//     );
//   }
// }
import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/features/home/presentation/view/home_view.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/profile/presentation/view/profile_view.dart';
import 'package:car_store/features/search/persentation/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class RootView extends StatefulWidget {
  static String routeName = '/RootView';
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  late PageController _controller;
  int currentScreen = 0;

  List<Widget> view = [
    const HomeView(),
    const SearchView(),
    // const FavoriteView(),
    // const MyProductsView(),
    const ProfileView(),
  ];

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
