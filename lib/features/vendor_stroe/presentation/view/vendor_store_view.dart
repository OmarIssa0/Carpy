import 'package:car_store/core/service/widgets_ad_banner.dart';
import 'package:car_store/features/vendor_stroe/presentation/view/widgets/app_bar_vendor_view.dart';
import 'package:car_store/features/vendor_stroe/presentation/view/widgets/vendor_store_view_body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
    // String phoneNumber = data?['phoneNumber'] ?? '';

    // final Uri whatsappUrl =
    //     Uri.parse("https:wa.me/+${removeLeadingZero(phoneNumber)}");
    // String? refactorPhoneNumber;
    return Scaffold(
      bottomNavigationBar: const AdMobBanner(),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.green,
      //   onPressed: () {
      //     final auth = FirebaseAuth.instance.currentUser;
      //     if (auth!.isAnonymous == true) {
      //       AlertDialogMethods.showError(
      //         context: context,
      //         subtitle: "User not found".tr(context),
      //         titleBottom: "Sign In".tr(context),
      //         lottileAnimation: Assets.imagesErrorMas,
      //         function: () {
      //           Navigator.of(context).pop();
      //           Navigator.of(context).pushNamed(LoginView.routeName);
      //         },
      //       );
      //     } else {
      //       try {
      //         launchUrl(whatsappUrl);
      //       } catch (e) {
      //         log(e.toString());
      //       }
      //     }
      //   },
      //   child: const Icon(Ionicons.logo_whatsapp, color: Colors.white),
      // ),
      body: CustomScrollView(
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
    );
  }
}
