import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/features/auth/presentation/manger/provider/google_auth_provider.dart';
import 'package:car_store/loading_manger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoogleAuth extends StatelessWidget {
  const GoogleAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<GoogleProviderAuthLoginAndSignUp>(
      builder: (context, provider, child) {
        return LoadingMangerView(
          isLoading: provider.isLoading,
          child: GestureDetector(
            onTap: () => provider.signInWithGoogle(context),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 28,
              child: Image.asset(
                Assets.imagesGoogle,
                height: 48,
              ),
            ),
          ),
        );
      },
    );
  }
}
