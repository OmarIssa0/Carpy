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

      _setLoading(true);
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
