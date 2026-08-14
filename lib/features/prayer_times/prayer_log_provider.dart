import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ─── Constants ────────────────────────────────────────────────────────────────

// The five obligatory daily prayers tracked for completion.
const obligatoryPrayers = ['fajr', 'dhuhr', 'asr', 'maghrib', 'isha'];

// ─── Helpers ──────────────────────────────────────────────────────────────────

/// Converts a DateTime to a stable integer day-index (days since Unix epoch,
/// using local midnight so the key never shifts mid-day across timezones).
int localDateDay(DateTime dt) {
  return DateTime(dt.year, dt.month, dt.day).millisecondsSinceEpoch ~/
      86400000;
}

String _prefKey(int dateDay) => 'prayer_log_$dateDay';

Map<String, bool> _parseDay(SharedPreferences prefs, int dateDay) {
  final raw = prefs.getString(_prefKey(dateDay));
  if (raw == null) return {};
  try {
    final decoded = json.decode(raw) as Map<String, dynamic>;
    return decoded.map((k, v) => MapEntry(k, v as bool));
  } catch (_) {
    return {};
  }
}

// ─── Providers ────────────────────────────────────────────────────────────────

/// Per-day prayer completion map: prayer name → performed.
final prayerLogProvider =
    FutureProvider.family<Map<String, bool>, int>((ref, dateDay) async {
  final prefs = await SharedPreferences.getInstance();
  return _parseDay(prefs, dateDay);
});

/// Seven consecutive days of prayer logs; index 0 = startDay.
final prayerWeekLogProvider =
    FutureProvider.family<List<Map<String, bool>>, int>((ref, startDay) async {
  final prefs = await SharedPreferences.getInstance();
  return [for (var i = 0; i < 7; i++) _parseDay(prefs, startDay + i)];
});

/// Consecutive completed days ending today (all 5 prayers done each day).
final prayerStreakProvider = FutureProvider<int>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  final todayDay = localDateDay(DateTime.now());
  var streak = 0;
  for (var d = todayDay; d >= todayDay - 365; d--) {
    final status = _parseDay(prefs, d);
    final allDone = obligatoryPrayers.every((p) => status[p] == true);
    if (allDone) {
      streak++;
    } else if (d < todayDay) {
      break;
    }
  }
  return streak;
});

// ─── Toggle notifier ──────────────────────────────────────────────────────────

class PrayerLogNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> toggle(String prayer, int dateDay) async {
    final prefs = await SharedPreferences.getInstance();
    final current = _parseDay(prefs, dateDay);
    current[prayer] = !(current[prayer] ?? false);
    await prefs.setString(_prefKey(dateDay), json.encode(current));
    ref.invalidate(prayerLogProvider(dateDay));
    ref.invalidate(prayerWeekLogProvider); // all family instances
    ref.invalidate(prayerStreakProvider);
  }
}

final prayerLogNotifierProvider =
    AsyncNotifierProvider<PrayerLogNotifier, void>(PrayerLogNotifier.new);
