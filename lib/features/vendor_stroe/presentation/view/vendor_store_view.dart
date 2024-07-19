import 'dart:developer';
import 'dart:ui';
import 'package:car_store/features/vendor_stroe/presentation/view/widgets/vendor_store_view_body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0.0,
            expandedHeight: 275,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.blurBackground
              ],
              background: image == null
                  ? const SizedBox.shrink()
                  : FancyShimmerImage(
                      imageUrl: image,
                      boxFit: BoxFit.cover,
                    ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                height: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(56),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    margin: const EdgeInsetsDirectional.only(start: 24),
                    height: 56,
                    width: 56,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(.2),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            leadingWidth: 80,
          ),
          SliverToBoxAdapter(
            child: VendorStoreViewBody(
              vendorData: vendorData!,
            ),
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
