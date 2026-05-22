import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_constants.dart';
import '../../../domain/entities/ayah.dart';
import '../../audio/audio_provider.dart';

/// Renders one ayah in King Fahad Mushaf Complex style:
///  • UthmanicHafs font (KFGQPC official) for Arabic text
///  • Justified RTL text alignment — mirrors the printed Mushaf
///  • Generous line height (2.2 em) to accommodate stacked tashkeel
///  • Ornamental ayah-end marker with Arabic-numeral verse number
///  • Subtle warm-cream card background matching the Madinah Mushaf palette
///
/// Subscribes to [audioProvider] via select() so only this tile rebuilds
/// when its own highlight state changes — not the entire list.
class AyahTile extends ConsumerWidget {
  const AyahTile({
    super.key,
    required this.ayah,
    this.arabicFontSize = kDefaultArabicFontSize,
    this.translationText,
    this.onTap,
  });

  final Ayah ayah;
  final double arabicFontSize;
  final String? translationText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHighlighted = ref.watch(
      audioProvider.select((audio) =>
          audio.surahNumber == ayah.surahNumber &&
          audio.currentAyahNumber == ayah.ayahNumber),
    );
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Mushaf-style background: warm cream in light mode, deep navy in dark
    final cardColor = isHighlighted
        ? colors.primaryContainer.withValues(alpha: 0.45)
        : isDark
            ? colors.surface
            : const Color(0xFFFDF6E3); // warm cream page

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        padding: const EdgeInsets.fromLTRB(12, 14, 12, 10),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isHighlighted
                ? colors.primary
                : const Color(0xFFD4AF37).withValues(alpha: 0.25), // gold border
            width: isHighlighted ? 1.5 : 0.8,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Arabic text block (RTL, justified) ──────────────────────────
            // The UthmanicHafs font renders Uthmanic script with full Unicode
            // diacritic support as specified by the King Fahad Quran Complex.
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: ayah.textUthmani,
                      style: TextStyle(
                        fontFamily: kArabicFont,
                        fontSize: arabicFontSize,
                        height: kMushafahLineHeight,
                        color: colors.onSurface,
                        // Slight letter spacing for Mushaf-style readability
                        letterSpacing: 0.5,
                      ),
                    ),
                    // Ornamental ayah-end marker (Unicode: ۝ U+06DD)
                    // followed by the verse number in Arabic-Indic numerals
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: _AyahEndMarker(
                        number: ayah.ayahNumber,
                        colors: colors,
                        fontSize: arabicFontSize,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            // ── Translation (optional) ───────────────────────────────────────
            if (translationText != null) ...[
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: const Color(0xFFD4AF37).withValues(alpha: 0.3),
                      width: 0.5,
                    ),
                  ),
                ),
                child: Text(
                  translationText!,
                  style: TextStyle(
                    fontSize: kDefaultTranslationFontSize,
                    height: 1.6,
                    color: colors.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ── Ornamental ayah-end marker ────────────────────────────────────────────────
// Renders the traditional ۝ end-of-verse circle with the ayah number inside,
// matching the King Fahad Mushaf Complex printed style.
class _AyahEndMarker extends StatelessWidget {
  const _AyahEndMarker({
    required this.number,
    required this.colors,
    required this.fontSize,
  });

  final int number;
  final ColorScheme colors;
  final double fontSize;

  // Convert Western digits to Arabic-Indic (Eastern Arabic) numerals
  static String _toArabicNumerals(int n) {
    const eastern = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    return n.toString().split('').map((d) => eastern[int.parse(d)]).join();
  }

  @override
  Widget build(BuildContext context) {
    final markerSize = (fontSize * 1.1).clamp(24.0, 44.0);
    return Container(
      width: markerSize,
      height: markerSize,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFFB8860B), // dark gold
          width: 1.2,
        ),
        color: const Color(0xFFB8860B).withValues(alpha: 0.12),
      ),
      alignment: Alignment.center,
      child: Text(
        _toArabicNumerals(number),
        style: TextStyle(
          fontFamily: kArabicFont,
          fontSize: markerSize * 0.38,
          color: const Color(0xFFB8860B),
          fontWeight: FontWeight.w600,
          height: 1.0,
        ),
      ),
    );
  }
}
