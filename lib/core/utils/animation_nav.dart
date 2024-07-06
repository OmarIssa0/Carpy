import 'package:flutter/cupertino.dart';

class AnimationNav {
  // static Route addingShippingButton() {
  //   return PageRouteBuilder(
  //     transitionDuration: const Duration(seconds: 1),
  //     reverseTransitionDuration: const Duration(seconds: 1),
  //     pageBuilder: (context, animation, secondaryAnimation) =>
  //         const AddingShippingAddresses(),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       const begin = Offset(0.0, 5.0);
  //       const end = Offset.zero;
  //       const curve = Curves.ease;

  //       var tween =
  //           Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  //       return SlideTransition(
  //         position: animation.drive(tween),
  //         child: const AddingShippingAddresses(),
  //       );
  //     },
  //   );
  // }

  static Route navigatorAnimation(
      {required Widget child, BuildContext? context}) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      reverseTransitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(5.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
