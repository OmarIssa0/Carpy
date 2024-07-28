import 'package:car_store/core/utils/app_styles.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ItemProductsVendor extends StatelessWidget {
  const ItemProductsVendor({
    super.key,
    required this.imageProduct,
    required this.titleProduct,
    required this.priceProduct,
    required this.descriptionProduct,
  });

  final String imageProduct, titleProduct, priceProduct, descriptionProduct;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * .17,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FancyShimmerImage(
                  imageUrl: imageProduct,
                  height: size.height * .15,
                  width: size.width * .32,
                  boxFit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: size.width * .45,
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          titleProduct,
                          style: AppStyles.regular14,
                          textAlign: TextAlign.end,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: size.width * .45,
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          descriptionProduct,
                          style: AppStyles.regular14,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: size.width * .45,
                    child: Text(
                      priceProduct,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.regular12,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Divider(
          color: Colors.grey.shade400,
        )
      ],
    );
  }
}
