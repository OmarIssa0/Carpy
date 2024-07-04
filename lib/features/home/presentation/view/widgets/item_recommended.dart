import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/features/details/peresentation/view/details_view.dart';
import 'package:car_store/features/search/persentation/view_model/provider/product_provider.dart';
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
    return getCurrentProduct == null
        ? const SizedBox.shrink()
        : GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, DetailsView.routeName,
                  arguments: getCurrentProduct.productsId);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Material(
                color: Colors.white,
                elevation: 2,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          // Assets.imagesFerareCar,
                          getCurrentProduct.imagesProduct[0],
                          height: 90,
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.white70,
                            radius: 18,
                            child: Center(
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite, size: 20)),
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
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.medium14),
                            const SizedBox(height: 2),
                            Text(getCurrentProduct.priceProduct,
                                maxLines: 2,
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
