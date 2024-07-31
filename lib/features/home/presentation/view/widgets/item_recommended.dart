import 'package:car_store/core/api/firebase_analytics.dart';
import 'package:car_store/core/utils/animation_nav.dart';
import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/widgets/alert_dialog.dart';
import 'package:car_store/features/details/presentation/view/details_view.dart';
import 'package:car_store/features/favorite/presentation/view_model/provider/favorite_provider.dart';
import 'package:car_store/features/search/presentation/view_model/provider/product_provider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemRecommended extends StatelessWidget {
  const ItemRecommended({
    super.key,
    required this.productId,
  });
  final String productId;

  @override
  Widget build(BuildContext context) {
    // final productModel = Provider.of<ProductsModel>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final getCurrentProduct = productProvider.findByProductId(productId);

    // FavoriteProvider
    FavoriteProvider favoriteProvider = Provider.of<FavoriteProvider>(context);
    final analyticsService = Provider.of<AnalyticsService>(context);

    return getCurrentProduct == null
        ? const SizedBox.shrink()
        : GestureDetector(
            onTap: () {
              // analyticsService.logEvent(
              //   eventName: 'category_product_click',
              //   parameters: {
              //     'app_type': 'users',
              //     'screen_name': 'home',
              //     'product_id': productId,
              //     'product_name': getCurrentProduct.nameProduct,
              //     'product_price': getCurrentProduct.priceProduct,
              //     'product_image': getCurrentProduct.imagesProduct[0],
              //     'product_description': getCurrentProduct.descriptionProduct,
              //   },
              // );
              Navigator.push(
                context,
                AnimationNav.navigatorAnimation(
                  child: const DetailsView(),
                  context: context,
                  settings: RouteSettings(arguments: productId),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Material(
                color: Colors.white,
                elevation: 2,
                child: Column(
                  children: [
                    // const SizedBox(height: 5),
                    Stack(
                      children: [
                        getCurrentProduct.imagesProduct.isEmpty
                            ? const SizedBox.shrink()
                            : FancyShimmerImage(
                                imageUrl: getCurrentProduct.imagesProduct[0],
                                // height:
                                //     MediaQuery.of(context).size.height * 0.22,
                                height: 140,
                                boxFit: BoxFit.fitHeight,
                                errorWidget: const Icon(Icons.error),
                              ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.white70,
                            radius: 18,
                            child: Center(
                              child: IconButton(
                                onPressed: () async {
                                  try {
                                    if (favoriteProvider.getWishlistItem
                                        .containsKey(productId)) {
                                      favoriteProvider
                                          .removeWishlistItemFromFirebase(
                                              wishlistId: favoriteProvider
                                                  .getWishlistItem[productId]!
                                                  .id,
                                              productId: productId);
                                    } else {
                                      favoriteProvider.addToWishlistFirebase(
                                          productId: productId,
                                          context: context);
                                    }
                                    await favoriteProvider.fetchWishlist();
                                  } catch (e) {
                                    AlertDialogMethods.showError(
                                      context: context,
                                      titleBottom: "Ok",
                                      lottileAnimation: Assets.imagesErrorMas,
                                      subtitle: e.toString(),
                                      function: () {
                                        Navigator.pop(context);
                                      },
                                    );
                                  }
                                },
                                icon: favoriteProvider.isProductInWishlist(
                                        productId: productId)
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 20,
                                      )
                                    : const Icon(
                                        Icons.favorite_outline,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(height: 10),
                            Text(getCurrentProduct.nameProduct,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.medium14),
                            const SizedBox(height: 2),
                            Text("${getCurrentProduct.priceProduct} JOD",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.medium12),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
