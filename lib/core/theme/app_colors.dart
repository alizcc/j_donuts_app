import 'package:flutter/painting.dart';

abstract final class AppColors {
  static const Color cyan = Color(0xFF56CFEA);
  static const Color pink = Color(0xFFEC4E93);
  static const Color orange = Color(0xFFFF7A1A);
  static const Color green = Color(0xFF7BC043);

  static const Color ink = Color(0xFF1E1E24);
  static const Color inkMuted = Color(0xFF6E6E78);
  static const Color inkSubtle = Color(0xFFA6A6B0);
  static const Color inkSoft = Color(0xFF87929C);
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Color(0x00FFFFFF);
  static const Color greySurface = Color(0xFFEAEFEF);
  static const Color greyTrack = Color(0xFFE3E8E8);
  static const Color disabled = Color(0xFFE4E4E4);

  static const Color blushTop = Color(0xFFFBE4EE);
  static const Color blushBottom = Color(0xFFF7F3F9);
  static const LinearGradient blushGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [blushTop, blushBottom],
  );

  static const Color error = Color(0xFFE5484D);
  static const Color success = Color(0xFF30A46C);

  static const Color skeletonBase = Color(0xFFE9ECEC);
  static const Color skeletonHighlight = Color(0xFFF7F8F8);

  static const Color tierSilver = Color(0xFFB8BCC2);
  static const Color tierGold = Color(0xFFF2CD5C);
  static const Color tierPlatinum = Color(0xFF8FD3EA);

  static const Color shadow = Color(0x14000000);
  static const Color scrim = Color(0x33000000);
}
