import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:flutter/material.dart';

class OrSignInAndSignUp extends StatelessWidget {
  const OrSignInAndSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: .5,
            color: Color(0xffc4c4c4),
            endIndent: 12,
          ),
        ),
        Text("OR".tr(context), style: AppStyles.regular12),
        const Expanded(
          child: Divider(
            thickness: .5,
            indent: 12,
            color: Color(0xffc4c4c4),
          ),
        ),
      ],
    );
  }
}
