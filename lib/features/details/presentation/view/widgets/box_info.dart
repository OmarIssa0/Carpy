import 'package:car_store/core/utils/animation_nav.dart';
import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/widgets/alert_dialog.dart';
import 'package:car_store/features/auth/presentation/view/login_view.dart';
import 'package:car_store/features/details/presentation/view_model/provider/send_booking_provider.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/search/presentation/view_model/provider/product_provider.dart';
import 'package:car_store/features/vendor_stroe/presentation/view/vendor_store_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BoxInfo extends StatelessWidget {
  BoxInfo({super.key});
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrentProduct = productProvider.findByProductId(productId);
    // final vendor = Provider.of<VendorProvider>(context).findByVendorId(
    //   getCurrentProduct!.userId,
    // );

    return getCurrentProduct == null
        ? const SizedBox.shrink()
        : StreamBuilder(
            stream: _firestore
                .collection('vendors')
                .doc(getCurrentProduct.userId)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: SizedBox());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (!snapshot.hasData || !snapshot.data!.exists) {
                return const Center(child: Text('Vendor not found'));
              }
              final providerLocation =
                  Provider.of<SendBookingProvider>(context);
              providerLocation.location = snapshot.data!['location'];

              var vendorData = snapshot.data!.data() as Map<String, dynamic>;
              String name = vendorData['vendorName'] ?? '';
              String image = vendorData['image'] ?? '';
              String phone = vendorData['phoneNumber'] ?? '';
              // location = vendorData['location'] ?? '';

              return Container(
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
                            settings: RouteSettings(
                                arguments: getCurrentProduct.userId),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(image),
                        // NetworkImage(getCurrentProduct.imageCompany),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                        width: MediaQuery.sizeOf(context).width * .55,
                        child: Text(name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.regular16)),
                    const Spacer(),
                    IconButton(
                      onPressed: () async {
                        final auth = FirebaseAuth.instance.currentUser;
                        if (auth!.isAnonymous == true) {
                          AlertDialogMethods.showError(
                            context: context,
                            subtitle: "User not found".tr(context),
                            titleBottom: "Sign In".tr(context),
                            lottileAnimation: Assets.imagesErrorMas,
                            function: () {
                              Navigator.of(context).pop();
                              Navigator.of(context)
                                  .pushNamed(LoginView.routeName);
                            },
                          );
                        } else {
                          _makePhoneCall(phone);
                        }
                      },
                      icon: const Icon(
                        IconlyBold.call,
                      ),
                    )
                  ],
                ),
              );
            });
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
