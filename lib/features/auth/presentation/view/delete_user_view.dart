import 'package:car_store/core/service/widgets_ad_banner.dart';
import 'package:car_store/features/auth/presentation/view/widgets/delete_user_view_body.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:flutter/material.dart';

class DeleteUserView extends StatelessWidget {
  const DeleteUserView({super.key});
  static const routeName = '/DeleteUserView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AdMobBanner(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          "info account".tr(context),
        ),
      ),
      body: const DeleteUserViewBody(),
    );
  }
}
