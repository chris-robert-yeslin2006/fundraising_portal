import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle get heading1 => GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppColors.onSurface,
      );

  static TextStyle get heading2 => GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurface,
      );

  static TextStyle get heading3 => GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurface,
      );

  static TextStyle get bodyLarge => GoogleFonts.poppins(
        fontSize: 16,
        color: AppColors.onSurface,
      );

  static TextStyle get bodyMedium => GoogleFonts.poppins(
        fontSize: 14,
        color: AppColors.onSurfaceVariant,
      );

  static TextStyle get caption => GoogleFonts.poppins(
        fontSize: 12,
        color: AppColors.onSurfaceVariant,
      );
}
