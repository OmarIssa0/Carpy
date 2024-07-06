import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/utils/size_config.dart';
import 'package:car_store/core/widgets/drop_down_button.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: MediaQuery.sizeOf(context).width < SizeConfig.tablet
            ? const EdgeInsetsDirectional.symmetric(horizontal: 12)
            : EdgeInsetsDirectional.only(
                start: MediaQuery.sizeOf(context).width / 6,
                end: MediaQuery.sizeOf(context).width / 6,
              ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Image.asset(Assets.imagesIconApp, height: 60),
            //     const SizedBox(width: 16),
            //     const Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text("Oamr issa", style: AppStyles.semiBold20),
            //         Text("07970079797", style: AppStyles.semiBold20),
            //       ],
            //     ),
            //   ],
            // ),
            // const Divider(
            //   height: 32,
            //   color: Colors.black12,
            // ),
            // const DropDownButtonLocal(),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(Assets.imagesFerareCar),
                ),
                SizedBox(width: 19),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // 'Matilda Brown',
                      'name company',
                      style: AppStyles.regular12,
                    ),
                    Text(
                      "+962799999999",
                      style: AppStyles.medium14,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 33),
            DropDownButtonLocal(),
          ],
        ),
      ),
    );
  }
}
