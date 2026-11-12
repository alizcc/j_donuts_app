import 'dart:math' as math;

import 'package:flutter/rendering.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';

class DonutProgressPainter extends CustomPainter {
  const DonutProgressPainter({required this.fraction});

  static const double _startAngle = -math.pi / 2;
  static const double _glazeRatio = 0.86;
  static const double _holeEdgeRatio = 0.36;
  static const double _holeRatio = 0.28;
  static const int _sprinkleCount = 22;
  static const double _goldenAngle = 2.4;
  static const double _sprinkleLengthRatio = 0.1;
  static const double _sprinkleWidthRatio = 0.045;
  static const double _sprinkleMargin = 0.08;

  static const _DonutColors _done = _DonutColors(
    dough: AppColors.donutDough,
    glaze: AppColors.pinkLight,
    sprinkles: AppColors.sprinkles,
  );
  static const _DonutColors _todo = _DonutColors(
    dough: AppColors.sprinkleGrey,
    glaze: AppColors.glazeGrey,
    sprinkles: [AppColors.white, AppColors.sprinkleGrey],
  );

  final double fraction;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.shortestSide / 2;
    if (fraction <= 0 || fraction >= 1) {
      _paintDonut(canvas, center, radius, fraction >= 1 ? _done : _todo);
      return;
    }

    final doneSweep = 2 * math.pi * fraction;
    canvas
      ..save()
      ..clipPath(_slice(center, radius, _startAngle, doneSweep));
    _paintDonut(canvas, center, radius, _done);
    canvas
      ..restore()
      ..save()
      ..clipPath(
        _slice(
          center,
          radius,
          _startAngle + doneSweep,
          2 * math.pi - doneSweep,
        ),
      );
    _paintDonut(canvas, center, radius, _todo);
    canvas.restore();
  }

  Path _slice(Offset center, double radius, double start, double sweep) =>
      Path()
        ..moveTo(center.dx, center.dy)
        ..arcTo(
          Rect.fromCircle(center: center, radius: radius),
          start,
          sweep,
          false,
        )
        ..close();

  void _paintDonut(
    Canvas canvas,
    Offset center,
    double radius,
    _DonutColors colors,
  ) {
    canvas
      ..drawCircle(center, radius, Paint()..color = colors.dough)
      ..drawCircle(center, radius * _glazeRatio, Paint()..color = colors.glaze)
      ..drawCircle(
        center,
        radius * _holeEdgeRatio,
        Paint()..color = colors.dough,
      )
      ..drawCircle(
        center,
        radius * _holeRatio,
        Paint()..color = AppColors.white,
      );
    _paintSprinkles(canvas, center, radius, colors.sprinkles);
  }

  void _paintSprinkles(
    Canvas canvas,
    Offset center,
    double radius,
    List<Color> colors,
  ) {
    final inner = radius * (_holeEdgeRatio + _sprinkleMargin);
    final outer = radius * (_glazeRatio - _sprinkleMargin);
    final paint = Paint()
      ..strokeWidth = radius * _sprinkleWidthRatio
      ..strokeCap = StrokeCap.round;
    final half = radius * _sprinkleLengthRatio / 2;
    for (var i = 0; i < _sprinkleCount; i++) {
      // golden angle spreads the sprinkles evenly
      final angle = i * _goldenAngle;
      final distance = inner + (outer - inner) * ((i % 4) + 0.5) / 4;
      final position =
          center + Offset(math.cos(angle), math.sin(angle)) * distance;
      final tilt = Offset(math.cos(angle * 3), math.sin(angle * 3)) * half;
      paint.color = colors[i % colors.length];
      canvas.drawLine(position - tilt, position + tilt, paint);
    }
  }

  @override
  bool shouldRepaint(DonutProgressPainter oldDelegate) =>
      oldDelegate.fraction != fraction;
}

class _DonutColors {
  const _DonutColors({
    required this.dough,
    required this.glaze,
    required this.sprinkles,
  });

  final Color dough;
  final Color glaze;
  final List<Color> sprinkles;
}
