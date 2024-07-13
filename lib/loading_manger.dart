import 'package:car_store/core/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingMangerView extends StatelessWidget {
  const LoadingMangerView({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        if (isLoading) ...[
          // Container(
          //   color: Colors.black.withOpacity(0.7),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.transparent.withOpacity(.20),
              //     borderRadius: BorderRadius.circular(12),
              //   ),
              //   height: 75,
              //   width: 75,
              //   child: const Center(
              //     child: CircularProgressIndicator(
              //       color: Colors.black,
              //     ),
              //   ),
              // ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent.withOpacity(.20),
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 100,
                width: 100,
                child: Center(
                  child: Lottie.asset(
                    Assets.imagesLoadingCar,
                  ),
                ),
              ),
            ],
          ),
        ]
      ],
    );
  }
}
