import 'package:car_store/core/service/widgets_ad_banner.dart';
import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/widgets/custom_button.dart';
import 'package:car_store/core/widgets/custom_text_filed.dart';
import 'package:car_store/features/filter_category/presentation/view/widgets/filter_category_view_body.dart';
import 'package:car_store/features/filter_category/presentation/view/widgets/icon_filter.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/search/presentation/view_model/model/products_model.dart';
import 'package:car_store/features/search/presentation/view_model/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class FilterCategoryView extends StatefulWidget {
  const FilterCategoryView({super.key});
  static const String routeName = 'FilterCategoryView';

  @override
  State<FilterCategoryView> createState() => _FilterCategoryViewState();
}

class _FilterCategoryViewState extends State<FilterCategoryView> {
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
        : productProvider.findBySubCategory(category: passeCategory);
    // final filterProvider = Provider.of<FilterProvider>(context);
    
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
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .4,
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      passeCategory ?? "",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Padding(
                    padding: EdgeInsetsDirectional.only(end: 15),
                    child: IconFilter(
                      isFilter: false,
                    ),
                  ),
                ],
              ),
              background: ClipRRect(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Padding(
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
          ),
          SliverToBoxAdapter(
            child: FilterCategoryViewBody(
              searchController: searchController,
            ),
          ),
        ],
      ),
    );
  }
}
