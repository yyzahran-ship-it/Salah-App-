import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../domain/entities/surah.dart';

/// Surah header styled after the King Fahad Mushaf Complex printed edition:
///  • Gold ornamental border frame
///  • Arabic surah name in UthmanicHafs (KFGQPC) font
///  • Metadata chips (Makki/Madani, verse count, surah number)
///  • Bismillah in full Uthmanic script (omitted for At-Tawbah, surah 9)
class SurahHeader extends StatelessWidget {
  const SurahHeader({super.key, required this.surah});

  final Surah surah;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Mushaf-style background
    final bgColor = isDark ? const Color(0xFF1A1A2E) : const Color(0xFFFDF6E3);
    const goldColor = Color(0xFFB8860B);
    const goldLight = Color(0xFFD4AF37);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(8, 12, 8, 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: goldLight, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: goldColor.withValues(alpha: 0.15),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // ── Ornamental top border line ────────────────────────────────────
          Container(
            height: 4,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
              gradient: LinearGradient(
                colors: [
                  goldColor.withValues(alpha: 0.0),
                  goldColor,
                  goldLight,
                  goldColor,
                  goldColor.withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Column(
              children: [
                // ── Arabic surah name (UthmanicHafs) ─────────────────────────
                Text(
                  surah.nameArabic,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: kArabicFont,
                    fontSize: 34,
                    height: 1.8,
                    color: isDark ? goldLight : goldColor,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 4),
                // ── English name + transliteration ────────────────────────────
                Text(
                  '${surah.nameSimple}  ·  ${surah.nameEnglish}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: colors.onSurface.withValues(alpha: 0.75),
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 10),
                // ── Metadata chips ────────────────────────────────────────────
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  children: [
                    _MushafahChip(
                      label: surah.revelationPlace == 'makkah' ? 'Makkiyyah' : 'Madaniyyah',
                      goldColor: goldColor,
                      isDark: isDark,
                    ),
                    _MushafahChip(
                      label: '${surah.versesCount} Ayat',
                      goldColor: goldColor,
                      isDark: isDark,
                    ),
                    _MushafahChip(
                      label: 'Surah ${surah.id}',
                      goldColor: goldColor,
                      isDark: isDark,
                    ),
                  ],
                ),
                // ── Bismillah ─────────────────────────────────────────────────
                // Shown for all surahs except At-Tawbah (surah 9).
                // Rendered in UthmanicHafs at a larger size, centred, matching
                // the King Fahad Mushaf printed layout.
                if (surah.bismillahPre) ...[
                  const SizedBox(height: 14),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: goldColor.withValues(alpha: 0.35),
                          width: 0.8,
                        ),
                      ),
                    ),
                    child: Text(
                      'بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ',
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: kArabicFont,
                        fontSize: 26,
                        height: kMushafahLineHeight,
                        color: isDark ? Colors.white : const Color(0xFF1B1B1B),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          // ── Ornamental bottom border line ─────────────────────────────────
          Container(
            height: 4,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(4)),
              gradient: LinearGradient(
                colors: [
                  goldColor.withValues(alpha: 0.0),
                  goldColor,
                  goldLight,
                  goldColor,
                  goldColor.withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Mushaf-style metadata chip ────────────────────────────────────────────────
class _MushafahChip extends StatelessWidget {
  const _MushafahChip({
    required this.label,
    required this.goldColor,
    required this.isDark,
  });

  final String label;
  final Color goldColor;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: goldColor.withValues(alpha: isDark ? 0.18 : 0.10),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: goldColor.withValues(alpha: 0.4),
          width: 0.6,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: isDark ? const Color(0xFFD4AF37) : goldColor,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}
