import 'package:car_store/core/utils/animation_nav.dart';
import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/features/details/presentation/view/details_view.dart';
import 'package:car_store/features/home/presentation/view/widgets/custom_shimmer_loading.dart';
import 'package:car_store/features/vendor_stroe/presentation/view/widgets/header_info_vendor.dart';
import 'package:car_store/features/vendor_stroe/presentation/view/widgets/item_products_vendor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VendorStoreViewBody extends StatelessWidget {
  const VendorStoreViewBody({super.key, required this.vendorData});
  final DocumentSnapshot vendorData;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = vendorData.data() as Map<String, dynamic>?;
    String vendorName = data?['vendorName'] ?? '';
    String companyType = data?['companyType'] ?? '';
    String phoneNumber = data?['phoneNumber'] ?? '';

    final vendorId = ModalRoute.of(context)!.settings.arguments as String;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
          child: HeaderInfoVendor(
            companyType: companyType.toString(),
            phone: phoneNumber,
            companyName: vendorName.toString(),
            // vendorData: vendorData,
          ),
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
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('vendors')
              .where('vendorId', isEqualTo: vendorId)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CustomShimmerLoading());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No products available'));
            }

            final vendorDocs = snapshot.data!.docs;

            return Column(
              children: List.generate(
                vendorDocs.length,
                (vendorIndex) {
                  var vendorData =
                      vendorDocs[vendorIndex].data() as Map<String, dynamic>;

                  if (!vendorData.containsKey('products')) {
                    return const ListTile(
                      title: Text('Error: Missing products field in document'),
                    );
                  }

                  var productsList = vendorData['products'] as List<dynamic>;

                  return Column(
                    children: List.generate(
                      productsList.length,
                      (productIndex) {
                        var product =
                            productsList[productIndex] as Map<String, dynamic>;

                        return InkWell(
                          onTap: () {
                            // Navigator.pushNamed(
                            //   context,
                            //   DetailsView.routeName,
                            //   arguments: product['productId'],
                            // );
                            Navigator.push(
                              context,
                              AnimationNav.navigatorAnimation(
                                child: const DetailsView(),
                                context: context,
                                settings: RouteSettings(
                                    arguments: product['productId']),
                              ),
                            );
                          },
                          child: ItemProductsVendor(
                            descriptionProduct:
                                product['productDescription'] ?? '',
                            priceProduct: product['productPrice'] ?? '',
                            titleProduct: product['productTitle'] ?? '',
                            imageProduct: product['productImage'][0] ?? '',
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }
}
