import 'package:car_store/core/utils/size_config.dart';
import 'package:car_store/features/filter_category/presentation/view/filter_category_view.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/search/persentation/view/widgets/category_item.dart';
import 'package:car_store/features/search/persentation/view_model/model/category_model.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  static List<CategoryModel> carBrands = [
    const CategoryModel(name: "Acura - أكورا"),
    const CategoryModel(name: "Alfa Romeo - ألفا روميو"),
    const CategoryModel(name: "Aston Martin - أستون مارتن"),
    const CategoryModel(name: "Audi - أودي"),
    const CategoryModel(name: "Bentley - بنتلي"),
    const CategoryModel(name: "BMW - بي إم دبليو"),
    const CategoryModel(name: "Bugatti - بوغاتي"),
    const CategoryModel(name: "Cadillac - كاديلاك"),
    const CategoryModel(name: "Chevrolet - شيفروليه"),
    const CategoryModel(name: "Chrysler - كرايسلر"),
    const CategoryModel(name: "Dodge - دودج"),
    const CategoryModel(name: "Ferrari - فيراري"),
    const CategoryModel(name: "Fiat - فيات"),
    const CategoryModel(name: "Ford - فورد"),
    const CategoryModel(name: "Honda - هوندا"),
    const CategoryModel(name: "Hyundai - هيونداي"),
    const CategoryModel(name: "Jaguar - جاكوار"),
    const CategoryModel(name: "Jeep - جيب"),
    const CategoryModel(name: "Kia - كيا"),
    const CategoryModel(name: "Lamborghini - لامبورغيني"),
    const CategoryModel(name: "Land Rover - لاند روفر"),
    const CategoryModel(name: "Lexus - لكزس"),
    const CategoryModel(name: "Maserati - مازيراتي"),
    const CategoryModel(name: "Mazda - مازدا"),
    const CategoryModel(name: "Mercedes-Benz - مرسيدس بنز"),
    const CategoryModel(name: "Mitsubishi - ميتسوبيشي"),
    const CategoryModel(name: "Nissan - نيسان"),
    const CategoryModel(name: "Porsche - بورش"),
    const CategoryModel(name: "Rolls-Royce - رولز رويس"),
    const CategoryModel(name: "Subaru - سوبارو"),
    const CategoryModel(name: "Suzuki - سوزوكي"),
    const CategoryModel(name: "Tesla - تسلا"),
    const CategoryModel(name: "Toyota - تويوتا"),
    const CategoryModel(name: "Volkswagen - فولكس واجن"),
    const CategoryModel(name: "Volvo - فولفو")
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Column(
            children: List.generate(
              carBrands.length,
              (index) => Padding(
                padding: MediaQuery.sizeOf(context).width < SizeConfig.tablet
                    ? const EdgeInsetsDirectional.symmetric(
                        horizontal: 24, vertical: 8)
                    : EdgeInsetsDirectional.only(
                        start: MediaQuery.sizeOf(context).width / 6,
                        end: MediaQuery.sizeOf(context).width / 6,
                        top: 8,
                        bottom: 8,
                      ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, FilterCategoryView.routeName,
                        arguments: carBrands[index].name);
                  },
                  child: CategoryItem(
                    categoryModel: carBrands[index],
                    // image: carBrands[index].image,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
