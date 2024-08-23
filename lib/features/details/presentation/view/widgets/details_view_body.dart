import 'package:car_store/core/service/widgets_ad_banner.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/features/details/presentation/view/widgets/box_info.dart';
import 'package:car_store/features/details/presentation/view/widgets/category_and_model_and_type.dart';
import 'package:car_store/features/details/presentation/view/widgets/image_details.dart';
import 'package:car_store/features/details/presentation/view/widgets/row_title_and_value.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/search/presentation/view_model/provider/product_provider.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrentProduct = productProvider.findByProductId(productId);
    // final userProvider = Provider.of<UserProvider>(context);

    return getCurrentProduct == null
        ? const SizedBox.shrink()
        : SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AdMobBanner(),
                const ImageDetails(),
                const SizedBox(height: 15),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          getCurrentProduct.nameProduct,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.semiBold18,
                        ),
                      ),
                      const SizedBox(width: 18),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${getCurrentProduct.priceProduct.toString()} JOD",
                            style: AppStyles.medium14,
                          ),
                          Row(
                            children: [
                              Text(
                                "${getCurrentProduct.discount}",
                                style: AppStyles.medium12.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              Text(
                                getCurrentProduct.discount == "" ? "" : " JOD",
                                style: AppStyles.medium14.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Divider(
                    height: 30, thickness: 1.5, color: Colors.grey.shade200),
                CategoryAndModelAndTypeWidgets(
                    getCurrentProduct: getCurrentProduct),
                getCurrentProduct.categoryTypeAd == "استئجار المركبات" ||
                        getCurrentProduct.categoryTypeAd == "مركبات للبيع"
                    ? const SizedBox(height: 15)
                    : const SizedBox.shrink(),

                getCurrentProduct.categoryTypeAd == "استئجار المركبات" ||
                        getCurrentProduct.categoryTypeAd == "مركبات للبيع"
                    ? Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RowTitleAndValue(
                              title: "Year".tr(context),
                              value: getCurrentProduct.modelProduct,
                            ),
                            const SizedBox(height: 5),
                            RowTitleAndValue(
                              title: "Brand".tr(context),
                              value: getCurrentProduct.categoryProduct,
                            ),
                            const SizedBox(height: 5),
                            RowTitleAndValue(
                              title: "Color".tr(context),
                              value: getCurrentProduct.color ?? "",
                            ),
                            const SizedBox(height: 5),
                            RowTitleAndValue(
                              title: "Kilometers".tr(context),
                              value: getCurrentProduct.kilometer ?? "",
                            ),
                            const SizedBox(height: 5),
                            RowTitleAndValue(
                              title: "Category".tr(context),
                              value: getCurrentProduct.categoryTypeAd,
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(height: 15),
                getCurrentProduct.categoryTypeAd == "استئجار المركبات" ||
                        getCurrentProduct.categoryTypeAd == "مركبات للبيع"
                    ? Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Technical Specifications".tr(context),
                              style: AppStyles.semiBold16,
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                              child: DynamicHeightGridView(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                builder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        top: 8.0, end: 8.0),
                                    child: Text(
                                        "${getCurrentProduct.selectedFeatures![index]}"),
                                  );
                                },
                                itemCount: getCurrentProduct
                                        .selectedFeatures?.length ??
                                    0,
                                crossAxisCount: 2,
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
                // Divider(
                //     height: 30, thickness: 1.5, color: Colors.grey.shade200),
                getCurrentProduct.categoryTypeAd == "استئجار المركبات" ||
                        getCurrentProduct.categoryTypeAd == "مركبات للبيع"
                    ? const SizedBox(height: 15)
                    : const SizedBox.shrink(),
                BoxInfo(
                  userId: getCurrentProduct.userId,
                ),
                const SizedBox(height: 15),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 24),
                  child: Text(
                    getCurrentProduct.descriptionProduct,
                    style: AppStyles.regular16,
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          );
  }
}
