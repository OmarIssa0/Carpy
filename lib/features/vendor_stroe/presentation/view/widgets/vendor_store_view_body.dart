import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/features/search/persentation/view_model/provider/product_provider.dart';
import 'package:car_store/features/vendor_stroe/presentation/view/widgets/header_info_vendor.dart';
import 'package:car_store/features/vendor_stroe/presentation/view/widgets/item_products_vendor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 24),
                child: HeaderInfoVendor(),
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 5,
                // height: 40,
                color: AppColor.kBlack.withOpacity(.1),
              ),
              const SizedBox(
                height: 10,
              ),
              const ItemProductsVendor(),
              Column(
                children:
                    List.generate(10, (index) => const ItemProductsVendor()),
              ),
            ],
          );
  }
}
