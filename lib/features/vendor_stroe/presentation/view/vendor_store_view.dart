import 'dart:ui';
import 'package:car_store/features/vendor_stroe/presentation/view/widgets/vendor_store_view_body.dart';
import 'package:car_store/features/vendor_stroe/presentation/view_model/provider/vendor_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class VendorStoreView extends StatelessWidget {
  const VendorStoreView({super.key});
  static const String routeName = '/kVendorStore';

  @override
  Widget build(BuildContext context) {
    // final productProvider = Provider.of<ProductProvider>(context);
    // final userId = ModalRoute.of(context)!.settings.arguments as String;
    final vendorId = ModalRoute.of(context)!.settings.arguments as String;
    final vendorProvider = Provider.of<VendorProvider>(context);
    final getCurrentVendor = vendorProvider.findByVendorId(vendorId);
    // final getCurrentProduct = productProvider.findByUserId(userId);
    return Scaffold(
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
              background: Hero(
                tag: "OMAR",
                child: getCurrentVendor?.imageCompany == null
                    ? const SizedBox.shrink()
                    : Image.asset(
                        getCurrentVendor!.imageCompany,
                        fit: BoxFit.cover,
                      ),
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
          const SliverToBoxAdapter(
            child: VendorStoreViewBody(),
          ),
        ],
      ),
    );
  }
}
