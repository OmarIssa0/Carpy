import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/widgets/alert_dialog.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPasswordProvider extends ChangeNotifier {
  late TextEditingController emailController;
  late FocusNode emailFocusNode;

  final formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ForgetPasswordProvider() {
    emailController = TextEditingController();
    emailFocusNode = FocusNode();
  }

  Future<void> forgetPasswordFun(BuildContext context) async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      formKey.currentState!.save();

      try {
        _setLoading(true);
        FirebaseAuth.instance.setLanguageCode("ar");
        FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailController.text.trim());
        if (!context.mounted) return;
        AlertDialogMethods.showDialogForgotPassword(
          context: context,
          subtitle:
              'Please confirm your email! Please check your email!'.tr(context),
          // isError: false,
          titleBottom: 'Cancel'.tr(context),
          lottileAnimation: Assets.imagesSendEmailCar,
          function: () {
            Navigator.of(context).pop();
          },
        );
      } on FirebaseAuthException catch (e) {
        if (!context.mounted) return;
        AlertDialogMethods.showError(
          context: context,
          subtitle: "${e.message}",
          titleBottom: "Ok",
          lottileAnimation: Assets.imagesErrorMas,
          function: () {
            Navigator.of(context).pop();
          },
        );
      } catch (e) {
        if (!context.mounted) return;
        AlertDialogMethods.showError(
          context: context,
          subtitle: "$e",
          titleBottom: "Ok",
          lottileAnimation: Assets.imagesErrorMas,
          function: () {
            Navigator.of(context).pop();
          },
        );
      } finally {
        _setLoading(false);
      }
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }
}
