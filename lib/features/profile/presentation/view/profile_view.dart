import 'package:car_store/core/widgets/adaptive_layout_widgets.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/profile/presentation/view/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const String routeName = 'ProfileView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Settings".tr(context), // style: AppStyles.semiBold24
        ),
      ),
      body: AdaptiveLayout(
        mobileLayout: (context) => const ProfileViewBody(),
        tabletLayout: (context) => const ProfileViewBody(),
      ),
    );
  }
}
