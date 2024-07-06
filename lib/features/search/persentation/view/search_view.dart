import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/widgets/adaptive_layout_widgets.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/search/persentation/view/widgets/serach_view_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  static const String routeName = 'search_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: 100.0,
          floating: true,
          snap: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Category'.tr(context),
              style: AppStyles.semiBold20.copyWith(color: Colors.white),
            ),
            background: Container(
              color: AppColor.kBackGroundColorSplash,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: AdaptiveLayout(
            mobileLayout: (context) => const SearchViewBody(),
            tabletLayout: (context) => const SearchViewBody(),
          ),
        ),
      ],
    ));
  }
}
