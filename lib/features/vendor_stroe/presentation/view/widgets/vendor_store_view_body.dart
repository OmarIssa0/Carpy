import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/features/search/persentation/view_model/model/products_model.dart';
import 'package:car_store/features/search/persentation/view_model/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VendorStoreViewBody extends StatelessWidget {
  const VendorStoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final userId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrentProduct = productProvider.findByUserId(userId);

    return getCurrentProduct == null
        ? const SizedBox.shrink()
        : Column(
            children: List.generate(
                getCurrentProduct.productsVendor.length,
                (index) => Text(
                      getCurrentProduct.productsVendor[index],
                      style: AppStyles.bold27,
                    )),
          );
  }
}
