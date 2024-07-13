import 'package:car_store/core/utils/animation_nav.dart';
import 'package:car_store/root_view.dart';
import 'package:flutter/material.dart';

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

  Future<void> loginFun(BuildContext context) async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      formKey.currentState!.save();

      _setLoading(true);
      Navigator.push(
          context, AnimationNav.navigatorAnimation(child: const RootView()));

      _setLoading(false);
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

  void _setLoading(bool value) {
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
