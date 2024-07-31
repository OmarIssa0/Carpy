import 'package:car_store/core/api/firebase_analytics.dart';
import 'package:car_store/core/utils/animation_nav.dart';
import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:car_store/features/profile/presentation/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    final analyticsService = Provider.of<AnalyticsService>(context);

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            floating: true,
            actions: [
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 8),
                child: IconButton(
                  onPressed: () {
                    analyticsService.logEvent(
                      eventName: 'click_menu_profile',
                      parameters: {
                        'app_type': 'users',
                        'screen_name': 'profile',
                      },
                    );
                    Navigator.of(context).push(
                      AnimationNav.navigatorAnimationProfileView(
                        child: const ProfileView(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: AppColor.kBackGroundColorSplash,
                  ),
                ),
              )
            ],
            title: Text(
              "Carpy",
              style: AppStyles.semiBold24.copyWith(
                color: AppColor.kBackGroundColorSplash,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: HomeViewBody(),
          ),
          // const HomeViewBody(),
        ],
      ),
    );
  }
}
