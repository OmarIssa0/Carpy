import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/widgets/adaptive_layout_widgets.dart';
import 'package:car_store/features/auth/presentation/manger/provider/user_provider.dart';
import 'package:car_store/features/details/presentation/view/widgets/add_favorite_widgets.dart';
import 'package:car_store/features/details/presentation/view/widgets/booking_button_details_view.dart';
import 'package:car_store/features/details/presentation/view/widgets/details_view_body.dart';
import 'package:car_store/features/details/presentation/view_model/provider/fetch_vendor_provider.dart';
import 'package:car_store/features/favorite/presentation/view_model/provider/favorite_provider.dart';
import 'package:car_store/features/search/presentation/view_model/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});
  static const String routeName = 'details_view';

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    // final userProvider = Provider.of<UserProvider>(context);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrentProduct = productProvider.findByProductId(productId);
    final FavoriteProvider favoriteProvider =
        Provider.of<FavoriteProvider>(context);
    return Scaffold(
      bottomNavigationBar: getCurrentProduct?.isSwitchReservation == false
          ? const SizedBox.shrink()
          : SafeArea(
              bottom: true,
              child: Container(
                padding: const EdgeInsetsDirectional.only(start: 26),
                height: 60,
                // color: Colors.red,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: BookingButtonDetailsView(
                          productId: productId,
                          userProvider: userProvider,
                          getCurrentProduct: getCurrentProduct),
                    ),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 16),
                      child: addFavoriteWidgets(
                          favoriteProvider, productId, context),
                    ),
                  ],
                ),
              ),
            ),
      appBar: AppBar(
        title: Text(
          getCurrentProduct!.nameProduct,
          style: AppStyles.medium18,
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        actions: [
          getCurrentProduct.isSwitchReservation == true
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child:
                      addFavoriteWidgets(favoriteProvider, productId, context),
                ),
        ],
      ),
      body: ChangeNotifierProvider<FetchVendorDetails>(
        create: (context) => FetchVendorDetails(),
        child: AdaptiveLayout(
          mobileLayout: (context) => const DetailsViewBody(),
          tabletLayout: (context) => const DetailsViewBody(),
        ),
      ),
    );
  }
}
