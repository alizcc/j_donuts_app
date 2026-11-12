import 'dart:math' as math;

import 'package:flutter/rendering.dart';

class ArcPainter extends CustomPainter {
  const ArcPainter({
    required this.progress,
    required this.color,
    required this.trackColor,
    required this.strokeWidth,
    this.startAngle = -math.pi / 2,
    this.sweepAngle = 2 * math.pi,
  });

  final double progress;
  final Color color;
  final Color trackColor;
  final double strokeWidth;
  final double startAngle;
  final double sweepAngle;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = (Offset.zero & size).deflate(strokeWidth / 2);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas
      ..drawArc(rect, startAngle, sweepAngle, false, paint..color = trackColor)
      ..drawArc(
        rect,
        startAngle,
        sweepAngle * progress,
        false,
        paint..color = color,
      );
  }

  @override
  bool shouldRepaint(ArcPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}
