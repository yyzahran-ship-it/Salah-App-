import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'prayer_times_provider.dart';
import '../settings/settings_screen.dart';

// ─── Main Screen ──────────────────────────────────────────────────────────────

class ClockPrayerScreen extends ConsumerStatefulWidget {
  const ClockPrayerScreen({super.key});

  @override
  ConsumerState<ClockPrayerScreen> createState() => _ClockPrayerScreenState();
}

class _ClockPrayerScreenState extends ConsumerState<ClockPrayerScreen> {
  late Timer _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setState(() {}),
    );
  }

  @override
  void dispose() {
    _ticker.cancel();
    super.dispose();
  }

  String _cityName(PrayerTimesState state) {
    if (state.latitude == null) return 'مكة';
    const meccaLat = 21.3891;
    const meccaLon = 39.8579;
    if ((state.latitude! - meccaLat).abs() < 0.5 &&
        (state.longitude! - meccaLon).abs() < 0.5) {
      return 'مكة';
    }
    return 'موقعك';
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(prayerTimesProvider);
    final now = DateTime.now();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 8, 0),
              child: Row(
                children: [
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.black54),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SettingsScreen(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // City name with location pin
            Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _cityName(state),
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.location_on,
                    color: Color(0xFF4FC3F7),
                    size: 28,
                  ),
                ],
              ),
            ),

            // Analog clock — fills available space
            Expanded(
              child: Center(
                child: state.isLoading
                    ? const CircularProgressIndicator(color: Color(0xFF4FC3F7))
                    : Padding(
                        padding: const EdgeInsets.all(20),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: CustomPaint(
                            painter: _ClockPainter(
                              now: now,
                              nextPrayerTime: state.nextPrayerTime,
                            ),
                          ),
                        ),
                      ),
              ),
            ),

            // Prayer info
            if (state.times != null) ...[
              Text(
                prayerNameAr(state.nextPrayer),
                style: const TextStyle(
                  fontSize: 28,
                  color: Color(0xFF4FC3F7),
                  fontWeight: FontWeight.w500,
                ),
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 4),
              Text(
                _formatTimeAr(state.nextPrayerTime!),
                style: const TextStyle(fontSize: 18, color: Colors.black45),
              ),
              const SizedBox(height: 14),
              _CountdownRow(remaining: state.timeUntilNext),
              const SizedBox(height: 24),
            ] else ...[
              const SizedBox(height: 80),
            ],
          ],
        ),
      ),
    );
  }
}

// ─── Countdown display ────────────────────────────────────────────────────────

class _CountdownRow extends StatelessWidget {
  const _CountdownRow({required this.remaining});

  final Duration remaining;

  @override
  Widget build(BuildContext context) {
    final h = remaining.inHours.toString().padLeft(2, '0');
    final m = remaining.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = remaining.inSeconds.remainder(60).toString().padLeft(2, '0');

    const numStyle = TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w300,
      color: Colors.black87,
    );
    const sepStyle = TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w300,
      color: Colors.black38,
    );
    const dashStyle = TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w300,
      color: Colors.black38,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('- ', style: dashStyle),
        Text(h, style: numStyle),
        const Text('  :  ', style: sepStyle),
        Text(m, style: numStyle),
        const Text('  :  ', style: sepStyle),
        Text(s, style: numStyle),
        const Text(' -', style: dashStyle),
      ],
    );
  }
}

// ─── Analog Clock CustomPainter ───────────────────────────────────────────────

class _ClockPainter extends CustomPainter {
  const _ClockPainter({required this.now, this.nextPrayerTime});

  final DateTime now;
  final DateTime? nextPrayerTime;

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    final r = size.width / 2;

    _drawGlow(canvas, c, r);
    _drawFace(canvas, c, r);
    _drawTicks(canvas, c, r);
    _drawNumbers(canvas, c, r);
    if (nextPrayerTime != null) _drawPrayerArc(canvas, c, r);
    _drawHands(canvas, c, r);
    _drawCenterDot(canvas, c);
  }

  // Soft radial glow around the clock
  void _drawGlow(Canvas canvas, Offset c, double r) {
    canvas.drawCircle(
      c,
      r,
      Paint()
        ..shader = RadialGradient(
          colors: [
            const Color(0xFFE0E0E0).withValues(alpha: 0.45),
            Colors.white.withValues(alpha: 0.0),
          ],
          stops: const [0.60, 1.0],
        ).createShader(Rect.fromCircle(center: c, radius: r)),
    );
  }

  // White circle face
  void _drawFace(Canvas canvas, Offset c, double r) {
    canvas.drawCircle(c, r * 0.76, Paint()..color = Colors.white);
  }

  // Minute tick marks
  void _drawTicks(Canvas canvas, Offset c, double r) {
    for (int i = 0; i < 60; i++) {
      final angle = (i * 6 - 90) * pi / 180;
      final isHour = i % 5 == 0;
      final inner = isHour ? r * 0.69 : r * 0.72;
      final outer = r * 0.76;
      canvas.drawLine(
        Offset(c.dx + inner * cos(angle), c.dy + inner * sin(angle)),
        Offset(c.dx + outer * cos(angle), c.dy + outer * sin(angle)),
        Paint()
          ..color = Colors.grey.shade300
          ..strokeWidth = isHour ? 1.5 : 0.8
          ..strokeCap = StrokeCap.round,
      );
    }
  }

  // Hour numerals 1–12
  void _drawNumbers(Canvas canvas, Offset c, double r) {
    for (int i = 1; i <= 12; i++) {
      final angle = (i * 30 - 90) * pi / 180;
      final x = c.dx + r * 0.57 * cos(angle);
      final y = c.dy + r * 0.57 * sin(angle);
      final tp = TextPainter(
        text: TextSpan(
          text: '$i',
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: r * 0.11,
            fontWeight: FontWeight.w400,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(x - tp.width / 2, y - tp.height / 2));
    }
  }

  // Blue arc centred on the next prayer time's clock position
  void _drawPrayerArc(Canvas canvas, Offset c, double r) {
    final local = nextPrayerTime!.toLocal();
    final hour12 = local.hour % 12;
    final totalMinutes = hour12 * 60.0 + local.minute + local.second / 60.0;
    // Map 720 minutes → 2π radians, offset –π/2 so 12 o'clock = top
    final centerAngle = (totalMinutes / 720.0) * 2 * pi - pi / 2;

    // Main bright arc (~50°)
    canvas.drawArc(
      Rect.fromCircle(center: c, radius: r * 0.86),
      centerAngle - 0.44,
      0.88,
      false,
      Paint()
        ..color = const Color(0xFF4FC3F7)
        ..style = PaintingStyle.stroke
        ..strokeWidth = r * 0.048
        ..strokeCap = StrokeCap.round,
    );

    // Faded tail extension (~25° before the bright arc)
    canvas.drawArc(
      Rect.fromCircle(center: c, radius: r * 0.86),
      centerAngle - 0.88,
      0.44,
      false,
      Paint()
        ..color = const Color(0xFF4FC3F7).withValues(alpha: 0.22)
        ..style = PaintingStyle.stroke
        ..strokeWidth = r * 0.028
        ..strokeCap = StrokeCap.round,
    );
  }

  void _drawHands(Canvas canvas, Offset c, double r) {
    // Hour hand — dark grey, short
    final hourAng =
        ((now.hour % 12 + now.minute / 60.0 + now.second / 3600.0) * 30 -
                90) *
            pi / 180;
    _hand(canvas, c, r * 0.43, hourAng, const Color(0xFF9E9E9E), r * 0.054);

    // Minute hand — near-black, longer
    final minAng = ((now.minute + now.second / 60.0) * 6 - 90) * pi / 180;
    _hand(canvas, c, r * 0.60, minAng, const Color(0xFF1A1A1A), r * 0.037);

    // Second hand — blue, thin, with short tail
    final secAng = (now.second * 6 - 90) * pi / 180;
    _hand(canvas, c, r * 0.64, secAng, const Color(0xFF4FC3F7), r * 0.016);
    _hand(canvas, c, -r * 0.14, secAng, const Color(0xFF4FC3F7), r * 0.016);
  }

  void _hand(Canvas canvas, Offset c, double len, double ang, Color col, double w) {
    canvas.drawLine(
      c,
      Offset(c.dx + len * cos(ang), c.dy + len * sin(ang)),
      Paint()
        ..color = col
        ..strokeWidth = w
        ..strokeCap = StrokeCap.round,
    );
  }

  void _drawCenterDot(Canvas canvas, Offset c) {
    canvas.drawCircle(c, 7, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(c, 3.5, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(_ClockPainter old) =>
      old.now.second != now.second || old.nextPrayerTime != nextPrayerTime;
}

// ─── Helpers ──────────────────────────────────────────────────────────────────

String _formatTimeAr(DateTime dt) {
  final local = dt.toLocal();
  final hour = local.hour;
  final minute = local.minute.toString().padLeft(2, '0');
  final period = hour >= 12 ? 'م' : 'ص';
  final displayHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
  return '$displayHour:$minute $period';
}
