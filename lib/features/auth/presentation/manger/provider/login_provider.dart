import 'package:car_store/core/utils/animation_nav.dart';
import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/widgets/alert_dialog.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/root_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginProvider with ChangeNotifier {
  // Controllers
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;

  // Focus nodes
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;

  // Form key
  final formKey = GlobalKey<FormState>();

  // State variables
  bool obscureText = true;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  void changeObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }

  LoginProvider() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> signInAnonymously(BuildContext context) async {
    try {
      _setLoading(true);
      await FirebaseAuth.instance.signInAnonymously();

      if (!context.mounted) return;
      Navigator.pushReplacement(
        context,
        AnimationNav.navigatorAnimation(
          child: const RootView(),
        ),
      );
      Fluttertoast.showToast(msg: "Login Success");
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return;
      // log("Failed to sign in anonymously: $e");
      AlertDialogMethods.showError(
        context: context,
        subtitle: e.message,
        titleBottom: "Try Again".tr(context),
        lottileAnimation: Assets.imagesErrorMas,
        function: () {
          Navigator.of(context).pop();
        },
      );
    } catch (e) {
      if (!context.mounted) return;
      AlertDialogMethods.showError(
        context: context,
        subtitle: e.toString(),
        titleBottom: "Try Again".tr(context),
        lottileAnimation: Assets.imagesErrorMas,
        function: () {
          Navigator.of(context).pop();
        },
      );
    } finally {
      _setLoading(false);
    }
  }

  Future<void> loginFun(BuildContext context) async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      formKey.currentState!.save();

      try {
        _setLoading(true);

        final auth = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailTextController.text.trim(),
          password: passwordTextController.text.trim(),
        );

        if (auth.user!.emailVerified) {
          if (!context.mounted) return;
          Fluttertoast.showToast(
            msg: "Login Successful".tr(context),
            toastLength: Toast.LENGTH_SHORT,
            textColor: Colors.white,
          );
          if (!context.mounted) return;
          await Navigator.of(context)
              .pushNamedAndRemoveUntil(RootView.routeName, (route) => false);
        } else {
          if (!context.mounted) return;
          AlertDialogMethods.showDialogForgotPassword(
            context: context,
            subtitle: "Please confirm your email! Please check your email!"
                .tr(context),
            titleBottom: 'Cancel'.tr(context),
            lottileAnimation: Assets.imagesSendEmailCar,
            function: () {},
          );
        }
      } on FirebaseAuthException catch (e) {
        if (!context.mounted) return;
        _handleAuthException(context, e);
      } catch (error) {
        if (!context.mounted) return;
        AlertDialogMethods.showError(
          context: context,
          subtitle: "An error has occurred: $error",
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

  void _handleAuthException(BuildContext context, FirebaseAuthException e) {
    String subtitle;
    if (e.code == 'user-not-found') {
      subtitle = "No user found for that email.".tr(context);
    } else if (e.code == 'wrong-password') {
      subtitle = "Wrong password provided for that user.".tr(context);
    } else {
      subtitle = e.message ?? "An unknown error occurred.".tr(context);
    }

    AlertDialogMethods.showError(
      context: context,
      subtitle: subtitle,
      titleBottom: "Ok",
      lottileAnimation: Assets.imagesErrorMas,
      function: () {
        Navigator.of(context).pop();
      },
    );
  }
}
