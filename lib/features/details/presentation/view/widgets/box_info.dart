import 'dart:developer';

import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/widgets/alert_dialog.dart';
import 'package:car_store/features/auth/presentation/view/login_view.dart';
import 'package:car_store/features/details/presentation/view/widgets/item_details_car.dart';
import 'package:car_store/features/details/presentation/view_model/provider/fetch_vendor_provider.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/vendor_stroe/presentation/view/vendor_store_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BoxInfo extends StatefulWidget {
  final String userId;

  const BoxInfo({super.key, required this.userId});

  @override
  // ignore: library_private_types_in_public_api
  _BoxInfoState createState() => _BoxInfoState();
}

class _BoxInfoState extends State<BoxInfo> {
  @override
  void initState() {
    super.initState();
    Provider.of<FetchVendorDetails>(context, listen: false)
        .fetchVendorData(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FetchVendorDetails>(
      builder: (context, vendorProvider, child) {
        if (vendorProvider.vendorData == null) {
          return const Center(child: Text('Vendor not found'));
        }

        var vendorData = vendorProvider.vendorData!;
        String name = vendorData['vendorName'] ?? '';
        String image = vendorData['image'] ?? '';
        String phone = vendorData['phoneNumber'] ?? '';
        String vendorType = vendorData['companyType'] ?? '';
        String locationVendor = vendorData['location'] ?? "";
        final Uri whatsappUrl =
            Uri.parse("https:wa.me/+${removeLeadingZero(phone)}");
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(color: Colors.grey.withOpacity(.2)),
          ),
          // height: 80,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: () async {
                      DocumentSnapshot vendorData = await FirebaseFirestore
                          .instance
                          .collection('vendors')
                          .doc(widget.userId)
                          .get();
                      if (!context.mounted) return;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VendorStoreView(
                            vendorData: vendorData,
                          ),
                          settings: RouteSettings(arguments: widget.userId),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(image),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .45,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          vendorType,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
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
                        try {
                          launchUrl(whatsappUrl);
                        } catch (e) {
                          log(e.toString());
                        }
                      }
                    },
                    icon: const Icon(IconlyBold.chat),
                  ),
                  IconButton(
                    onPressed: () async {
                      final auth = FirebaseAuth.instance.currentUser;
                      if (auth!.isAnonymous) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("User not found".tr(context)),
                            content: const Text("Sign In"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context)
                                      .pushNamed(LoginView.routeName);
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          ),
                        );
                      } else {
                        _makePhoneCall(phone);
                      }
                    },
                    icon: const Icon(IconlyBold.call),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 10),
                child: ItemDetailsCar(
                  image: Assets.imagesLocation,
                  title: locationVendor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

String removeLeadingZero(String number) {
  if (number.startsWith('0')) {
    return number.substring(1);
  }
  return number;
}

void _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  // ignore: deprecated_member_use
  await launch(launchUri.toString());
}
