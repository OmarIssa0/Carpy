import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/widgets/alert_dialog.dart';
import 'package:car_store/root_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleProviderAuthLoginAndSignUp with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> signInWithGoogle(BuildContext context) async {
    _setLoading(true);

    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        _setLoading(false);
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);

      await FirebaseFirestore.instance
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .set({
        "userId": _auth.currentUser!.uid,
        "userName": _auth.currentUser!.displayName,
        "userEmail": _auth.currentUser!.email,
        "userPhone": _auth.currentUser!.phoneNumber,
        "userWishList": [],
        "createAt": Timestamp.now(),
      });

      _setLoading(false);
      if (!context.mounted) return;
      Navigator.of(context).pushReplacementNamed(RootView.routeName);
    } on FirebaseAuthException catch (error) {
      if (!context.mounted) return;
      AlertDialogMethods.showError(
        context: context,
        subtitle: "An error has occurred: ${error.message}",
        titleBottom: "Ok",
        lottileAnimation: Assets.imagesErrorMas,
        function: () {
          Navigator.of(context).pop();
        },
      );

      _setLoading(false);
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

      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
