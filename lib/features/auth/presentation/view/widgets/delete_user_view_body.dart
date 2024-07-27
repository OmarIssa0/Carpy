import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/utils/size_config.dart';
import 'package:car_store/core/widgets/alert_dialog.dart';
import 'package:car_store/core/widgets/custom_button.dart';
import 'package:car_store/features/auth/presentation/manger/provider/user_provider.dart';
import 'package:car_store/features/auth/presentation/view/login_view.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteUserViewBody extends StatelessWidget {
  const DeleteUserViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: MediaQuery.sizeOf(context).width < SizeConfig.tablet
            ? const EdgeInsetsDirectional.symmetric(horizontal: 24)
            : EdgeInsetsDirectional.only(
                start: MediaQuery.sizeOf(context).width / 6,
                end: MediaQuery.sizeOf(context).width / 6,
              ),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Text(
              "Are you sure you want to delete your account?".tr(context),
              style: AppStyles.medium20,
            ),
            const SizedBox(height: 50),
            CustomButton(
              color: Colors.red,
              title: "Delete account".tr(context),
              onPressed: () async {
                AlertDialogMethods.showDialogWaring(
                  context: context,
                  subtitle: "Are you sure you want to delete your account?"
                      .tr(context),
                  titleBottom: "Delete account".tr(context),
                  isGreen: true,
                  isError: false,
                  lottileAnimation: Assets.imagesErrorMas,
                  function: () async {
                    await FirebaseAuth.instance.currentUser!.delete();
                    FirebaseFirestore.instance
                        .collection("users")
                        .doc(userProvider.getUserModel!.userId)
                        .delete();
                    if (!context.mounted) return;
                    Navigator.of(context).pop();
                    Navigator.of(context)
                        .pushReplacementNamed(LoginView.routeName);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
