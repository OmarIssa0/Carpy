
import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:url_launcher/url_launcher.dart';

class BoxInfo extends StatelessWidget {
  const BoxInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          // color: AppColor.kGrayColor.withOpacity(.2),
          color: AppColor.kBackGroundColorSplash.withOpacity(.3)),
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
          const SizedBox(width: 6),
          const CircleAvatar(
            backgroundColor: Colors.white,
          ),
          const SizedBox(width: 10),
          SizedBox(
              width: MediaQuery.sizeOf(context).width * .55,
              child: const Text("Name Company",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.regular16)),
          const Spacer(),
          IconButton(
            onPressed: () async {
              _makePhoneCall("+919999999999");
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
