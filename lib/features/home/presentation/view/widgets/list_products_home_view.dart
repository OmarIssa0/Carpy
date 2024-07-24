import 'package:car_store/core/utils/size_config.dart';
import 'package:car_store/features/home/presentation/view/widgets/item_recommended.dart';
import 'package:car_store/features/search/presentation/view_model/provider/product_provider.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListProductsHomeView extends StatelessWidget {
  const ListProductsHomeView({
    super.key,
    required this.productProvider,
  });

  final ProductProvider productProvider;

  @override
  Widget build(BuildContext context) {
    return DynamicHeightGridView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      builder: (context, index) {
        return ChangeNotifierProvider.value(
          value: productProvider.getProduct[index],
          child: ItemRecommended(
            productId: productProvider.getProduct[index].productsId,
          ),
        );
      },
      mainAxisSpacing: 25,
      crossAxisSpacing: 16,
      itemCount: productProvider.getProduct.length,
      crossAxisCount:
          MediaQuery.sizeOf(context).width < SizeConfig.tablet ? 2 : 3,
    );
  }
}
