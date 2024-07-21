import 'dart:developer';
import 'package:car_store/features/vendor_stroe/presentation/view/widgets/app_bar_vendor_view.dart';
import 'package:car_store/features/vendor_stroe/presentation/view/widgets/vendor_store_view_body.dart';
import 'package:car_store/root_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

class VendorStoreView extends StatelessWidget {
  const VendorStoreView({super.key, this.vendorData});
  static const String routeName = '/kVendorStore';
  final DocumentSnapshot? vendorData;
  String removeLeadingZero(String number) {
    if (number.startsWith('0')) {
      return number.substring(1);
    }
    return number;
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = vendorData?.data() as Map<String, dynamic>?;

    String image = data?['image'] ?? '';
    String phoneNumber = data?['phoneNumber'] ?? '';

    final Uri whatsappUrl =
        Uri.parse("https:wa.me/+${removeLeadingZero(phoneNumber)}");
    // String? refactorPhoneNumber;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          try {
            launchUrl(whatsappUrl);
          } catch (e) {
            log(e.toString());
          }
        },
        child: const Icon(Ionicons.logo_whatsapp, color: Colors.white),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              AppBarVendorView(image: image),
              SliverToBoxAdapter(
                child: VendorStoreViewBody(
                  vendorData: vendorData!,
                ),
              ),
            ],
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AdMobBanner(),
          ),
        ],
      ),
    );
  }
}


// void _sendWhatsAppMessage(String phone) async {
//   var whatsappUrl = "https://wa.me/$phone}";
//   if (await canLaunch(whatsappUrl)) {
//     await launch(whatsappUrl);
//   } else {
//     print("Could not launch $whatsappUrl");
//   }
// }
