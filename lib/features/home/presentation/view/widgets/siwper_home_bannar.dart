
import 'package:car_store/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class SwiperHomeView extends StatelessWidget {
  const SwiperHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.sizeOf(context).width < SizeConfig.tablet
          ? const EdgeInsetsDirectional.symmetric(horizontal: 16)
          : EdgeInsetsDirectional.only(
              start: MediaQuery.sizeOf(context).width / 6,
              end: MediaQuery.sizeOf(context).width / 6,
            ),
      child: const SwiperHomeView(),
    );
  }
}
