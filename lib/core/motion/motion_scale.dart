import 'package:flutter/widgets.dart';

extension MotionScaleX on BuildContext {
  /// Whether the user enabled Reduce Motion / Remove Animations.
  bool get reduceMotion => MediaQuery.maybeDisableAnimationsOf(this) ?? false;

  /// [duration], or [Duration.zero] when Reduce Motion is on.
  Duration motion(Duration duration) => reduceMotion ? Duration.zero : duration;
}
