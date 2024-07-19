import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerLoading extends StatelessWidget {
  const CustomShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      height: 100.0,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              10,
              (index) => Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                height: 100.0,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
