import 'package:flutter/material.dart';

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
      _setLoading(true);
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
