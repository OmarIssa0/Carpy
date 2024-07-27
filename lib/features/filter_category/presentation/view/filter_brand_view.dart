import 'package:car_store/core/service/widgets_ad_banner.dart';
import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/widgets/custom_text_filed.dart';
import 'package:car_store/features/filter_category/presentation/view/widgets/filter_brand_view_body.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/search/presentation/view_model/model/products_model.dart';
import 'package:car_store/features/search/presentation/view_model/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterBrandView extends StatefulWidget {
  const FilterBrandView({super.key});
  static const String routeName = 'FilterBrandView';

  @override
  State<FilterBrandView> createState() => _FilterBrandViewState();
}

class _FilterBrandViewState extends State<FilterBrandView> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final passeCategory = ModalRoute.of(context)!.settings.arguments as String?;

    final List<ProductsModel> productsList = passeCategory == null
        ? productProvider.getProduct
        : productProvider.findByBrand(brandName: passeCategory);

    return Scaffold(
      bottomNavigationBar: const AdMobBanner(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: true,
            expandedHeight: 120.0,
            floating: true,
            backgroundColor: AppColor.kBackGroundColorSplash,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
            ),
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              title: passeCategory == null
                  ? Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      'All Products'.tr(context),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    )
                  : Text(
                      passeCategory,
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
              background: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 55, top: 32, end: 18),
                child: SizedBox(
                  child: CustomTextFiled(
                      // controller: productProvider.searchController,
                      controller: searchController,
                      onFieldSubmitted: (p0) {
                        setState(() {
                          productProvider.productListSearch =
                              productProvider.searchQuery(
                                  searchText:
                                      // productProvider.searchController.text,
                                      searchController.text,
                                  passedList: productsList);
                        });
                      },
                      onChanged: (p0) {
                        setState(() {
                          productProvider.productListSearch =
                              productProvider.searchQuery(
                                  searchText:
                                      // productProvider.searchController.text,
                                      searchController.text,
                                  passedList: productsList);
                        });
                      },
                      contentPadding:
                          const EdgeInsetsDirectional.only(start: 12),
                      title: "Search".tr(context),
                      textInputType: TextInputType.text),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FilterBrandViewBody(
              searchController: searchController,
            ),
          ),
        ],
      ),
    );
  }
}
