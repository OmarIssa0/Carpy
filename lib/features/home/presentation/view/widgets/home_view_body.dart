import 'package:car_store/core/utils/size_config.dart';
import 'package:car_store/features/home/presentation/view/widgets/custom_list_view_home_all_category.dart';
import 'package:car_store/features/home/presentation/view/widgets/custom_shimmer_loading.dart';
import 'package:car_store/features/home/presentation/view/widgets/grid_view_category.dart';
import 'package:car_store/features/home/presentation/view/widgets/swiper_home_view.dart';
import 'package:car_store/features/search/presentation/view_model/model/products_model.dart';
import 'package:car_store/features/search/presentation/view_model/provider/product_provider.dart';
import 'package:flutter/material.dart';
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

  // get passeCategory => null;
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
                child: const SwiperHomeViewOne(),
              ),
              const SizedBox(height: 34),
              const GridViewCategory(),
              const SizedBox(height: 12),
              CustomListView(
                productProvider: productProvider,
                // productsList: productsListAccessories,
                productsList:
                    productProvider.findBySubCategory(category: "اكسسوارات"),
                argumentName: "اكسسوارات",
                passeCategoryName: "accessories",
              ),
              const SizedBox(height: 25),
              CustomListView(
                productProvider: productProvider,
                // productsList: productsListSpareParts,
                productsList:
                    productProvider.findBySubCategory(category: "قطع غيار"),
                argumentName: "قطع غيار",
                passeCategoryName: "spare parts",
              ),
              const SizedBox(height: 25),
              Padding(
                padding: MediaQuery.sizeOf(context).width < SizeConfig.tablet
                    ? const EdgeInsetsDirectional.symmetric(horizontal: 16)
                    : EdgeInsetsDirectional.only(
                        start: MediaQuery.sizeOf(context).width / 6,
                        end: MediaQuery.sizeOf(context).width / 6,
                      ),
                child: const SwiperHomeViewToo(),
              ),
              const SizedBox(height: 25),

              CustomListView(
                productProvider: productProvider,
                // productsList: productsListCarRental,
                productsList: productProvider.findBySubCategory(
                    category: "استئجار المركبات"),
                argumentName: "استئجار المركبات",
                passeCategoryName: "Car Rental",
              ),
              const SizedBox(height: 25),
              CustomListView(
                productProvider: productProvider,
                // productsList: productsListOilsAndFluids,
                productsList:
                    productProvider.findBySubCategory(category: "زيوت وسوائل"),
                argumentName: "زيوت وسوائل",
                passeCategoryName: "Oils and Fluids",
              ),
              const SizedBox(height: 25),
              Padding(
                padding: MediaQuery.sizeOf(context).width < SizeConfig.tablet
                    ? const EdgeInsetsDirectional.symmetric(horizontal: 16)
                    : EdgeInsetsDirectional.only(
                        start: MediaQuery.sizeOf(context).width / 6,
                        end: MediaQuery.sizeOf(context).width / 6,
                      ),
                child: const SwiperHomeViewThree(),
              ),
              const SizedBox(height: 25),
              CustomListView(
                productProvider: productProvider,
                // productsList: productsListBey,
                productsList:
                    productProvider.findBySubCategory(category: "مركبات للبيع"),
                argumentName: "مركبات للبيع",
                passeCategoryName: "Cars for Sale",
              ),
              const SizedBox(height: 25),
              CustomListView(
                productProvider: productProvider,
                // productsList: productsListRoadsideRefueling,
                productsList: productProvider.findBySubCategory(
                    category: "تعبئة على الطريق"),
                argumentName: "تعبئة على الطريق",
                passeCategoryName: "Roadside Refueling",
              ),
              const SizedBox(height: 25),
              CustomListView(
                productProvider: productProvider,
                // productsList: productProvider.findBySubCategory(
                //     category: "تنظيف المركبات"),
                productsList: productProvider.findBySubCategory(
                    category: "تنظيف المركبات"),
                argumentName: "تنظيف المركبات",
                passeCategoryName: "Car Cleaning",
              ),
              const SizedBox(height: 25),
              const SizedBox(
                height: 50,
              ),
            ],
          );
        },
      ),
    );
  }
}
