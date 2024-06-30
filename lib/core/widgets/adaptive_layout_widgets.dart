import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
    // required this.desktopLayout,
  });

  final WidgetBuilder mobileLayout, tabletLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, covariant) {
      if (covariant.maxWidth < 800) {
        return mobileLayout(context);
      } else {
        return tabletLayout(context);
      }
    });
  }
}
