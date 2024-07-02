import 'package:car_store/core/widgets/adaptive_layout_widgets.dart';
import 'package:car_store/features/details/peresentation/view/widgets/details_view_body.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});
  static const String routeName = 'details_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          )
        ],
      ),
      body: AdaptiveLayout(
        mobileLayout: (context) => const DetailsViewBody(),
        tabletLayout: (context) => const DetailsViewBody(),
      ),
    );
  }
}
