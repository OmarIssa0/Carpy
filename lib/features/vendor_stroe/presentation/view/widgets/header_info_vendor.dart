import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/features/vendor_stroe/presentation/view_model/provider/vendor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderInfoVendor extends StatelessWidget {
  const HeaderInfoVendor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final productProvider = Provider.of<ProductProvider>(context);
    // final userId = ModalRoute.of(context)!.settings.arguments as String;
    // final getCurrentProduct = productProvider.findByUserId(userId);
    final vendorId = ModalRoute.of(context)!.settings.arguments as String;
    final vendorProvider = Provider.of<VendorProvider>(context);
    final getCurrentVendor = vendorProvider.findByVendorId(vendorId);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                getCurrentVendor!.companyName,
                style: AppStyles.semiBold18,
              ),
              const SizedBox(height: 10),
              Text(
                getCurrentVendor.vendorType,
                style: AppStyles.semiBold14.copyWith(color: AppColor.kSilver),
              )
            ],
          ),
        ),
        Column(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade300,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(56),
                onTap: () {
                  _makePhoneCall(getCurrentVendor.phoneNumber);
                },
                child: const Icon(
                  Icons.call,
                  size: 28,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade300,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(56),
                onTap: () {},
                child: const Icon(
                  Icons.location_on,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

void _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  // ignore: deprecated_member_use
  await launch(launchUri.toString());
}
