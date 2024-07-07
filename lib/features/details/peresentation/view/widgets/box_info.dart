import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/features/search/persentation/view_model/provider/product_provider.dart';
import 'package:car_store/features/vendor_stroe/presentation/view/vendor_store_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BoxInfo extends StatelessWidget {
  const BoxInfo({
    super.key,
    // required this.phoneNumber,
    // required this.nameCompany,
    // required this.imageVendor,
    // required this.id
  });

  // final String phoneNumber, nameCompany, imageVendor, id;

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
              // color: AppColor.kGrayColor.withOpacity(.2),
              // color: AppColor.kBackGroundColorSplash.withOpacity(.3),
              color: Colors.white,
              border: Border.all(color: AppColor.kSilver.withOpacity(.4)),
            ),
            height: 60,
            width: double.infinity,
            child: Row(
              children: [
                const SizedBox(width: 6),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      VendorStoreView.routeName,
                      arguments: getCurrentProduct.userId,
                    );
                  },
                  child: Hero(
                    tag: "OMAR",
                    child: CircleAvatar(
                      // radius: 30,
                      backgroundImage: AssetImage(getCurrentProduct.imageCompany),
                    ),
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
