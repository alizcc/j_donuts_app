import 'dart:math' as math;

import 'package:flutter/rendering.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';

class PointsRingPainter extends CustomPainter {
  const PointsRingPainter({required this.progress});

  static const double strokeRatio = 0.21;
  static const double _startAngle = -math.pi / 2;
  static const int _sprinkleCount = 30;
  static const double _sprinkleLength = 10;
  static const double _sprinkleWidth = 3;
  static const double _sprinkleOpacity = 0.55;
  static const List<double> _sprinkleOffsets = [-0.25, 0.1, 0.3, -0.05];
  static const List<double> _sprinkleTilts = [0, 1.2, 0.5, 2];

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = size.shortestSide * strokeRatio;
    final center = size.center(Offset.zero);
    final radius = (size.shortestSide - stroke) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..color = AppColors.greyTrack;
    canvas.drawArc(rect, 0, 2 * math.pi, false, paint);
    if (progress <= 0) return;

    final sweep = 2 * math.pi * progress;
    final outer = radius + stroke / 2;
    paint
      ..strokeCap = StrokeCap.round
      ..shader = RadialGradient(
        colors: const [AppColors.pinkDeep, AppColors.pinkLight, AppColors.pink],
        stops: [(radius - stroke / 2) / outer, radius / outer, 1],
      ).createShader(Rect.fromCircle(center: center, radius: outer));
    canvas.drawArc(rect, _startAngle, sweep, false, paint);
    _paintSprinkles(canvas, center, radius, stroke, sweep);
  }

  void _paintSprinkles(
    Canvas canvas,
    Offset center,
    double radius,
    double stroke,
    double sweep,
  ) {
    final paint = Paint()
      ..color = AppColors.white.withValues(alpha: _sprinkleOpacity)
      ..strokeWidth = _sprinkleWidth
      ..strokeCap = StrokeCap.round;
    for (var i = 0; i < _sprinkleCount; i++) {
      final angle = 2 * math.pi * i / _sprinkleCount;
      if (angle > sweep) break;
      final distance =
          radius + stroke * _sprinkleOffsets[i % _sprinkleOffsets.length];
      final position = center + _polar(_startAngle + angle, distance);
      final direction = _startAngle + angle + _sprinkleTilts[i % 4];
      final half = _polar(direction, _sprinkleLength / 2);
      canvas.drawLine(position - half, position + half, paint);
    }
  }

  Offset _polar(double angle, double distance) =>
      Offset(math.cos(angle), math.sin(angle)) * distance;

  @override
  bool shouldRepaint(PointsRingPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
