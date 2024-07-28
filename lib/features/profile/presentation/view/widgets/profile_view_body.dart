import 'package:car_store/core/utils/animation_nav.dart';
import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/utils/size_config.dart';
import 'package:car_store/core/widgets/alert_dialog.dart';
import 'package:car_store/core/widgets/custom_button.dart';
import 'package:car_store/core/widgets/drop_down_button.dart';
import 'package:car_store/features/auth/presentation/manger/model/user_model.dart';
import 'package:car_store/features/auth/presentation/manger/provider/user_provider.dart';
import 'package:car_store/features/auth/presentation/view/delete_user_view.dart';
import 'package:car_store/features/auth/presentation/view/login_view.dart';
import 'package:car_store/features/favorite/presentation/view/favorite_view.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/profile/presentation/view/help_view.dart';
import 'package:car_store/features/profile/presentation/view/privacy_policy_veiw.dart';
import 'package:car_store/features/profile/presentation/view/terms_of_use_view.dart';
import 'package:car_store/features/profile/presentation/view/widgets/custom_list_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
            ? const EdgeInsetsDirectional.only(start: 16, end: 12)
            : EdgeInsetsDirectional.only(
                start: MediaQuery.sizeOf(context).width / 6,
                end: MediaQuery.sizeOf(context).width / 6,
              ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            user == null || user?.isAnonymous == true
                ? const SizedBox()
                : FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
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
                              maxLines: 1,
                              user?.displayName == ''.toString()
                                  ? userModel?.userName ?? ''
                                  : user?.displayName ??
                                      userModel?.userName ??
                                      '',
                              style: AppStyles.medium16,
                            ),
                            Text(
                              userModel?.userPhone ?? user?.phoneNumber ?? "",
                              style: AppStyles.medium14,
                            ),
                            // Text(
                            //   user?.email ?? 'email',
                            //   style: AppStyles.medium14,
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
            user == null || user?.isAnonymous == true
                ? const SizedBox.shrink()
                : const SizedBox(height: 33),
            Text("Profile".tr(context), style: AppStyles.medium16),
            const SizedBox(height: 12),
            user == null || user?.isAnonymous == true
                ? const SizedBox.shrink()
                : CustomListTile(
                    iconLeading: IconlyLight.profile,
                    iconTrailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey.shade500,
                    ),
                    title: "info account",
                    function: () {
                      Navigator.push(
                        context,
                        AnimationNav.navigatorAnimation(
                          child: const DeleteUserView(),
                        ),
                      );
                    },
                  ),
            const SizedBox(height: 12),
            CustomListTile(
              iconLeading: Icons.language,
              iconTrailing: const DropDownButtonLocal(),
              title: "language",
              iconColor: Colors.grey.shade600,
              function: () {},
            ),
            const SizedBox(height: 33),
            Text("Support".tr(context), style: AppStyles.medium16),
            const SizedBox(height: 12),
            CustomListTile(
              iconLeading: IconlyLight.info_circle,
              iconTrailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey.shade500,
              ),
              title: "help",
              function: () {
                Navigator.push(
                  context,
                  AnimationNav.navigatorAnimation(
                    child: const HelpView(),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            CustomListTile(
              iconLeading: IconlyLight.edit,
              iconTrailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey.shade500,
              ),
              title: "terms of use",
              function: () {
                Navigator.push(
                  context,
                  AnimationNav.navigatorAnimation(
                    child: const TermsOfUseView(),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            CustomListTile(
              iconLeading: IconlyLight.document,
              iconTrailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey.shade500,
              ),
              title: "privacy policy",
              function: () {
                Navigator.push(
                  context,
                  AnimationNav.navigatorAnimation(
                    child: const PrivacyPolicyView(),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            CustomListTile(
              iconLeading: IconlyLight.call,
              iconTrailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey.shade500,
              ),
              title: "call us",
              function: () async {
                await _sendEmail();
              },
            ),
            const SizedBox(height: 55),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: user == null || user?.isAnonymous == true
                  ? CustomButton(
                      color: Colors.green.shade800,
                      title: "Login".tr(context),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          AnimationNav.navigatorAnimation(
                              child: const LoginView()),
                          (route) => false,
                        );
                      },
                    )
                  : CustomButton(
                      color: Colors.red.shade800,
                      title: "Log out".tr(context),
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.pushAndRemoveUntil(
                          context,
                          AnimationNav.navigatorAnimation(
                              child: const LoginView()),
                          (route) => false,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _sendEmail() async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'storecar85@gmail.com',
    queryParameters: {
      'subject': 'دعم Carpy',
    },
  );

  try {
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      // رسالة توضيحية عند عدم القدرة على فتح تطبيق البريد الإلكتروني
      throw 'لا يمكن فتح تطبيق البريد الإلكتروني. تحقق من أنك قمت بتثبيت تطبيق بريد إلكتروني.';
    }
  } catch (e) {
    // معالجة الأخطاء
    print('حدث خطأ: $e');
  }
}
