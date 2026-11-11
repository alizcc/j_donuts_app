import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:j_donuts_app/core/motion/app_motion.dart';
import 'package:j_donuts_app/core/motion/motion_scale.dart';

/// Horizontal shared-axis page, used between registration steps.
CustomTransitionPage<void> sharedAxisPage({
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: AppMotion.pageTransition,
    reverseTransitionDuration: AppMotion.pageTransition,
    transitionsBuilder: (context, animation, secondary, child) {
      if (context.reduceMotion) return child;
      return SharedAxisTransition(
        animation: animation,
        secondaryAnimation: secondary,
        transitionType: SharedAxisTransitionType.horizontal,
        fillColor: Colors.transparent,
        child: child,
      );
    },
  );
}

/// Fade-through page, used between unrelated top-level destinations.
CustomTransitionPage<void> fadeThroughPage({
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: AppMotion.pageTransition,
    reverseTransitionDuration: AppMotion.pageTransition,
    transitionsBuilder: (context, animation, secondary, child) {
      if (context.reduceMotion) return child;
      return FadeThroughTransition(
        animation: animation,
        secondaryAnimation: secondary,
        fillColor: Colors.transparent,
        child: child,
      );
    },
  );
}
