import 'package:car_store/core/utils/size_config.dart';
import 'package:car_store/features/filter_category/presentation/view/filter_category_view.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/search/persentation/view/widgets/category_item.dart';
import 'package:car_store/features/search/persentation/view_model/model/category_model.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  static List<CategoryModel> carBrands = [
    const CategoryModel(
      name: "Acura",
      // image: "https://www.carlogos.org/car-logos/acura-logo.png",
    ),
    const CategoryModel(
      name: "Alfa Romeo",
      // image: "https://www.carlogos.org/car-logos/alfa-romeo-logo.png",
    ),
    const CategoryModel(
      name: "Aston Martin",
      // image: "https://www.carlogos.org/car-logos/aston-martin-logo.png",
    ),
    const CategoryModel(
      name: "Audi",
      // image: "https://www.carlogos.org/car-logos/audi-logo.png",
    ),
    const CategoryModel(
      name: "Bentley",
      // image: "https://www.carlogos.org/car-logos/bentley-logo.png",
    ),
    const CategoryModel(
      name: "BMW",
      // image: "https://www.carlogos.org/car-logos/bmw-logo.png",
    ),
    const CategoryModel(
      name: "Bugatti",
      // image: "https://www.carlogos.org/car-logos/bugatti-logo.png",
    ),
    const CategoryModel(
      name: "Cadillac",
      // image: "https://www.carlogos.org/car-logos/cadillac-logo.png",
    ),
    const CategoryModel(
      name: "Chevrolet",
      // image: "https://www.carlogos.org/car-logos/chevrolet-logo.png",
    ),
    const CategoryModel(
      name: "Chrysler",
      // image: "https://www.carlogos.org/car-logos/chrysler-logo.png",
    ),
    const CategoryModel(
      name: "Dodge",
      // image: "https://www.carlogos.org/car-logos/dodge-logo.png",
    ),
    const CategoryModel(
      name: "Ferrari",
      // image: "https://www.carlogos.org/car-logos/ferrari-logo.png",
    ),
    const CategoryModel(
      name: "Fiat",
      // image: "https://www.carlogos.org/car-logos/fiat-logo.png",
    ),
    const CategoryModel(
      name: "Ford",
      // image: "https://www.carlogos.org/car-logos/ford-logo.png",
    ),
    const CategoryModel(
      name: "Honda",
      // image: "https://www.carlogos.org/car-logos/honda-logo.png",
    ),
    const CategoryModel(
      name: "Hyundai",
      // image: "https://www.carlogos.org/car-logos/hyundai-logo.png",
    ),
    const CategoryModel(
      name: "Jaguar",
      // image: "https://www.carlogos.org/car-logos/jaguar-logo.png",
    ),
    const CategoryModel(
      name: "Jeep",
      // image: "https://www.carlogos.org/car-logos/jeep-logo.png",
    ),
    const CategoryModel(
      name: "Kia",
      // image: "https://www.carlogos.org/car-logos/kia-logo.png",
    ),
    const CategoryModel(
      name: "Lamborghini",
      // image: "https://www.carlogos.org/car-logos/lamborghini-logo.png",
    ),
    const CategoryModel(
      name: "Land Rover",
      // image: "https://www.carlogos.org/car-logos/land-rover-logo.png",
    ),
    const CategoryModel(
      name: "Lexus",
      // image: "https://www.carlogos.org/car-logos/lexus-logo.png",
    ),
    const CategoryModel(
      name: "Maserati",
      // image: "https://www.carlogos.org/car-logos/maserati-logo.png",
    ),
    const CategoryModel(
      name: "Mazda",
      // image: "https://www.carlogos.org/car-logos/mazda-logo.png",
    ),
    const CategoryModel(
      name: "Mercedes-Benz",
      // image: "https://www.carlogos.org/car-logos/mercedes-benz-logo.png",
    ),
    const CategoryModel(
      name: "Mitsubishi",
      // image: "https://www.carlogos.org/car-logos/mitsubishi-logo.png",
    ),
    const CategoryModel(
      name: "Nissan",
      // image: "https://www.carlogos.org/car-logos/nissan-logo.png",
    ),
    const CategoryModel(
      name: "Porsche",
      // image: "https://www.carlogos.org/car-logos/porsche-logo.png",
    ),
    const CategoryModel(
      name: "Rolls-Royce",
      // image: "https://www.carlogos.org/car-logos/rolls-royce-logo.png",
    ),
    const CategoryModel(
      name: "Subaru",
      // image: "https://www.carlogos.org/car-logos/subaru-logo.png",
    ),
    const CategoryModel(
      name: "Suzuki",
      // image: "https://www.carlogos.org/car-logos/suzuki-logo.png",
    ),
    const CategoryModel(
      name: "Tesla",
      // image: "https://www.carlogos.org/car-logos/tesla-logo.png",
    ),
    const CategoryModel(
      name: "Toyota",
      // image: "https://www.carlogos.org/car-logos/toyota-logo.png",
    ),
    const CategoryModel(
      name: "Volkswagen",
      // image: "https://www.carlogos.org/car-logos/volkswagen-logo.png",
    ),
    const CategoryModel(
      name: "Volvo",
      // image: "https://www.carlogos.org/car-logos/volvo-logo.png",
    )
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
                        arguments: carBrands[index].name.tr(context));
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
