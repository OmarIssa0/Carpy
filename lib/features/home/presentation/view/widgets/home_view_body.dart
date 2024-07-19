import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/utils/size_config.dart';
import 'package:car_store/features/home/presentation/view/widgets/custom_shimmer_loading.dart';
import 'package:car_store/features/home/presentation/view/widgets/item_recommended.dart';
import 'package:car_store/features/home/presentation/view/widgets/swiper_home_view.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/search/persentation/view_model/model/products_model.dart';
import 'package:car_store/features/search/persentation/view_model/provider/product_provider.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final productProvider = Provider.of<ProductProvider>(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: StreamBuilder<List<ProductsModel>>(
          stream: productProvider.getAllProductsStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              const CustomShimmerLoading();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const ListFeatured(),
                Padding(
                  padding: MediaQuery.sizeOf(context).width < SizeConfig.tablet
                      ? const EdgeInsetsDirectional.symmetric(horizontal: 16)
                      : EdgeInsetsDirectional.only(
                          start: MediaQuery.sizeOf(context).width / 6,
                          end: MediaQuery.sizeOf(context).width / 6,
                        ),
                  child: const SwiperHomeView(),
                ),
                const SizedBox(height: 34),
                Padding(
                  padding: MediaQuery.sizeOf(context).width < SizeConfig.tablet
                      ? const EdgeInsetsDirectional.symmetric(horizontal: 16)
                      : EdgeInsetsDirectional.only(
                          start: MediaQuery.sizeOf(context).width / 6,
                          end: MediaQuery.sizeOf(context).width / 6,
                        ),
                  child: Text(
                    "Recommended".tr(context),
                    style: AppStyles.medium20,
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: DynamicHeightGridView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    builder: (context, index) {
                      return ChangeNotifierProvider.value(
                        value: productProvider.getProduct[index],
                        child: ItemRecommended(
                          productId:
                              productProvider.getProduct[index].productsId,
                        ),
                      );
                    },
                    mainAxisSpacing: 25,
                    crossAxisSpacing: 16,
                    itemCount: productProvider.getProduct.length,
                    crossAxisCount:
                        MediaQuery.sizeOf(context).width < SizeConfig.tablet
                            ? 2
                            : 3,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
