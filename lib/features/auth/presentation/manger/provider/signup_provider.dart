import 'package:car_store/core/api/firebase_analytics.dart';
import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/widgets/alert_dialog.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SignUpProvider extends ChangeNotifier {
  // Controllers
  late TextEditingController nameTextController;
  late TextEditingController phoneTextController;
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;

  // Focus nodes
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode phoneFocusNode;
  late FocusNode nameFocusNode;

  // Form key
  final formKey = GlobalKey<FormState>();

  // State variables
  bool obscureText = true;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  SignUpProvider() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    nameTextController = TextEditingController();
    phoneTextController = TextEditingController();

    nameFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    nameTextController.dispose();
    phoneTextController.dispose();

    nameFocusNode.dispose();
    phoneFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> signUpFun(BuildContext context) async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      formKey.currentState!.save();
      try {
        setLoading(true);

        final auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextController.text.trim(),
          password: passwordTextController.text.trim(),
        );
        User? user = auth.user;
        final uid = user!.uid;
        await FirebaseFirestore.instance.collection("users").doc(uid).set({
          "userId": uid,
          "userName": nameTextController.text,
          "userEmail": emailTextController.text,
          "userPhone": phoneTextController.text,
          "userWishlist": [],
          "userBooking": [],
          "createAt": Timestamp.now(),
        });
        if (!context.mounted) return;
        Fluttertoast.showToast(
          msg: "An account has been created".tr(context),
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white,
        );
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

        FirebaseAuth.instance.setLanguageCode("ar");
        FirebaseAuth.instance.currentUser!.sendEmailVerification();
        if (!context.mounted) return;
        final analyticsService =
            Provider.of<AnalyticsService>(context, listen: false);
        analyticsService.logEvent(
          eventName: 'signup_users',
          parameters: {
            'app_type': 'users',
            'screen_name': 'signup_users',
          },
        );
        // Navigator.pushReplacement(
        //     context, AnimationNav.navigatorAnimation(child: const LoginView()));
      } on FirebaseAuthException catch (error) {
        if (error.code == "weak-password") {
          AlertDialogMethods.showError(
            context: context,
            subtitle: "The password provided is too weak.".tr(context),
            titleBottom: "Ok",
            lottileAnimation: Assets.imagesErrorMas,
            function: () {
              Navigator.of(context).pop();
            },
          );
        } else if (error.code == "email-already-in-use") {
          AlertDialogMethods.showError(
            context: context,
            subtitle: "The account already exists for that email.".tr(context),
            titleBottom: "Ok",
            lottileAnimation: Assets.imagesErrorMas,
            function: () {
              Navigator.of(context).pop();
            },
          );
        }
      } catch (error) {
        AlertDialogMethods.showError(
          context: context,
          subtitle: "An error has been occured".tr(context),
          titleBottom: "Ok",
          lottileAnimation: Assets.imagesErrorMas,
          function: () {
            Navigator.of(context).pop();
          },
        );
      } finally {
        setLoading(false);
      }
    }
  }

  // Future<void> loginFun(BuildContext context) async {
  //   final isValid = formKey.currentState!.validate();
  //   FocusScope.of(context).unfocus();

  //   if (isValid) {
  //     formKey.currentState!.save();

  //     try {
  //       _setLoading(true);

  //       final auth = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: emailTextController.text.trim(),
  //         password: passwordTextController.text.trim(),
  //       );

  //       if (auth.user!.emailVerified) {
  //         Fluttertoast.showToast(
  //           msg: "Login Successful",
  //           toastLength: Toast.LENGTH_SHORT,
  //           textColor: Colors.white,
  //         );
  //         if (!context.mounted) return;
  //         await Navigator.of(context)
  //             .pushNamedAndRemoveUntil(RootView.kRoot, (route) => false);
  //       } else {
  //         if (!context.mounted) return;
  //         AlertDialogMethods.showDialogForgotPassword(
  //           context: context,
  //           subtitle: 'Please confirm your email! Check your email!',
  //           titleBottom: 'Cancel',
  //           lottileAnimation: MangerImage.kSendEmail,
  //           function: () {},
  //         );
  //       }
  //     } on FirebaseAuthException catch (e) {
  //       _handleAuthException(context, e);
  //     } catch (error) {
  //       AlertDialogMethods.showError(
  //         context: context,
  //         subtitle: "An error has occurred: $error",
  //         titleBottom: "Ok",
  //         lottileAnimation: MangerImage.kError,
  //         function: () {
  //           Navigator.of(context).pop();
  //         },
  //       );
  //     } finally {
  //       _setLoading(false);
  //     }
  //   }
  // }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // void _handleAuthException(BuildContext context, FirebaseAuthException e) {
  //   String subtitle;
  //   if (e.code == 'user-not-found') {
  //     subtitle = "No user found for that email.";
  //   } else if (e.code == 'wrong-password') {
  //     subtitle = "Wrong password provided for that user.";
  //   } else {
  //     subtitle = e.message ?? "An unknown error occurred.";
  //   }

  //   AlertDialogMethods.showError(
  //     context: context,
  //     subtitle: subtitle,
  //     titleBottom: "Ok",
  //     lottileAnimation: MangerImage.kError,
  //     function: () {
  //       Navigator.of(context).pop();
  //     },
  //   );
  // }
}
