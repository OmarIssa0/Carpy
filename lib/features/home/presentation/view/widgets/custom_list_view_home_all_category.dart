import 'package:car_store/core/utils/animation_nav.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/utils/size_config.dart';
import 'package:car_store/features/filter_category/presentation/view/filter_category_view.dart';
import 'package:car_store/features/home/presentation/view/widgets/item_recommended.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/search/presentation/view_model/model/products_model.dart';
import 'package:car_store/features/search/presentation/view_model/provider/product_provider.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.productProvider,
    required this.productsList,
    required this.passeCategoryName,
    required this.argumentName,
  });

  final ProductProvider productProvider;
  final List<ProductsModel> productsList;
  final String passeCategoryName, argumentName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.sizeOf(context).width < SizeConfig.tablet
          ? const EdgeInsetsDirectional.symmetric(horizontal: 16)
          : EdgeInsetsDirectional.only(
              start: MediaQuery.sizeOf(context).width / 6,
              end: MediaQuery.sizeOf(context).width / 6,
            ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  passeCategoryName.tr(context),
                  style: AppStyles.medium20,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    AnimationNav.navigatorAnimation(
                      child: const FilterCategoryView(),
                      context: context,
                      settings: RouteSettings(
                        arguments: argumentName,
                      ),
                    ),
                  );
                },
                child: Text(
                  "see more".tr(context),
                  style: AppStyles.medium14.copyWith(color: Colors.blue),
                ),
              ),
            ],
          ),
          productsList.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text("No Products Found".tr(context)),
                )
              : CarListToo(
                  productProvider: productProvider, productsList: productsList),
        ],
      ),
    );
  }
}

class CarListToo extends StatelessWidget {
  const CarListToo({
    super.key,
    required this.productProvider,
    required this.productsList,
  });

  final ProductProvider productProvider;
  final List<ProductsModel> productsList;

  @override
  Widget build(BuildContext context) {
    return DynamicHeightGridView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      builder: (context, index) {
        return ChangeNotifierProvider.value(
          value: productProvider.getProduct[index],
          child: ItemRecommended(
            // productId: productProvider.getProduct[index].productsId,
            productId: productsList[index].productsId,
          ),
        );
      },
      mainAxisSpacing: 25,
      crossAxisSpacing: 16,
      itemCount: productsList.isEmpty
          ? 0
          : productsList.length == 1
              ? 1
              : productsList.length == 2
                  ? 2
                  : productsList.length == 3
                      ? 3
                      : productsList.length == 4
                          ? 4
                          : productsList.length <= 4
                              ? 4
                              : 4,
      crossAxisCount:
          MediaQuery.sizeOf(context).width < SizeConfig.tablet ? 2 : 3,
    );
  }
}
