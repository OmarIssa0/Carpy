import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text(
              "CarStore",
              style: AppStyles.semiBold24.copyWith(
                color: AppColor.kBackGroundColorSplash,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: HomeViewBody(),
          ),
        ],
      ),
    );
  }
}
