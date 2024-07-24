import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/widgets/alert_dialog.dart';
import 'package:car_store/features/details/presentation/view/widgets/box_info.dart';
import 'package:car_store/features/details/presentation/view/widgets/image_details.dart';
import 'package:car_store/features/details/presentation/view/widgets/item_details_car.dart';
import 'package:car_store/features/details/presentation/view_model/provider/send_booking_provider.dart';
import 'package:car_store/features/favorite/presentation/view_model/provider/favorite_provider.dart';
import 'package:car_store/features/search/presentation/view_model/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrentProduct = productProvider.findByProductId(productId);
    final providerLocation = Provider.of<SendBookingProvider>(context);

    // Favorite
    final FavoriteProvider favoriteProvider =
        Provider.of<FavoriteProvider>(context);

    return getCurrentProduct == null
        ? const SizedBox.shrink()
        : SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const AdMobBanner(),
                const ImageDetails(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * .7,
                              child: Text(getCurrentProduct.nameProduct,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyles.semiBold22)),
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            radius: 20,
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
                                    if (!context.mounted) return;
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
                                      )
                                    : const Icon(
                                        Icons.favorite_outline,
                                        color: Colors.black,
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("${getCurrentProduct.priceProduct} JOD",
                              style: AppStyles.semiBold20),
                          const SizedBox(width: 5),
                          getCurrentProduct.discount == null
                              ? const SizedBox.shrink()
                              : Text(
                                  getCurrentProduct.discount.toString(),
                                  style: AppStyles.medium14.copyWith(
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemDetailsCar(
                            image: Assets.imagesLocation,
                            title: providerLocation.location ?? "",
                          ),
                          const SizedBox(height: 15),
                          ItemDetailsCar(
                            image: Assets.imagesCardetails,
                            title:
                                "Car details (Model ${getCurrentProduct.modelProduct})",
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      BoxInfo(),
                      const SizedBox(height: 20),
                      Text(
                        getCurrentProduct.descriptionProduct,
                        style: AppStyles.regular16,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          );
  }
}
