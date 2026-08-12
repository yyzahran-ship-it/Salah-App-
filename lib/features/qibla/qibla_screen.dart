import 'dart:math' as math;
import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../prayer_times/prayer_times_provider.dart';

class QiblaScreen extends ConsumerWidget {
  const QiblaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(prayerTimesProvider);

    double? bearing;
    String cityLabel = 'مكة';
    if (state.latitude != null && state.longitude != null) {
      bearing = Qibla(Coordinates(state.latitude!, state.longitude!)).direction;
      const meccaLat = 21.3891;
      const meccaLon = 39.8579;
      if ((state.latitude! - meccaLat).abs() > 0.5 ||
          (state.longitude! - meccaLon).abs() > 0.5) {
        cityLabel = 'موقعك';
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: state.isLoading
            ? const Center(
                child: CircularProgressIndicator(color: Color(0xFF4FC3F7)))
            : state.latitude == null
                ? _NoLocation(
                    onRetry: () =>
                        ref.read(prayerTimesProvider.notifier).refresh())
                : _QiblaView(
                    bearing: bearing!, cityLabel: cityLabel),
      ),
    );
  }
}

// ─── Main content ─────────────────────────────────────────────────────────────

class _QiblaView extends StatelessWidget {
  const _QiblaView({required this.bearing, required this.cityLabel});

  final double bearing;
  final String cityLabel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 28),

            // Kaaba icon
            const Icon(Icons.mosque, size: 64, color: Color(0xFF9E9E9E)),

            const SizedBox(height: 32),

            // Compass + arrow
            SizedBox(
              width: 260,
              height: 260,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: const Size(260, 260),
                    painter: _CompassPainter(),
                  ),
                  Transform.rotate(
                    angle: bearing * math.pi / 180,
                    child: const _Pointer(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Degree
            Text(
              bearing.toStringAsFixed(0),
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4FC3F7),
                height: 1,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'الاتجاه التقريبي للقبلة في',
              style: TextStyle(fontSize: 14, color: Colors.black45),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 2),
            Builder(builder: (context) {
              return Text(
                '$cityLabel ${bearing.toStringAsFixed(0)}°',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
                textDirection: TextDirection.rtl,
              );
            }),

            const SizedBox(height: 24),

            // Sensor row
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'حرّك الهاتف على شكل رقم 8 لمعايرة البوصلة',
                          textDirection: TextDirection.rtl,
                        ),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  },
                  child: const Text(
                    'معايرة',
                    style: TextStyle(color: Color(0xFF4FC3F7), fontSize: 14),
                  ),
                ),
                const Spacer(),
                const Text(
                  'دقة مستشعر الهاتف جيدة',
                  style: TextStyle(color: Colors.black45, fontSize: 13),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(width: 8),
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// ─── Compass painter ──────────────────────────────────────────────────────────

class _CompassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    final r = size.width / 2 - 2;

    // Outer ring
    canvas.drawCircle(
      c,
      r,
      Paint()
        ..color = const Color(0xFFE0E0E0)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );

    // Tick marks (72 = every 5°)
    for (int i = 0; i < 72; i++) {
      final angle = i * (math.pi * 2 / 72) - math.pi / 2;
      final isCardinal = i % 18 == 0;
      final isMajor = i % 9 == 0;
      final len = isCardinal ? 14.0 : isMajor ? 8.0 : 5.0;
      canvas.drawLine(
        c + Offset(math.cos(angle) * (r - len), math.sin(angle) * (r - len)),
        c + Offset(math.cos(angle) * r, math.sin(angle) * r),
        Paint()
          ..color = isCardinal
              ? Colors.black38
              : Colors.black12
          ..strokeWidth = isCardinal ? 1.5 : 1.0,
      );
    }

    // 8-point labels
    const points = [
      ('N', 0.0), ('NE', 45.0), ('E', 90.0), ('SE', 135.0),
      ('S', 180.0), ('SW', 225.0), ('W', 270.0), ('NW', 315.0),
    ];
    final tp = TextPainter(textDirection: TextDirection.ltr);
    for (final (label, deg) in points) {
      final rad = (deg - 90) * math.pi / 180;
      final isMain = label.length == 1;
      final lRadius = r - (isMain ? 28.0 : 22.0);
      final pos = c + Offset(math.cos(rad) * lRadius, math.sin(rad) * lRadius);
      tp.text = TextSpan(
        text: label,
        style: TextStyle(
          color:
              isMain ? const Color(0xFF4FC3F7) : Colors.black38,
          fontSize: isMain ? 14.0 : 11.0,
          fontWeight: isMain ? FontWeight.bold : FontWeight.normal,
        ),
      );
      tp.layout();
      tp.paint(canvas, pos - Offset(tp.width / 2, tp.height / 2));
    }
  }

  @override
  bool shouldRepaint(_CompassPainter old) => false;
}

// ─── Direction pointer ────────────────────────────────────────────────────────

class _Pointer extends StatelessWidget {
  const _Pointer();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(18, 100),
      painter: _PointerPainter(),
    );
  }
}

class _PointerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black87;
    // Triangle pointing up
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(0, size.height * 0.38)
      ..lineTo(size.width, size.height * 0.38)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_PointerPainter old) => false;
}

// ─── No location ──────────────────────────────────────────────────────────────

class _NoLocation extends StatelessWidget {
  const _NoLocation({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.location_off, color: Colors.black26, size: 64),
            const SizedBox(height: 16),
            const Text(
              'يجب تفعيل الموقع لتحديد اتجاه القبلة',
              style: TextStyle(color: Colors.black54, fontSize: 15),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4FC3F7),
                foregroundColor: Colors.white,
              ),
              child: const Text('تفعيل الموقع'),
            ),
          ],
        ),
      ),
    );
  }
}
