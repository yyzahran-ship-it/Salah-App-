import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/theme_provider.dart';
import '../audio/audio_provider.dart';
import '../audio/audio_repository.dart';

// ─── Font size persistence ────────────────────────────────────────────────────

// Persistent font size provider (syncs to SharedPreferences).
class FontSizeNotifier extends Notifier<double> {
  static const _key = 'arabic_font_size';

  @override
  double build() {
    _load();
    return kDefaultArabicFontSize;
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getDouble(_key) ?? kDefaultArabicFontSize;
  }

  Future<void> set(double size) async {
    state = size.clamp(16.0, 48.0);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_key, state);
  }
}

final fontSizeProvider =
    NotifierProvider<FontSizeNotifier, double>(FontSizeNotifier.new);

// ─── Settings screen ──────────────────────────────────────────────────────────

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final fontSize = ref.watch(fontSizeProvider);
    final audio = ref.watch(audioProvider);
    final colors = Theme.of(context).colorScheme;
    const goldColor = Color(0xFFB8860B);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: const Color(0xFF1B6B3A),
        foregroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: Container(
            height: 2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  goldColor,
                  Color(0xFFD4AF37),
                  goldColor,
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          // ── Appearance ────────────────────────────────────────────────────
          _SectionHeader(title: 'Appearance', colors: colors),
          ListTile(
            leading: const Icon(Icons.palette_outlined),
            title: const Text('Theme'),
            trailing: DropdownButton<AppThemeMode>(
              value: theme,
              underline: const SizedBox.shrink(),
              items: const [
                DropdownMenuItem(
                    value: AppThemeMode.light, child: Text('Light (Mushaf)')),
                DropdownMenuItem(
                    value: AppThemeMode.dark, child: Text('Dark')),
                DropdownMenuItem(
                    value: AppThemeMode.inverted,
                    child: Text('Inverted (night)')),
              ],
              onChanged: (v) {
                if (v != null) ref.read(themeProvider.notifier).setTheme(v);
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.format_size),
            title: const Text('Arabic font size'),
            subtitle: Slider(
              value: fontSize,
              min: 16,
              max: 48,
              divisions: 16,
              label: fontSize.round().toString(),
              activeColor: goldColor,
              onChanged: (v) => ref.read(fontSizeProvider.notifier).set(v),
            ),
            trailing: Text(
              '${fontSize.round()}',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: colors.primary),
            ),
          ),
          // Font preview tile
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFFDF6E3),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: goldColor.withValues(alpha: 0.4),
                width: 0.8,
              ),
            ),
            child: Text(
              'بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: kArabicFont,
                fontSize: fontSize,
                height: kMushafahLineHeight,
                color: const Color(0xFF1B1B1B),
              ),
            ),
          ),
          // ── Audio ─────────────────────────────────────────────────────────
          _SectionHeader(title: 'Audio', colors: colors),
          ListTile(
            leading: const Icon(Icons.mic_none_outlined),
            title: const Text('Reciter'),
            trailing: DropdownButton<String>(
              value: audio.reciter,
              underline: const SizedBox.shrink(),
              items: AudioRepository.reciters.entries
                  .map((e) => DropdownMenuItem(
                        value: e.key,
                        child: Text(e.value,
                            style: const TextStyle(fontSize: 13)),
                      ))
                  .toList(),
              onChanged: (v) {
                if (v != null) {
                  ref.read(audioProvider.notifier).setReciter(v);
                }
              },
            ),
          ),
          // ── About ─────────────────────────────────────────────────────────
          _SectionHeader(title: 'About', colors: colors),
          ListTile(
            leading: const Icon(Icons.menu_book_outlined),
            title: const Text('Quran text'),
            subtitle: const Text('Tanzil Uthmanic script — tanzil.net'),
          ),
          ListTile(
            leading: const Icon(Icons.translate_outlined),
            title: const Text('Translation'),
            subtitle: const Text('Saheeh International'),
          ),
          ListTile(
            leading: const Icon(Icons.headphones_outlined),
            title: const Text('Audio'),
            subtitle: const Text(
                'Streamed from everyayah.com — requires internet'),
          ),
          ListTile(
            leading: const Icon(Icons.font_download_outlined),
            title: const Text('Font'),
            subtitle: const Text(
              'KFGQPC Uthmanic Script Hafs v8\n'
              'King Fahad Quran Printing Complex, Madinah\n'
              'Official Unicode Uthmanic standard font',
            ),
            isThreeLine: true,
          ),
          // ── Privacy ───────────────────────────────────────────────────────
          _SectionHeader(title: 'Privacy', colors: colors),
          ListTile(
            leading: Icon(Icons.shield_outlined, color: colors.primary),
            title: const Text('Zero tracking'),
            subtitle: const Text(
              'No analytics, no crash reporters, no third-party SDKs. '
              'Your reading habits stay on your device.',
            ),
            isThreeLine: true,
          ),
          ListTile(
            leading: Icon(Icons.wifi_off_outlined, color: colors.primary),
            title: const Text('Offline first'),
            subtitle: const Text(
              'The Quran text and translations are bundled in the app. '
              'Internet is only used for audio streaming.',
            ),
            isThreeLine: true,
          ),
          const SizedBox(height: 32),
          Center(
            child: Text(
              'Version 1.0.0',
              style: TextStyle(fontSize: 11, color: colors.outlineVariant),
            ),
          ),
          const SizedBox(height: 4),
          Center(
            child: Text(
              'No tracking · No ads · No subscription · Forever free',
              style: TextStyle(fontSize: 11, color: colors.outlineVariant),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.colors});

  final String title;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
          color: colors.primary,
        ),
      ),
    );
  }
}
