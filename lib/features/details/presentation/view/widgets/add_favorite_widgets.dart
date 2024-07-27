 import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/widgets/alert_dialog.dart';
import 'package:car_store/features/favorite/presentation/view_model/provider/favorite_provider.dart';
import 'package:flutter/material.dart';

CircleAvatar addFavoriteWidgets(FavoriteProvider favoriteProvider,
      String productId, BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade300,
      radius: 20,
      child: Center(
        child: IconButton(
          onPressed: () async {
            try {
              if (favoriteProvider.getWishlistItem.containsKey(productId)) {
                favoriteProvider.removeWishlistItemFromFirebase(
                    wishlistId: favoriteProvider.getWishlistItem[productId]!.id,
                    productId: productId);
              } else {
                favoriteProvider.addToWishlistFirebase(
                    productId: productId, context: context);
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
          icon: favoriteProvider.isProductInWishlist(productId: productId)
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
    );
  }
