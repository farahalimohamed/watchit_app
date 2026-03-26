import 'package:flutter/material.dart';

class AppColors {
  // Primary - Neon Cyan
  static const Color primary = Color(0xFF00E5FF);
  static const Color primaryLight = Color(0xFF72FFFF);
  static const Color primaryDark = Color(0xFF00B2CC);

  // Secondary - Neon Pink
  static const Color secondary = Color(0xFFFF006E);
  static const Color secondaryLight = Color(0xFFFF4D9E);
  static const Color secondaryDark = Color(0xFFCC0058);

  // Background - Deep Dark
  static const Color background = Color(0xFF0A0A0F);
  static const Color surface = Color(0xFF111115);
  static const Color card = Color(0xFF1A1A20);

  // Text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF8E8E93);
  static const Color textHint = Color(0xFF5E5E63);

  // Border
  static const Color border = Color(0xFF2C2C33);

  // Status
  static const Color success = Color(0xFF00E676);
  static const Color error = Color(0xFFFF1744);
  static const Color warning = Color(0xFFFFC400);

  // White
  static const Color white = Color(0xFFFFFFFF);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF1A1A20), Color(0xFF111115)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}