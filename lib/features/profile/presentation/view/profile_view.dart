import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_styles.dart';
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
        // actions: const [
        //   Padding(
        //     padding: EdgeInsetsDirectional.only(end: 16),
        //     child: DropDownButtonLocal(),
        //   ),
        // ],
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "My Profile".tr(context),
          style: AppStyles.semiBold24
              .copyWith(color: AppColor.kBackGroundColorSplash),
        ),
      ),
      body: AdaptiveLayout(
        mobileLayout: (context) => const ProfileViewBody(),
        tabletLayout: (context) => const ProfileViewBody(),
      ),
    );
  }
}
