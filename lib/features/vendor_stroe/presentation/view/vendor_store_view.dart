import 'package:car_store/core/widgets/adaptive_layout_widgets.dart';
import 'package:car_store/features/vendor_stroe/presentation/view/widgets/vendor_store_view_body.dart';
import 'package:flutter/material.dart';

class VendorStoreView extends StatelessWidget {
  const VendorStoreView({super.key});
  static const String routeName = '/kVendorStore';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => const VendorStoreViewBody(),
        tabletLayout: (context) => const VendorStoreViewBody(),
      ),
    );
  }
}
