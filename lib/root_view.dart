import 'package:car_store/features/home/presentation/view/home_view.dart';
import 'package:car_store/features/search/persentation/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconly/iconly.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  static String routeName = '/kRoot';

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  late PageController controller;
  int currentScreen = 0;
  bool isLoading = true;
  List<Widget> screen = [
    const HomeView(),
    const SearchView(),
    // const CartView(),
    // const ProfileView(),
  ];

  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: currentScreen,
    );
  }

  // Future<void> fetchFCT() async {
  //   final productsProvider =
  //       Provider.of<ProductProvider>(context, listen: false);
  //   final cartProvider = Provider.of<CartProvider>(context, listen: false);
  //   final wishlistProvider =
  //       Provider.of<WishlistProvider>(context, listen: false);
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   try {
  //     Future.wait({
  //       productsProvider.fetchProducts(),
  //       userProvider.fatchUserInfo(),
  //     });
  //     Future.wait({
  //       cartProvider.fetchCart(),
  //       wishlistProvider.fetchWishlist(),
  //     });
  //   } catch (error) {
  //     log(error.toString());
  //   } finally {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  // @override
  // void didChangeDependencies() {
  //   if (isLoading) {
  //     fetchFCT();
  //   }

  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: GNav(
              selectedIndex: currentScreen,
              // iconSize: 24.spMin,
              onTabChange: (index) {
                setState(() {
                  currentScreen = index;
                });
                controller.jumpToPage(currentScreen);
              },
              activeColor: Colors.white,
              // activeColor: AppColor.kBackGroundColorSplash,
              backgroundColor: const Color(0xff121212).withOpacity(.75),
              // backgroundColor: const Color(0xffFFFFFF), //.withOpacity(.75),
              color: const Color(0xff888888).withOpacity(1),
              tabs: const [
                GButton(
                  icon: IconlyBold.home,
                ),
                GButton(
                  icon: IconlyBold.search,
                ),
                GButton(
                  icon: IconlyBold.heart,
                ),
                GButton(
                  icon: IconlyBold.profile,
                ),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: screen,
      ),
    );
  }
}
