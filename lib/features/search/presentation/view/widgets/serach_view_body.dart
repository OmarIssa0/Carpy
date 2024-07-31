import 'package:car_store/core/utils/animation_nav.dart';
import 'package:car_store/core/utils/size_config.dart';
import 'package:car_store/features/filter_category/presentation/view/filter_brand_view.dart';
import 'package:car_store/features/search/presentation/view/widgets/category_item.dart';
import 'package:car_store/features/search/presentation/view_model/model/category_model.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});
// static List<BrandModel> carBrands = [
  //   const BrandModel(name: "Acura - أكورا"),
  //   const BrandModel(name: "Alfa Romeo - ألفا روميو"),
  //   const BrandModel(name: "Aston Martin - أستون مارتن"),
  //   const BrandModel(name: "Audi - أودي"),
  //   const BrandModel(name: "Bentley - بنتلي"),
  //   const BrandModel(name: "BMW - بي إم دبليو"),
  //   const BrandModel(name: "Bugatti - بوغاتي"),
  //   const BrandModel(name: "Cadillac - كاديلاك"),
  //   const BrandModel(name: "Chevrolet - شيفروليه"),
  //   const BrandModel(name: "Chrysler - كرايسلر"),
  //   const BrandModel(name: "Dodge - دودج"),
  //   const BrandModel(name: "Ferrari - فيراري"),
  //   const BrandModel(name: "Fiat - فيات"),
  //   const BrandModel(name: "Ford - فورد"),
  //   const BrandModel(name: "Honda - هوندا"),
  //   const BrandModel(name: "Hyundai - هيونداي"),
  //   const BrandModel(name: "Jaguar - جاكوار"),
  //   const BrandModel(name: "Jeep - جيب"),
  //   const BrandModel(name: "Kia - كيا"),
  //   const BrandModel(name: "Lamborghini - لامبورغيني"),
  //   const BrandModel(name: "Land Rover - لاند روفر"),
  //   const BrandModel(name: "Lexus - لكزس"),
  //   const BrandModel(name: "Maserati - مازيراتي"),
  //   const BrandModel(name: "Mazda - مازدا"),
  //   const BrandModel(name: "Mercedes-Benz - مرسيدس بنز"),
  //   const BrandModel(name: "Mitsubishi - ميتسوبيشي"),
  //   const BrandModel(name: "Nissan - نيسان"),
  //   const BrandModel(name: "Porsche - بورش"),
  //   const BrandModel(name: "Rolls-Royce - رولز رويس"),
  //   const BrandModel(name: "Subaru - سوبارو"),
  //   const BrandModel(name: "Suzuki - سوزوكي"),
  //   const BrandModel(name: "Tesla - تسلا"),
  //   const BrandModel(name: "Toyota - تويوتا"),
  //   const BrandModel(name: "Volkswagen - فولكس واجن"),
  //   const BrandModel(name: "Volvo - فولفو")
  // ];
  static List<BrandModel> carBrands = [
    
    const BrandModel(name: "Acura - أكورا"),
    const BrandModel(name: "Alfa Romeo - ألفا روميو"),
    const BrandModel(name: "Aston Martin - أستون مارتن"),
    const BrandModel(name: "Audi - أودي"),
    const BrandModel(name: "Bentley - بنتلي"),
    const BrandModel(name: "BMW - بي إم دبليو"),
    const BrandModel(name: "Bugatti - بوغاتي"),
    const BrandModel(name: "Cadillac - كاديلاك"),
    const BrandModel(name: "Changan - شانجان"),
    const BrandModel(name: "Chevrolet - شيفروليه"),
    const BrandModel(name: "Chrysler - كرايسلر"),
    const BrandModel(name: "Dodge - دودج"),
    const BrandModel(name: "Ferrari - فيراري"),
    const BrandModel(name: "Fiat - فيات"),
    const BrandModel(name: "Ford - فورد"),
    const BrandModel(name: "Geely - جيلي"),
    const BrandModel(name: "Great Wall - جريت وول"),
    const BrandModel(name: "Honda - هوندا"),
    const BrandModel(name: "Hyundai - هيونداي"),
    const BrandModel(name: "Jaguar - جاكوار"),
    const BrandModel(name: "Jeep - جيب"),
    const BrandModel(name: "Kia - كيا"),
    const BrandModel(name: "Lamborghini - لامبورغيني"),
    const BrandModel(name: "Land Rover - لاند روفر"),
    const BrandModel(name: "Lexus - لكزس"),
    const BrandModel(name: "Maserati - مازيراتي"),
    const BrandModel(name: "Mazda - مازدا"),
    const BrandModel(name: "Mercedes-Benz - مرسيدس بنز"),
    const BrandModel(name: "Mitsubishi - ميتسوبيشي"),
    const BrandModel(name: "Nissan - نيسان"),
    const BrandModel(name: "Peugeot - بيجو"),
    const BrandModel(name: "Porsche - بورش"),
    const BrandModel(name: "Renault - رينو"),
    const BrandModel(name: "Rolls-Royce - رولز رويس"),
    const BrandModel(name: "Saab - ساب"),
    const BrandModel(name: "Seat - سيات"),
    const BrandModel(name: "Skoda - سكودا"),
    const BrandModel(name: "Subaru - سوبارو"),
    const BrandModel(name: "Suzuki - سوزوكي"),
    const BrandModel(name: "Tesla - تسلا"),
    const BrandModel(name: "Toyota - تويوتا"),
    const BrandModel(name: "Volkswagen - فولكس واجن"),
    const BrandModel(name: "Volvo - فولفو"),
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
                    // Navigator.pushNamed(context, FilterCategoryView.routeName,
                    //     arguments: carBrands[index].name);
                    Navigator.push(
                      context,
                      AnimationNav.navigatorAnimation(
                        child: const FilterBrandView(),
                        context: context,
                        settings:
                            RouteSettings(arguments: carBrands[index].name),
                      ),
                    );
                  },
                  child: CategoryItem(
                    categoryModel: carBrands[index],
                    // image: carBrands[index].image,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
