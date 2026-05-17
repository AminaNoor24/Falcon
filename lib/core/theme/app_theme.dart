import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FalconColors {
  FalconColors._();
  static const background     = Color(0xFFFFF8F6);
  static const surface        = Color(0xFFFFF8F6);
  static const surfaceLowest  = Color(0xFFFFFFFF);
  static const surfaceLow     = Color(0xFFFFF1EC);
  static const surfaceMid     = Color(0xFFFAEBE5);
  static const surfaceHigh    = Color(0xFFF4E5E0);
  static const surfaceHighest = Color(0xFFEEDFDA);
  static const onSurface      = Color(0xFF211A17);
  static const onSurfaceVar   = Color(0xFF434842);
  static const outline        = Color(0xFF747872);
  static const outlineVar     = Color(0xFFC4C8C0);
  static const primary        = Color(0xFF536253);
  static const primaryContainer = Color(0xFFACBDAA);
  static const onPrimary      = Color(0xFFFFFFFF);
  static const onPrimaryContainer = Color(0xFF3E4D3E);
  static const primaryFixed   = Color(0xFFD6E7D3);
  static const primaryFixedDim = Color(0xFFBACBB8);
  static const onPrimaryFixed = Color(0xFF111F12);
  static const secondary      = Color(0xFF4F5E80);
  static const tertiary       = Color(0xFF5E5E5E);
  static const error          = Color(0xFFBA1A1A);
  static const sage           = Color(0xFFACBDAA);
  static const navyDark       = Color(0xFF211A17);
}

class FalconTheme {
  FalconTheme._();

  static TextTheme _textTheme() => TextTheme(
    displayLarge: GoogleFonts.manrope(fontSize: 48, fontWeight: FontWeight.w700, letterSpacing: -0.96, color: FalconColors.onSurface),
    headlineLarge: GoogleFonts.manrope(fontSize: 32, fontWeight: FontWeight.w600, letterSpacing: -0.32, color: FalconColors.onSurface),
    headlineMedium: GoogleFonts.manrope(fontSize: 24, fontWeight: FontWeight.w600, color: FalconColors.onSurface),
    titleLarge: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w700, color: FalconColors.onSurface),
    titleMedium: GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.w600, color: FalconColors.onSurface),
    bodyLarge: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w400, height: 1.6, color: FalconColors.onSurface),
    bodyMedium: GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.w400, height: 1.6, color: FalconColors.onSurface),
    bodySmall: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w400, color: FalconColors.onSurfaceVar),
    labelLarge: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.28, color: FalconColors.onSurface),
    labelSmall: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.6, color: FalconColors.tertiary),
  );

  static ThemeData light() => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: FalconColors.background,
    colorScheme: const ColorScheme.light(
      primary: FalconColors.primary,
      onPrimary: FalconColors.onPrimary,
      primaryContainer: FalconColors.primaryContainer,
      onPrimaryContainer: FalconColors.onPrimaryContainer,
      secondary: FalconColors.secondary,
      surface: FalconColors.surface,
      onSurface: FalconColors.onSurface,
      error: FalconColors.error,
    ),
    textTheme: _textTheme(),
    appBarTheme: AppBarTheme(
      backgroundColor: FalconColors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.crimsonPro(
        fontSize: 20, fontWeight: FontWeight.w600,
        letterSpacing: 3, color: FalconColors.onSurface,
      ),
      iconTheme: const IconThemeData(color: FalconColors.onSurface, size: 22),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: FalconColors.surfaceLowest,
      selectedItemColor: FalconColors.primary,
      unselectedItemColor: FalconColors.outline,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: false,
      border: const UnderlineInputBorder(borderSide: BorderSide(color: FalconColors.outlineVar)),
      enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: FalconColors.outlineVar)),
      focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: FalconColors.primary, width: 1.5)),
      hintStyle: GoogleFonts.manrope(fontSize: 14, color: FalconColors.outline.withOpacity(0.6)),
      contentPadding: const EdgeInsets.symmetric(vertical: 14),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: FalconColors.sage,
        foregroundColor: FalconColors.navyDark,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 1.5),
        minimumSize: const Size(double.infinity, 56),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: FalconColors.onSurface,
        side: const BorderSide(color: FalconColors.outlineVar),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w600),
        minimumSize: const Size(double.infinity, 48),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: FalconColors.primaryFixed.withOpacity(0.3),
      labelStyle: GoogleFonts.manrope(fontSize: 13, fontWeight: FontWeight.w600, color: FalconColors.primary),
      side: BorderSide.none,
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    ),
    dividerTheme: const DividerThemeData(color: FalconColors.surfaceHighest, thickness: 1, space: 0),
  );
}
