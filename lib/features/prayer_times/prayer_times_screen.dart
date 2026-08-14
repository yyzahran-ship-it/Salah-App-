import 'dart:async';
import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hijri/hijri_calendar.dart';
import '../settings/settings_screen.dart';
import 'prayer_log_provider.dart';
import 'prayer_times_provider.dart';

class PrayerTimesScreen extends ConsumerStatefulWidget {
  const PrayerTimesScreen({super.key});

  @override
  ConsumerState<PrayerTimesScreen> createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends ConsumerState<PrayerTimesScreen> {
  late Timer _ticker;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) => setState(() {}));
  }

  @override
  void dispose() {
    _ticker.cancel();
    super.dispose();
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  String _cityName(PrayerTimesState state) {
    if (state.latitude == null) return 'مكة';
    const meccaLat = 21.3891;
    const meccaLon = 39.8579;
    if ((state.latitude! - meccaLat).abs() < 0.5 &&
        (state.longitude! - meccaLon).abs() < 0.5) return 'مكة';
    return 'موقعك';
  }

  PrayerTimes? _timesForDate(PrayerTimesState state) {
    if (_isSameDay(_selectedDate, DateTime.now()) && state.times != null) {
      return state.times;
    }
    if (state.latitude != null && state.longitude != null) {
      final coords = Coordinates(state.latitude!, state.longitude!);
      final params = CalculationMethod.muslim_world_league.getParameters();
      params.madhab = Madhab.shafi;
      return PrayerTimes(coords, DateComponents.from(_selectedDate), params);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(prayerTimesProvider);
    final isToday = _isSameDay(_selectedDate, DateTime.now());
    final times = _timesForDate(state);
    final nextPrayer = isToday ? state.nextPrayer : Prayer.none;

    // Prayer log for the selected day (for checkmarks).
    final selectedDateDay = localDateDay(_selectedDate);
    final dayLog =
        ref.watch(prayerLogProvider(selectedDateDay)).valueOrNull ?? {};

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Top bar ──────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 12, 0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.black54),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SettingsScreen()),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        _cityName(state),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.location_on,
                          color: Color(0xFF4FC3F7), size: 20),
                    ],
                  ),
                ],
              ),
            ),

            // ── Day navigation ────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left, color: Colors.black45),
                    onPressed: () => setState(() {
                      _selectedDate =
                          _selectedDate.subtract(const Duration(days: 1));
                    }),
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right,
                        color: Colors.black45),
                    onPressed: () => setState(() {
                      _selectedDate =
                          _selectedDate.add(const Duration(days: 1));
                    }),
                  ),
                  const Spacer(),
                  const Icon(Icons.calendar_today,
                      color: Color(0xFF4FC3F7), size: 18),
                  const SizedBox(width: 6),
                  Text(
                    _dayNameAr(_selectedDate.weekday),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            // ── Hijri + Gregorian dates ───────────────────────────────
            Padding(
              padding: const EdgeInsets.only(right: 16, bottom: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _hijriDateAr(_selectedDate),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF4FC3F7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _gregorianDateAr(_selectedDate),
                    style: const TextStyle(fontSize: 13, color: Colors.black45),
                  ),
                ],
              ),
            ),

            // ── Weekly prayer tracker ─────────────────────────────────
            const _WeeklyTracker(),

            const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),

            // ── Prayer list ───────────────────────────────────────────
            if (state.isLoading)
              const Expanded(
                child: Center(
                    child:
                        CircularProgressIndicator(color: Color(0xFF4FC3F7))),
              )
            else if (times != null)
              Expanded(
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  itemCount: 6,
                  separatorBuilder: (_, __) => const Divider(
                      height: 1, color: Color(0xFFF0F0F0)),
                  itemBuilder: (context, i) {
                    final prayers = [
                      (Prayer.fajr, times.fajr),
                      (Prayer.sunrise, times.sunrise),
                      (Prayer.dhuhr, times.dhuhr),
                      (Prayer.asr, times.asr),
                      (Prayer.maghrib, times.maghrib),
                      (Prayer.isha, times.isha),
                    ];
                    final (prayer, time) = prayers[i];
                    final isNext = prayer == nextPrayer;
                    final isPassed = isToday &&
                        time.toLocal().isBefore(DateTime.now()) &&
                        !isNext;
                    final key = _prayerKey(prayer);
                    return _PrayerRow(
                      prayer: prayer,
                      time: time,
                      isNext: isNext,
                      isPassed: isPassed,
                      countdown: isNext ? state.timeUntilNext : null,
                      prayerKey: key,
                      isPerformed: key != null && (dayLog[key] ?? false),
                      onToggle: key == null
                          ? null
                          : () => ref
                              .read(prayerLogNotifierProvider.notifier)
                              .toggle(key, selectedDateDay),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Maps an adhan Prayer enum to its SharedPreferences key; null = not tracked.
String? _prayerKey(Prayer prayer) {
  switch (prayer) {
    case Prayer.fajr:
      return 'fajr';
    case Prayer.dhuhr:
      return 'dhuhr';
    case Prayer.asr:
      return 'asr';
    case Prayer.maghrib:
      return 'maghrib';
    case Prayer.isha:
      return 'isha';
    default:
      return null; // sunrise — informational only
  }
}

// ─── Weekly tracker ───────────────────────────────────────────────────────────

class _WeeklyTracker extends ConsumerWidget {
  const _WeeklyTracker();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final today = DateTime.now();
    final todayDay = localDateDay(today);
    final startDay = todayDay - 6;

    final weekData =
        ref.watch(prayerWeekLogProvider(startDay)).valueOrNull ?? [];
    final streak = ref.watch(prayerStreakProvider).valueOrNull ?? 0;

    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
      child: Row(
        children: [
          // ── Streak badge ────────────────────────────────────────
          Container(
            width: 52,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: streak > 0
                  ? const Color(0xFF1B6B3A).withValues(alpha: 0.08)
                  : const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: streak > 0
                    ? const Color(0xFF1B6B3A).withValues(alpha: 0.25)
                    : Colors.transparent,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$streak',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1,
                    color: streak > 0
                        ? const Color(0xFF1B6B3A)
                        : Colors.black26,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  streak == 1 ? 'يوم' : 'أيام',
                  style: TextStyle(
                    fontSize: 9,
                    color: streak > 0
                        ? const Color(0xFF1B6B3A)
                        : Colors.black26,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          // ── 7-day dot grid ──────────────────────────────────────
          Expanded(
            child: weekData.isEmpty
                ? const SizedBox(height: 60)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (var i = 0; i < 7; i++)
                        _DayColumn(
                          day: today.subtract(Duration(days: 6 - i)),
                          status: i < weekData.length ? weekData[i] : {},
                          isToday: i == 6,
                        ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _DayColumn extends StatelessWidget {
  const _DayColumn({
    required this.day,
    required this.status,
    required this.isToday,
  });

  final DateTime day;
  final Map<String, bool> status;
  final bool isToday;

  static const _prayers = ['fajr', 'dhuhr', 'asr', 'maghrib', 'isha'];

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF1B6B3A);
    final label = _shortDayAr(day.weekday);

    return Container(
      width: 30,
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: isToday
          ? BoxDecoration(
              color: green.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(8),
            )
          : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
              color: isToday ? green : Colors.black38,
            ),
          ),
          const SizedBox(height: 5),
          for (final p in _prayers)
            Container(
              width: 6,
              height: 6,
              margin: const EdgeInsets.only(bottom: 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: status[p] == true ? green : const Color(0xFFE0E0E0),
              ),
            ),
        ],
      ),
    );
  }
}

// ─── Helpers ──────────────────────────────────────────────────────────────────

String _shortDayAr(int weekday) {
  // Single Arabic letter abbreviations: Mon=ن, Tue=ث, Wed=ع, Thu=خ, Fri=ج, Sat=س, Sun=ح
  const shorts = ['', 'ن', 'ث', 'ع', 'خ', 'ج', 'س', 'ح'];
  return shorts[weekday];
}

String _dayNameAr(int weekday) {
  const days = [
    '',
    'الاثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
    'السبت',
    'الأحد',
  ];
  return days[weekday];
}

String _hijriDateAr(DateTime date) {
  final h = HijriCalendar.fromDate(date);
  const months = [
    '',
    'محرم',
    'صفر',
    'ربيع الأول',
    'ربيع الثاني',
    'جمادى الأولى',
    'جمادى الآخرة',
    'رجب',
    'شعبان',
    'رمضان',
    'شوال',
    'ذو القعدة',
    'ذو الحجة',
  ];
  return '${h.hDay} ${months[h.hMonth]} ${h.hYear}';
}

String _gregorianDateAr(DateTime date) {
  const months = [
    '',
    'يناير',
    'فبراير',
    'مارس',
    'أبريل',
    'مايو',
    'يونيو',
    'يوليو',
    'أغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر',
  ];
  return '${date.day} ${months[date.month]} ${date.year}';
}

String _formatTimeAr(DateTime dt) {
  final local = dt.toLocal();
  final hour = local.hour;
  final minute = local.minute.toString().padLeft(2, '0');
  final period = hour >= 12 ? 'م' : 'ص';
  final displayHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
  return '$displayHour:$minute $period';
}

// ─── Prayer row ───────────────────────────────────────────────────────────────

class _PrayerRow extends StatefulWidget {
  const _PrayerRow({
    required this.prayer,
    required this.time,
    required this.isNext,
    required this.isPassed,
    required this.isPerformed,
    this.countdown,
    this.prayerKey,
    this.onToggle,
  });

  final Prayer prayer;
  final DateTime time;
  final bool isNext;
  final bool isPassed;
  final bool isPerformed;
  final Duration? countdown;
  final String? prayerKey; // null = not an obligatory prayer (Sunrise)
  final VoidCallback? onToggle;

  @override
  State<_PrayerRow> createState() => _PrayerRowState();
}

class _PrayerRowState extends State<_PrayerRow> {
  // 0 = sound on  1 = vibrate  2 = silent
  int _alertMode = 0;

  IconData get _icon {
    switch (_alertMode) {
      case 1:
        return Icons.vibration;
      case 2:
        return Icons.volume_off;
      default:
        return Icons.volume_up;
    }
  }

  Color get _iconColor =>
      _alertMode == 2 ? Colors.grey.shade400 : const Color(0xFFFF9800);

  String _countdownStr(Duration d) {
    final h = d.inHours.toString().padLeft(2, '0');
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '- $h : $m : $s -';
  }

  @override
  Widget build(BuildContext context) {
    final isNext = widget.isNext;
    final isPassed = widget.isPassed;
    const green = Color(0xFF1B6B3A);

    final timeColor = isNext
        ? Colors.black87
        : isPassed
            ? Colors.black26
            : Colors.black54;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          // ── Checkmark circle (visual right in RTL) ───────────────
          if (widget.prayerKey != null)
            GestureDetector(
              onTap: widget.onToggle,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.isPerformed ? green : Colors.transparent,
                  border: Border.all(
                    color: widget.isPerformed
                        ? green
                        : isPassed
                            ? Colors.black12
                            : Colors.black26,
                    width: 1.5,
                  ),
                ),
                child: widget.isPerformed
                    ? const Icon(Icons.check, color: Colors.white, size: 16)
                    : null,
              ),
            )
          else
            const SizedBox(width: 28), // sunrise — alignment placeholder

          const SizedBox(width: 10),

          // ── Time ─────────────────────────────────────────────────
          Text(
            _formatTimeAr(widget.time),
            style: TextStyle(
              fontSize: isNext ? 17 : 15,
              fontWeight: isNext ? FontWeight.bold : FontWeight.normal,
              color: timeColor,
            ),
          ),
          const SizedBox(width: 10),

          // ── Prayer name ──────────────────────────────────────────
          Text(
            prayerNameAr(widget.prayer),
            style: TextStyle(
              fontSize: 15,
              fontWeight: isNext ? FontWeight.w600 : FontWeight.normal,
              color: timeColor,
            ),
          ),
          const SizedBox(width: 8),

          // ── Countdown or spacer ──────────────────────────────────
          if (isNext && widget.countdown != null)
            Expanded(
              child: Text(
                _countdownStr(widget.countdown!),
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFFFF9800),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            )
          else
            const Spacer(),

          // ── Alert icon (visual left in RTL) ──────────────────────
          GestureDetector(
            onTap: () => setState(() => _alertMode = (_alertMode + 1) % 3),
            child: Icon(_icon, color: _iconColor, size: 22),
          ),
        ],
      ),
    );
  }
}
