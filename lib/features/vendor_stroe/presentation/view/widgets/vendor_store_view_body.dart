import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/features/details/peresentation/view/details_view.dart';
import 'package:car_store/features/vendor_stroe/presentation/view/widgets/header_info_vendor.dart';
import 'package:car_store/features/vendor_stroe/presentation/view/widgets/item_products_vendor.dart';
import 'package:car_store/features/vendor_stroe/presentation/view_model/provider/vendor_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class VendorStoreViewBody extends StatelessWidget {
  const VendorStoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // final productProvider = Provider.of<ProductProvider>(context);
    // final userId = ModalRoute.of(context)!.settings.arguments as String;
    // final getCurrentProduct = productProvider.findByUserId(userId);
    final vendorId = ModalRoute.of(context)!.settings.arguments as String;
    final vendorProvider = Provider.of<VendorProvider>(context);
    final getCurrentVendor = vendorProvider.findByVendorId(vendorId);

    return getCurrentVendor == null
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
              // const ItemProductsVendor(),
              Column(
                children: List.generate(
                  getCurrentVendor.productList.length,
                  (index) => GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        DetailsView.routeName,
                        arguments:
                            getCurrentVendor.productList[index].productsId,
                      );
                    },
                    child: ItemProductsVendor(
                      descriptionProduct: getCurrentVendor
                          .productList[index].descriptionProduct,
                      imageProduct:
                          getCurrentVendor.productList[index].imagesProduct[0],
                      priceProduct:
                          getCurrentVendor.productList[index].priceProduct,
                      titleProduct:
                          getCurrentVendor.productList[index].nameProduct,
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
