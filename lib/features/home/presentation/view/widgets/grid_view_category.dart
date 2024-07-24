import 'package:car_store/core/utils/animation_nav.dart';
import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/features/filter_category/presentation/view/filter_category_view.dart';
import 'package:car_store/features/filter_category/presentation/view_model/model/category_model.dart';
import 'package:car_store/features/home/presentation/view/widgets/category_rounded_widgets.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:flutter/material.dart';

class GridViewCategory extends StatelessWidget {
  const GridViewCategory({super.key});

  static List<CategoryModel> categoryList = [
    const CategoryModel(name: "اكسسوارات", image: Assets.imagesAutomotiveNew),
    const CategoryModel(name: "قطع غيار", image: Assets.imagesBrake),
    const CategoryModel(name: "استئجار المركبات", image: Assets.imagesCarKey),
    const CategoryModel(name: "مركبات للبيع", image: Assets.imagesCar),
    const CategoryModel(name: "تعبئة على الطريق", image: Assets.imagesCharger),
    const CategoryModel(name: "زيوت وسوائل", image: Assets.imagesOil),
    const CategoryModel(
        name: "تنظيف المركبات", image: Assets.imagesSprayBottle),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TitleTextAppCustom(label: 'Categories', fontSize: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text("Category".tr(context), style: AppStyles.medium20),
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: List.generate(
              categoryList.length,
              (index) {
                return Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 24),
                  child: CategoriesRoundedWidgets(
                    image: categoryList[index].image!,
                    name: categoryList[index].name,
                    onTap: () {
                      Navigator.push(
                        context,
                        AnimationNav.navigatorAnimation(
                          child: const FilterCategoryView(),
                          context: context,
                          settings: RouteSettings(
                              arguments: categoryList[index].name),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        )
        // SizedBox(
        //   height: 130,
        //   child: GridView(
        //     physics: const BouncingScrollPhysics(),
        //     scrollDirection: Axis.horizontal,
        //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        //       maxCrossAxisExtent: 200,
        //       childAspectRatio: 4 / 2,
        //       // crossAxisSpacing: 20,
        //       mainAxisSpacing: 20,
        //     ),
        //     children: List.generate(
        //       CategoriesList.categoryList.length,
        //       (index) {
        //         return CategoriesRoundedWidgets(
        //           image: CategoriesList.categoryList[index].image,
        //           name: CategoriesList.categoryList[index].name,
        //         );
        //       },
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
