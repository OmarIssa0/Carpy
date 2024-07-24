import 'dart:developer';

import 'package:car_store/core/utils/animation_nav.dart';
import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/utils/size_config.dart';
import 'package:car_store/core/widgets/alert_dialog.dart';
import 'package:car_store/core/widgets/drop_down_button.dart';
import 'package:car_store/features/auth/presentation/manger/model/user_model.dart';
import 'package:car_store/features/auth/presentation/manger/provider/user_provider.dart';
import 'package:car_store/features/auth/presentation/view/login_view.dart';
import 'package:car_store/features/favorite/presentation/view/favorite_view.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/profile/presentation/view/widgets/custom_list_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel? userModel;

  Future<void> fetchUserInfo() async {
    if (user == null || user!.isAnonymous == true) {
      setState(() {});
      return;
    }

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      userModel = await userProvider.fetchUserData();
    } catch (error) {
      if (!mounted) return;
      await AlertDialogMethods.showError(
        context: context,
        subtitle: "An error has been occured".tr(context),
        titleBottom: "Ok",
        lottileAnimation: Assets.imagesErrorMas,
        function: () {
          Navigator.of(context).pop();
        },
      );
    } finally {
      setState(() {});
    }
  }

  @override
  void initState() {
    fetchUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Padding(
        padding: MediaQuery.sizeOf(context).width < SizeConfig.tablet
            ? const EdgeInsetsDirectional.symmetric(horizontal: 12)
            : EdgeInsetsDirectional.only(
                start: MediaQuery.sizeOf(context).width / 6,
                end: MediaQuery.sizeOf(context).width / 6,
              ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            user == null || user?.isAnonymous == true
                ? const SizedBox()
                : Row(
                    children: [
                      user?.photoURL == null
                          ? const CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage(Assets.imagesLogoAppRefactor),
                            )
                          : CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(user!.photoURL!),
                            ),
                      const SizedBox(width: 19),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // 'Matilda Brown',
                            // userModel?.userName ?? 'user name',
                            user?.displayName == ''.toString()
                                ? userModel?.userName ?? ''
                                : user?.displayName ??
                                    userModel?.userName ??
                                    '',
                            style: AppStyles.medium16,
                          ),
                          Text(
                            user?.email ?? 'email',
                            // userModel?.userEmail ?? 'email',
                            style: AppStyles.medium14,
                          ),
                        ],
                      ),
                    ],
                  ),
            const SizedBox(height: 33),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColor.kGrayColor.withOpacity(.2),
                // color: AppColor.kBackGroundColorSplash.withOpacity(.3),
              ),
              child: Column(
                children: [
                  user == null || user?.isAnonymous == true
                      ? const SizedBox()
                      : const SizedBox(height: 12),
                  user == null || user?.isAnonymous == true
                      ? const SizedBox()
                      : CustomListTile(
                          iconLeading: Icons.favorite,
                          iconTrailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey.shade500,
                          ),
                          title: "Favorite",
                          function: () {
                            Navigator.push(
                                context,
                                AnimationNav.navigatorAnimation(
                                    child: const FavoriteView()));
                          },
                        ),
                  const SizedBox(height: 12),
                  CustomListTile(
                      iconLeading: Icons.language,
                      iconTrailing: const DropDownButtonLocal(),
                      title: "language",
                      function: () {}),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.red.withOpacity(.2),
                // color: AppColor.kBackGroundColorSplash.withOpacity(.3),
              ),
              child: user == null || user?.isAnonymous == true
                  ? CustomListTile(
                      iconLeading: IconlyBold.login,
                      iconTrailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey.shade500,
                      ),
                      title: "Login",
                      function: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          AnimationNav.navigatorAnimation(
                              child: const LoginView()),
                          (route) => false,
                        );
                      },
                    )
                  : CustomListTile(
                      iconLeading: IconlyBold.logout,
                      iconTrailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey.shade500,
                      ),
                      title: "logout",
                      function: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.pushAndRemoveUntil(
                          context,
                          AnimationNav.navigatorAnimation(
                              child: const LoginView()),
                          (route) => false,
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
