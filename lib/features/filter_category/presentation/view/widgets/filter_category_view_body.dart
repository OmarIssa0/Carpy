import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/utils/size_config.dart';
import 'package:car_store/features/home/presentation/view/widgets/item_recommended.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/search/presentation/view_model/model/products_model.dart';
import 'package:car_store/features/search/presentation/view_model/provider/product_provider.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterCategoryViewBody extends StatefulWidget {
  const FilterCategoryViewBody({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  _FilterCategoryViewBodyState createState() => _FilterCategoryViewBodyState();
}

class _FilterCategoryViewBodyState extends State<FilterCategoryViewBody> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final passeCategory = ModalRoute.of(context)!.settings.arguments as String?;

    final List<ProductsModel> productsList = passeCategory == null
        ? productProvider.getProduct
        : productProvider.findBySubCategory(category: passeCategory);

    final List<ProductsModel> filteredProductsList =
        productProvider.filterProducts(productsList, false);

    return Column(
      children: [
        filteredProductsList.isEmpty
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
                            productId: widget.searchController.text.isNotEmpty
                                ? productProvider
                                    .productListSearch[index].productsId
                                : filteredProductsList[index].productsId,
                          );
                        },
                        mainAxisSpacing: 25,
                        crossAxisSpacing: 16,
                        itemCount: widget.searchController.text.isNotEmpty
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
              ),
      ],
    );
  }
}

// class FilterCategoryViewBody extends StatefulWidget {
//   const FilterCategoryViewBody({super.key, required this.searchController});

//   final TextEditingController searchController;

//   @override
//   _FilterCategoryViewBodyState createState() => _FilterCategoryViewBodyState();
// }

// class _FilterCategoryViewBodyState extends State<FilterCategoryViewBody> {
//   final ScrollController _scrollController = ScrollController();
//   bool _isLoadingMore = false;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_onScroll);
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void _onScroll() {
//     if (_scrollController.position.pixels >=
//             _scrollController.position.maxScrollExtent * 0.9 &&
//         !_isLoadingMore) {
//       _loadMoreProducts();
//     }
//   }

//   Future<void> _loadMoreProducts() async {
//     setState(() {
//       _isLoadingMore = true;
//     });

//     final productProvider =
//         Provider.of<ProductProvider>(context, listen: false);
//     productProvider.addDummyProducts();

//     setState(() {
//       _isLoadingMore = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productProvider = Provider.of<ProductProvider>(context);
//     final passeCategory = ModalRoute.of(context)!.settings.arguments as String?;

//     final List<ProductsModel> productsList = passeCategory == null
//         ? productProvider.getProduct
//         : productProvider.findBySubCategory(category: passeCategory);

//     final List<ProductsModel> filteredProductsList =
//         productProvider.filterProducts(productsList, false);

//     return Column(
//       children: [
//         filteredProductsList.isEmpty
//             ? Center(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 25.0),
//                   child: Text(
//                     'No Products Found'.tr(context),
//                     style: AppStyles.semiBold16.copyWith(color: Colors.grey),
//                   ),
//                 ),
//               )
//             : SingleChildScrollView(
//                 controller: _scrollController,
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: DynamicHeightGridView(
//                         physics: const BouncingScrollPhysics(),
//                         shrinkWrap: true,
//                         builder: (context, index) {
//                           return ItemRecommended(
//                             productId:
//                                 productProvider.getProduct[index].productsId,
//                             // productId: widget.searchController.text.isNotEmpty
//                             //     ? productProvider
//                             //         .productListSearch[index].productsId
//                             //     : filteredProductsList[index].productsId,
//                           );
//                         },
//                         mainAxisSpacing: 25,
//                         crossAxisSpacing: 16,
//                         itemCount: productProvider.getProduct.length,
//                         // itemCount: widget.searchController.text.isNotEmpty
//                         //     ? productProvider.productListSearch.length
//                         //     : filteredProductsList.length,
//                         crossAxisCount:
//                             MediaQuery.sizeOf(context).width < SizeConfig.tablet
//                                 ? 2
//                                 : 3,
//                       ),
//                     ),
//                     if (_isLoadingMore)
//                       const Padding(
//                         padding: EdgeInsets.symmetric(vertical: 20.0),
//                         child: CircularProgressIndicator(),
//                       ),
//                     const SizedBox(height: 50),
//                   ],
//                 ),
//               ),
//       ],
//     );
//   }
// }
