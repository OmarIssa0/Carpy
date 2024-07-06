import 'package:car_store/core/utils/size_config.dart';
import 'package:car_store/features/favorite/presentation/view_model/provider/favorite_provider.dart';
import 'package:car_store/features/home/presentation/view/widgets/item_recommended.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteProvider favoriteProvider =
        Provider.of<FavoriteProvider>(context);
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: MediaQuery.sizeOf(context).width < SizeConfig.tablet
                ? const EdgeInsetsDirectional.symmetric(horizontal: 12)
                : EdgeInsetsDirectional.only(
                    start: MediaQuery.sizeOf(context).width / 6,
                    end: MediaQuery.sizeOf(context).width / 6,
                  ),
            child: DynamicHeightGridView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              builder: (context, index) {
                return ItemRecommended(
                  productId: favoriteProvider.favoriteList.values
                      .toList()[index]
                      .productId,
                );
              },
              mainAxisSpacing: 25,
              crossAxisSpacing: 16,
              itemCount: favoriteProvider.favoriteList.length,
              crossAxisCount: 2,
            ),
          ),
        ),
      ],
    );
  }
}
