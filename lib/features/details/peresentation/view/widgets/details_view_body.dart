import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/features/details/peresentation/view/widgets/box_info.dart';
import 'package:car_store/features/details/peresentation/view/widgets/image_details.dart';
import 'package:car_store/features/details/peresentation/view/widgets/item_details_car.dart';
import 'package:car_store/features/search/persentation/view_model/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrentProduct = productProvider.findByProductId(productId);

    return getCurrentProduct == null
        ? const SizedBox.shrink()
        : SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ImageDetails(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * .7,
                              child: Text(getCurrentProduct.nameProduct,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyles.semiBold22)),
                          CircleAvatar(
                            backgroundColor:
                                AppColor.kBackGroundColorSplash.withOpacity(.3),
                            radius: 20,
                            child: Center(
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite,
                                    size: 25,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(getCurrentProduct.priceProduct,
                          style: AppStyles.medium14),
                      const SizedBox(height: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemDetailsCar(
                            image: Assets.imagesLocation,
                            title: getCurrentProduct.locationVendor ?? "",
                          ),
                          const SizedBox(height: 15),
                          ItemDetailsCar(
                            image: Assets.imagesCardetails,
                            title:
                                "Car details (Model ${getCurrentProduct.modelProduct})",
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const BoxInfo(),
                      const SizedBox(height: 20),
                      Text(
                        getCurrentProduct.descriptionProduct,
                        style: AppStyles.regular16,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          );
  }
}
