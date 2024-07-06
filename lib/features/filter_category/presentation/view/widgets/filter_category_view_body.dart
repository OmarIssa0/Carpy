import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/utils/size_config.dart';
import 'package:car_store/features/home/presentation/view/widgets/item_recommended.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/search/persentation/view_model/model/products_model.dart';
import 'package:car_store/features/search/persentation/view_model/provider/product_provider.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterCategoryViewBody extends StatelessWidget {
  const FilterCategoryViewBody({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final passeCategory = ModalRoute.of(context)!.settings.arguments as String?;

    final List<ProductsModel> productsList = passeCategory == null
        ? productProvider.getProduct
        : productProvider.findByCategory(
            context: context, categoryName: passeCategory);
    return productsList.isEmpty
        ? Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text(
                'No Products Found'.tr(context),
                style: AppStyles.semiBold16.copyWith(color: Colors.grey),
              ),
            ),
          )
        // : productProvider.searchController.text.isNotEmpty &&
        : searchController.text.isNotEmpty &&
                productProvider.productListSearch.isEmpty
            ? Center(
                child: Text(
                'No Products Found'.tr(context),
                style: AppStyles.semiBold16.copyWith(color: Colors.grey),
              ))
            : SingleChildScrollView(
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
                              : productsList[index].productsId,
                    );
                  },
                  mainAxisSpacing: 25,
                  crossAxisSpacing: 16,
                  itemCount: searchController.text.isNotEmpty
                      // productProvider.searchController.text.isNotEmpty
                      ? productProvider.productListSearch.length
                      : productsList.length,
                  crossAxisCount:
                      MediaQuery.sizeOf(context).width < SizeConfig.tablet
                          ? 2
                          : 3,
                ),
              );
  }
}
