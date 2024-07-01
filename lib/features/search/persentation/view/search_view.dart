import 'package:car_store/core/widgets/adaptive_layout_widgets.dart';
import 'package:car_store/features/search/persentation/view/widgets/serach_view_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  static const String routeName = 'search_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: AdaptiveLayout(
        mobileLayout: (context) => const SearchViewBody(),
        tabletLayout: (context) => const SearchViewBody(),
      ),
    );
  }
}