import 'package:flutter/rendering.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';

class CoffeeGlassPainter extends CustomPainter {
  const CoffeeGlassPainter();

  static const double _taperRatio = 0.15;
  static const double _rimWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    final taper = size.width * _taperRatio;
    final glass = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width - taper, size.height)
      ..lineTo(taper, size.height)
      ..close();
    final fill = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [AppColors.latteCream, AppColors.coffee],
      ).createShader(Offset.zero & size);
    final rim = Paint()
      ..color = AppColors.coffee
      ..strokeWidth = _rimWidth;
    canvas
      ..drawPath(glass, fill)
      ..drawLine(Offset.zero, Offset(size.width, 0), rim);
  }

  @override
  bool shouldRepaint(CoffeeGlassPainter oldDelegate) => false;
}
