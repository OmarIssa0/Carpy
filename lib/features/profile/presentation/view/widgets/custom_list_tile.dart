import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.iconLeading,
      required this.iconTrailing,
      required this.title,
      required this.function});

  final IconData iconLeading;
  final Widget iconTrailing;
  final String title;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: ListTile(
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
            child: Icon(
              //
              iconLeading,
              size: 28,
            ),
          ),
          title: Text(
            title.tr(context),
            style: AppStyles.regular16,
          ),
          trailing: iconTrailing),
    );
  }
}
