import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/utils/size_config.dart';
import 'package:car_store/features/home/presentation/view/widgets/item_recommended.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/search/presentation/view_model/model/products_model.dart';
import 'package:car_store/features/search/presentation/view_model/provider/product_provider.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterBrandViewBody extends StatelessWidget {
  const FilterBrandViewBody({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final passeCategory = ModalRoute.of(context)!.settings.arguments as String?;

    final List<ProductsModel> productsList = passeCategory == null
        ? productProvider.getProduct
        : productProvider.findByBrand(brandName: passeCategory);
    final List<ProductsModel> filteredProductsList =
        productProvider.filterProducts(productsList, true);

    return filteredProductsList.isEmpty
        ? Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text(
                'No Products Found'.tr(context),
                style: AppStyles.semiBold16.copyWith(color: Colors.grey),
              ),
            ),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: DynamicHeightGridView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    builder: (context, index) {
                      return ItemRecommended(
                        productId:
                            // productProvider
                            // .searchController.text.isNotEmpty
                            searchController.text.isNotEmpty
                                ? productProvider
                                    .productListSearch[index].productsId
                                : filteredProductsList[index].productsId,
                      );
                    },
                    mainAxisSpacing: 25,
                    crossAxisSpacing: 16,
                    itemCount: searchController.text.isNotEmpty
                        ? productProvider.productListSearch.length
                        : filteredProductsList.length,
                    crossAxisCount:
                        MediaQuery.sizeOf(context).width < SizeConfig.tablet
                            ? 2
                            : 3,
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          );
  }
}
