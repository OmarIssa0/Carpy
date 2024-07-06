import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/lang/cubit/locale_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownButtonLocal extends StatelessWidget {
  const DropDownButtonLocal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocaleCubit, LocaleState>(
      listener: (context, state) {
        if (state is ChangeLocaleState) {}
      },
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          if (state is ChangeLocaleState) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300,
              ),
              child: DropdownButton<String>(
                // isExpanded: true,

                hint: Text("the language".tr(context)),
                underline: const SizedBox(),
                dropdownColor: Colors.white,
                // focusColor: AppColor.kBackGroundColor,
                borderRadius: BorderRadius.circular(12),
                value: state.locale.languageCode,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: ["ar", 'en'].map((String Item) {
                  return DropdownMenuItem<String>(
                    value: Item,
                    child: Text(Item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    // BlocProvider.of<LocaleCubit>(context)
                    //     .changeLanguage(newValue);
                    context.read<LocaleCubit>().changeLanguage(newValue);
                  }
                },
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
