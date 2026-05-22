import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

// ── King Fahad Mushaf Complex colour palette ──────────────────────────────────
// Inspired by the printed Madinah Mushaf: warm cream pages, deep forest-green
// headings, and gold ornamental accents.
const _seedColor = Color(0xFF1B6B3A); // Forest green (Islam-inspired)
const _mushafahPageColor = Color(0xFFFDF6E3); // Warm cream — Mushaf page tone
const _mushafahPageColorDark = Color(0xFF1A1A2E); // Deep navy for night reading
const _mushafahGold = Color(0xFFB8860B); // Dark goldenrod — ornamental accents

// ── Light theme (Mushaf day mode) ────────────────────────────────────────────
final appThemeLight = ThemeData(
  useMaterial3: true,
  colorSchemeSeed: _seedColor,
  brightness: Brightness.light,
  // Warm cream background mimics the printed Mushaf page
  scaffoldBackgroundColor: _mushafahPageColor,
  textTheme: _mushafahTextTheme,
  dividerColor: const Color(0xFFD4AF37).withValues(alpha: 0.4), // gold dividers
);

// ── Dark theme (night reading) ────────────────────────────────────────────────
final appThemeDark = ThemeData(
  useMaterial3: true,
  colorSchemeSeed: _seedColor,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: _mushafahPageColorDark,
  textTheme: _mushafahTextTheme,
);

// ── Inverted theme (true black for AMOLED screens) ───────────────────────────
final appThemeInverted = ThemeData(
  useMaterial3: true,
  colorSchemeSeed: _seedColor,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  textTheme: _mushafahTextTheme.apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
);

// ── Base text theme ───────────────────────────────────────────────────────────
// Arabic Quran text uses UthmanicHafs (KFGQPC); translation uses system default.
// Line height is set generously to accommodate stacked tashkeel (diacritics).
const _mushafahTextTheme = TextTheme(
  // Arabic Mushaf body text
  bodyLarge: TextStyle(
    fontFamily: kArabicFont,
    fontSize: kDefaultArabicFontSize,
    height: kMushafahLineHeight,
  ),
  bodyMedium: TextStyle(fontSize: 16, height: 1.6),
  bodySmall: TextStyle(fontSize: 14, height: 1.5),
  // Display styles for surah names and headers
  displayLarge: TextStyle(
    fontFamily: kArabicFont,
    fontSize: 36,
    height: 2.0,
    color: _mushafahGold,
  ),
  displayMedium: TextStyle(
    fontFamily: kArabicFont,
    fontSize: 28,
    height: 2.0,
  ),
  titleLarge: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
  titleMedium: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
);
