import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/core/widgets/adaptive_layout_widgets.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/search/presentation/view/widgets/serach_view_body.dart';
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
            stretchModes: const [
              StretchMode.zoomBackground,
              StretchMode.blurBackground,
            ],
            title: Padding(
              padding: const EdgeInsetsDirectional.only(start: 12),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Brand'.tr(context),
                  style: AppStyles.semiBold16.copyWith(color: Colors.white),
                ),
              ),
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
