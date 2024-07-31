import 'package:car_store/core/utils/animation_nav.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/features/filter_category/presentation/view/filter_brand_view.dart';
import 'package:car_store/features/filter_category/presentation/view/filter_category_view.dart';
import 'package:car_store/features/search/presentation/view_model/model/products_model.dart';
import 'package:flutter/material.dart';

class CategoryAndModelAndTypeWidgets extends StatelessWidget {
  const CategoryAndModelAndTypeWidgets({
    super.key,
    required this.getCurrentProduct,
  });

  final ProductsModel? getCurrentProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    AnimationNav.navigatorAnimation(
                      child: const FilterCategoryView(),
                      context: context,
                      settings: RouteSettings(
                        arguments: getCurrentProduct!.categoryTypeAd,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade300,
                  ),
                  child: Text(
                    getCurrentProduct!.categoryTypeAd,
                    style: AppStyles.medium12.copyWith(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade300,
                ),
                child: Text(
                  getCurrentProduct!.modelProduct,
                  style: AppStyles.medium12.copyWith(color: Colors.blue),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                AnimationNav.navigatorAnimation(
                  child: const FilterBrandView(),
                  context: context,
                  settings: RouteSettings(
                    arguments: getCurrentProduct!.categoryProduct,
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade300,
              ),
              child: Text(
                getCurrentProduct!.categoryProduct,
                style: AppStyles.medium12.copyWith(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
