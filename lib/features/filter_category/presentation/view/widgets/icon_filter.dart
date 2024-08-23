import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/widgets/custom_button.dart';
import 'package:car_store/features/filter_category/presentation/view/widgets/custom_dropdown_button.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/search/presentation/view_model/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class IconFilter extends StatelessWidget {
  const IconFilter({
    super.key,
    required this.isFilter,
  });
  final bool isFilter;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          scrollControlDisabledMaxHeightRatio: double.infinity,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          showDragHandle: true,
          context: context,
          builder: (context) {
            return Consumer<ProductProvider>(
              builder: (context, provider, child) {
                return Column(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 35),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text('Min Price:'.tr(context)),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Slider(
                                value: provider.minPrice,
                                min: 0,
                                max: 1000000,
                                divisions: 1000,
                                label: provider.minPrice.round().toString(),
                                onChanged: (double value) {
                                  provider.setMinPrice(value);
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text('Max Price:'.tr(context)),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Slider(
                                value: provider.maxPrice,
                                min: 0,
                                max: 1000000,
                                divisions: 1000,
                                label: provider.maxPrice.round().toString(),
                                onChanged: (double value) {
                                  provider.setMaxPrice(value);
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        isFilter == false
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: CustomDropdown(
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    underline: const SizedBox(),
                                    icon: const Icon(IconlyLight.arrow_down_2),
                                    dropdownColor: Colors.white,
                                    value: provider.selectedCategory,
                                    hint: Text(
                                      'Select Category'.tr(context),
                                      style: const TextStyle(
                                        color: AppColor.kSilver,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    items: provider.categoryList
                                        .map((String category) {
                                      return DropdownMenuItem<String>(
                                        value: category,
                                        child: Text(category),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      provider.setSelectedCategory(
                                          newValue, isFilter);
                                    },
                                  ),
                                ),
                              ),
                        const SizedBox(height: 35),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CustomButton(
                                  colorBorder: AppColor.kBackGroundColorSplash,
                                  color: Colors.white,
                                  colorFont: AppColor.kBackGroundColorSplash,
                                  onPressed: () {
                                    provider.setMinPrice(0);
                                    provider.setMaxPrice(1000000);
                                    provider.setSelectedCategory(
                                        null, isFilter);
                                    Navigator.pop(context);
                                  },
                                  title: "Reset".tr(context),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: CustomButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  title: "Apply".tr(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
        );
      },
      child: Consumer<ProductProvider>(builder: (context, provider, child) {
        if (isFilter == false) {
          provider.setSelectedCategory(null, false);
          provider.selectedCategory == null;
        }
        return provider.minPrice != 0 ||
                provider.maxPrice != 1000000 ||
                provider.selectedCategory != null
            ? const Badge(
                // alignment: AlignmentDirectional(0, 0),
                label: Text('1'),
                child: Icon(
                  IconlyBold.filter_2,
                  color: Colors.white,
                  size: 16,
                ),
              )
            : const Icon(IconlyBold.filter_2, color: Colors.white, size: 16);
      }),
    );
  }
}
