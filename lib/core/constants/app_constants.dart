// App-wide constants. Keep trivial; avoid premature abstraction.

// ayah = verse, surah = chapter, juz = 1/30 of the Quran, hizb = 1/60.
const int kTotalSurahs = 114;
const int kTotalAyahs = 6236;
const int kTotalJuzs = 30;
const int kTotalPages = 604; // standard Madinah Mushaf page count

// ── King Fahad Quran Printing Complex (KFGQPC) font ──────────────────────────
// Primary: KFGQPC Uthmanic Script Hafs v8 — official Unicode Uthmanic font
// from the King Fahad Quran Printing Complex (Madinah).
// Designed for verse-level (smart/mobile) display with full diacritic support.
// Fallback: AmiriQuran (open-source, SIL OFL) for graceful degradation.
const String kArabicFont = 'UthmanicHafs';
const String kArabicFontFallback = 'AmiriQuran';

// ── Mushaf layout constants (King Fahad / Madinah standard) ──────────────────
// The standard Madinah Mushaf uses 15 lines per page (excluding Bismillah line).
// Line height is generous to accommodate stacked diacritics (tashkeel).
const int kMushafahLinesPerPage = 15;
const double kMushafahLineHeight = 2.2; // em — accommodates stacked tashkeel
const double kMushafahAyahNumberSize = 22.0; // ornamental ayah number glyph size

// ── Arabic text direction ─────────────────────────────────────────────────────
// All Quran text is right-to-left; enforce at every text widget.
// Justified alignment mirrors the printed Mushaf layout.

// Font scale limits (accessibility requirement).
const double kMinFontScale = 0.5;
const double kMaxFontScale = 2.0;

// ── Default font sizes (King Fahad Mushaf-compatible) ────────────────────────
// Base size chosen so that Arabic text with UthmanicHafs renders at a
// comfortable reading size on a standard phone screen (~5.5").
const double kDefaultArabicFontSize = 28.0;
const double kDefaultTranslationFontSize = 14.0;
