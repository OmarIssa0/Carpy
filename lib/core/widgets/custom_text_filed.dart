import 'package:car_store/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
    required this.title,
    required this.textInputType,
    this.controller,
    this.prefix,
    this.validator,
    this.focusNode,
    this.onFieldSubmitted,
    this.textInputAction,
    this.obscureText = false,
    this.onTap,
    this.readOnly = false,
    this.maxLength,
    this.maxLengthEnforcement,
    this.prefixText,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String title;
  final Widget? prefix;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final void Function()? onTap;
  final bool readOnly;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final String? prefixText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLengthEnforcement: maxLengthEnforcement,
      maxLength: maxLength,
      obscureText: obscureText ?? false,
      textInputAction: textInputAction,
      // cursorColor: AppColor.kIconColor,
      controller: controller,
      keyboardType: textInputType,
      focusNode: focusNode,
      decoration: InputDecoration(
        prefixText: prefixText,
        // prefixStyle: const TextStyle(color: AppColor.kIconColor, fontSize: 14),
        // labelText: labelText,
        filled: true,
        fillColor: Colors.white,
        prefixIcon: prefix,
        hintText: title,
        labelStyle: const TextStyle(color: AppColor.kSilver),
        hintFadeDuration: Durations.short2,
        hintStyle: const TextStyle(
          color: AppColor.kSilver,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedErrorBorder: buildBorder(),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColor.kSilver.withOpacity(.2))),
      ),
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      readOnly: readOnly,
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: AppColor.kSilver.withOpacity(.2),
    ),
  );
}
