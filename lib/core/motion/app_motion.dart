import 'package:flutter/animation.dart';

/// Every duration and curve used by the app's motion lives here.
abstract final class AppMotion {
  // Durations
  static const Duration instant = Duration(milliseconds: 90);
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration medium = Duration(milliseconds: 280);
  static const Duration slow = Duration(milliseconds: 450);
  static const Duration pageTransition = Duration(milliseconds: 380);
  static const Duration stagger = Duration(milliseconds: 70);
  static const Duration entrance = Duration(milliseconds: 600);
  static const Duration countUp = Duration(milliseconds: 1400);
  static const Duration ringSweep = Duration(milliseconds: 1200);
  static const Duration shake = Duration(milliseconds: 420);
  static const Duration shimmer = Duration(milliseconds: 1300);
  static const Duration carouselInterval = Duration(seconds: 4);
  static const Duration drift = Duration(seconds: 6);

  // Curves
  static const Curve standard = Curves.easeInOutCubic;
  static const Curve emphasized = Curves.easeOutCubic;
  static const Curve overshoot = Curves.easeOutBack;

  // Scales and offsets
  static const double pressedScale = 0.96;
  static const double shakeOffset = 10;
  static const int shakeCycles = 3;
}
