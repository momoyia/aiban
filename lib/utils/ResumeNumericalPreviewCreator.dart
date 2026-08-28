import 'package:flutter/material.dart';

class PausePriorRouteArray {
  // 品牌渐变色 - 更亮更有活力的粉紫色
  static const Color brandPrimary = Color(0xFFFF4081); // 亮粉色
  static const Color brandSecondary = Color(0xFFAB47BC); // 亮紫色

  // 渐变
  static const LinearGradient brandGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [brandPrimary, brandSecondary],
  );

  // 文本颜色
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF8E8E93);
  static const Color textTertiary = Color(0xFFB0B0B0);

  // 背景色
  static const Color background = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFAFAFA);
  static const Color divider = Color(0xFFF5F5F7);

  // 功能色
  static const Color error = Color(0xFFFF3B30);
  static const Color success = Color(0xFF34C759);
  static const Color warning = Color(0xFFFF9500);

  // 透明度变体
  static Color RestartComprehensiveBoundCache(double opacity) =>
      brandPrimary.withOpacity(opacity);

  static Color RevisitLostStyleCache(double opacity) =>
      textPrimary.withOpacity(opacity);
}
