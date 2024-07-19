import 'dart:developer';

import 'package:car_store/core/utils/animation_nav.dart';
import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/features/search/persentation/view_model/provider/product_provider.dart';
import 'package:car_store/features/vendor_stroe/presentation/view/vendor_store_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BoxInfo extends StatelessWidget {
  const BoxInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrentProduct = productProvider.findByProductId(productId);

    return getCurrentProduct == null
        ? const SizedBox.shrink()
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              border: Border.all(color: AppColor.kSilver.withOpacity(.4)),
            ),
            height: 80,
            width: double.infinity,
            child: Row(
              children: [
                const SizedBox(width: 6),
                GestureDetector(
                  onTap: () async {
                    DocumentSnapshot vendorData = await FirebaseFirestore
                        .instance
                        .collection('vendors')
                        .doc(getCurrentProduct.userId)
                        .get();
                    // log(getCurrentProduct.userId);
                    if (!context.mounted) return;
                    Navigator.push(
                      context,
                      AnimationNav.navigatorAnimation(
                        child: VendorStoreView(
                          vendorData: vendorData,
                        ),
                        context: context,
                        settings:
                            RouteSettings(arguments: getCurrentProduct.userId),
                      ),
                    );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         VendorStoreView(vendorData: vendorData),
                    //     settings:
                    //         RouteSettings(arguments: getCurrentProduct.userId),
                    //   ),
                    // );
                    
                  },
                  child: CircleAvatar(
                    radius: 28,
                    backgroundImage:
                        NetworkImage(getCurrentProduct.imageCompany),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                    width: MediaQuery.sizeOf(context).width * .55,
                    child: Text(getCurrentProduct.companyName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.regular16)),
                const Spacer(),
                IconButton(
                  onPressed: () async {
                    _makePhoneCall(getCurrentProduct.phoneNumberVendor);
                  },
                  icon: const Icon(
                    IconlyBold.call,
                  ),
                )
              ],
            ),
          );
  }

  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    // ignore: deprecated_member_use
    await launch(launchUri.toString());
  }
}
