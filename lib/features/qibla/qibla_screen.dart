import 'dart:math' as math;
import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../prayer_times/prayer_times_provider.dart';

class QiblaScreen extends ConsumerWidget {
  const QiblaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(prayerTimesProvider);

    double? qiblaBearing;
    String cityLabel = 'مكة  |  Mecca';
    if (state.latitude != null && state.longitude != null) {
      qiblaBearing =
          Qibla(Coordinates(state.latitude!, state.longitude!)).direction;
      const meccaLat = 21.3891;
      const meccaLon = 39.8579;
      if ((state.latitude! - meccaLat).abs() > 0.5 ||
          (state.longitude! - meccaLon).abs() > 0.5) {
        cityLabel = 'موقعك  |  Your location';
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
                : _LiveQiblaView(
                    qiblaBearing: qiblaBearing!, cityLabel: cityLabel),
      ),
    );
  }
}

// ─── Live compass view ────────────────────────────────────────────────────────

class _LiveQiblaView extends StatelessWidget {
  const _LiveQiblaView({
    required this.qiblaBearing,
    required this.cityLabel,
  });

  final double qiblaBearing;
  final String cityLabel;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CompassEvent>(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        final heading = snapshot.data?.heading ?? 0.0;
        final accuracy = snapshot.data?.accuracy;

        // Arrow angle so it points at Qibla relative to current heading
        final arrowAngle = (qiblaBearing - heading) * math.pi / 180;

        // Aligned = arrow within ±5° of pointing straight up
        final angleDiff = ((qiblaBearing - heading) % 360 + 360) % 360;
        final isAligned = angleDiff < 5 || angleDiff > 355;

        // Sensor quality label
        final String qualityLabel;
        final Color qualityColor;
        if (accuracy == null) {
          qualityLabel = 'مستشعر متاح  |  Sensor available';
          qualityColor = Colors.orange;
        } else if (accuracy < 15) {
          qualityLabel = 'دقة مستشعر الهاتف جيدة  |  Sensor accuracy good';
          qualityColor = Colors.green;
        } else if (accuracy < 30) {
          qualityLabel = 'دقة متوسطة  |  Medium accuracy';
          qualityColor = Colors.orange;
        } else {
          qualityLabel = 'دقة منخفضة — يُنصح بالمعايرة  |  Low — calibrate';
          qualityColor = Colors.red;
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 24),

                // ── Kaaba icon ────────────────────────────────────────
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFF5F5F5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.mosque,
                      size: 38, color: Color(0xFF757575)),
                ),

                const SizedBox(height: 8),

                const Text(
                  'القبلة',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const Text(
                  'Qibla Direction',
                  style: TextStyle(fontSize: 12, color: Colors.black45),
                ),

                const SizedBox(height: 28),

                // ── Compass ───────────────────────────────────────────
                SizedBox(
                  width: 280,
                  height: 280,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Outer glow ring
                      Container(
                        width: 280,
                        height: 280,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              const Color(0xFF4FC3F7).withValues(alpha: 0.08),
                              Colors.transparent,
                            ],
                            stops: const [0.65, 1.0],
                          ),
                        ),
                      ),
                      // Card shadow behind compass
                      Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 20,
                              spreadRadius: 2,
                            ),
                            if (isAligned)
                              BoxShadow(
                                color: const Color(0xFF4FC3F7)
                                    .withValues(alpha: 0.3),
                                blurRadius: 30,
                                spreadRadius: 4,
                              ),
                          ],
                        ),
                      ),
                      // Static compass ring (N/NE/E… labels never move)
                      CustomPaint(
                        size: const Size(280, 280),
                        painter: _CompassRingPainter(isAligned: isAligned),
                      ),
                      // Animated Qibla arrow
                      AnimatedRotation(
                        turns: arrowAngle / (2 * math.pi),
                        duration: const Duration(milliseconds: 120),
                        curve: Curves.easeOut,
                        child: _QiblaArrow(isAligned: isAligned),
                      ),
                      // Center dot
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isAligned
                              ? const Color(0xFF4FC3F7)
                              : Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // ── Degree ────────────────────────────────────────────
                Text(
                  '${qiblaBearing.toStringAsFixed(0)}°',
                  style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    color: isAligned
                        ? const Color(0xFF4FC3F7)
                        : const Color(0xFF4FC3F7),
                    height: 1,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'الاتجاه التقريبي للقبلة من $cityLabel',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black45,
                    height: 1.5,
                  ),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),

                if (isAligned) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4FC3F7).withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color:
                              const Color(0xFF4FC3F7).withValues(alpha: 0.4)),
                    ),
                    child: const Text(
                      '✓  أنت تواجه القبلة  |  Facing Qibla',
                      style: TextStyle(
                        color: Color(0xFF4FC3F7),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ],

                const SizedBox(height: 20),

                // ── Sensor quality + calibrate ────────────────────────
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: qualityColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          qualityLabel,
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 12),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'حرّك الهاتف على شكل رقم 8 لمعايرة البوصلة\nMove phone in a figure-8 to calibrate compass',
                                textDirection: TextDirection.rtl,
                              ),
                              duration: Duration(seconds: 4),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'معايرة\nCalibrate',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF4FC3F7), fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ─── Compass ring painter ─────────────────────────────────────────────────────

class _CompassRingPainter extends CustomPainter {
  const _CompassRingPainter({required this.isAligned});

  final bool isAligned;

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    final r = size.width / 2 - 4;

    // Outer ring
    canvas.drawCircle(
      c,
      r,
      Paint()
        ..color = isAligned
            ? const Color(0xFF4FC3F7).withValues(alpha: 0.4)
            : const Color(0xFFE0E0E0)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );

    // Inner ring
    canvas.drawCircle(
      c,
      r * 0.72,
      Paint()
        ..color = const Color(0xFFF0F0F0)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.8,
    );

    // Tick marks
    for (int i = 0; i < 72; i++) {
      final angle = i * (math.pi * 2 / 72) - math.pi / 2;
      final isCard = i % 18 == 0;
      final isMaj = i % 9 == 0;
      final len = isCard ? 16.0 : isMaj ? 9.0 : 5.0;
      canvas.drawLine(
        c + Offset(math.cos(angle) * (r - len), math.sin(angle) * (r - len)),
        c + Offset(math.cos(angle) * r, math.sin(angle) * r),
        Paint()
          ..color = isCard ? Colors.black38 : Colors.black12
          ..strokeWidth = isCard ? 1.5 : 0.8,
      );
    }

    // Cardinal + intercardinal labels
    const pts = [
      ('N', 0.0), ('NE', 45.0), ('E', 90.0), ('SE', 135.0),
      ('S', 180.0), ('SW', 225.0), ('W', 270.0), ('NW', 315.0),
    ];
    final tp = TextPainter(textDirection: TextDirection.ltr);
    for (final (lbl, deg) in pts) {
      final rad = (deg - 90) * math.pi / 180;
      final isMain = lbl.length == 1;
      final lR = r - (isMain ? 30.0 : 24.0);
      final pos = c + Offset(math.cos(rad) * lR, math.sin(rad) * lR);
      tp.text = TextSpan(
        text: lbl,
        style: TextStyle(
          color: isMain ? const Color(0xFF4FC3F7) : Colors.black38,
          fontSize: isMain ? 15.0 : 10.0,
          fontWeight: isMain ? FontWeight.bold : FontWeight.normal,
        ),
      );
      tp.layout();
      tp.paint(canvas, pos - Offset(tp.width / 2, tp.height / 2));
    }
  }

  @override
  bool shouldRepaint(_CompassRingPainter old) => old.isAligned != isAligned;
}

// ─── Qibla arrow ─────────────────────────────────────────────────────────────

class _QiblaArrow extends StatelessWidget {
  const _QiblaArrow({required this.isAligned});

  final bool isAligned;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(24, 180),
      painter: _ArrowPainter(isAligned: isAligned),
    );
  }
}

class _ArrowPainter extends CustomPainter {
  const _ArrowPainter({required this.isAligned});

  final bool isAligned;

  @override
  void paint(Canvas canvas, Size size) {
    final color =
        isAligned ? const Color(0xFF4FC3F7) : const Color(0xFF1A1A1A);
    final tailColor =
        isAligned ? const Color(0xFF4FC3F7).withValues(alpha: 0.4) : Colors.black26;

    final cx = size.width / 2;
    final midY = size.height / 2;

    // North arrow head (pointing up)
    final headPath = Path()
      ..moveTo(cx, 4)
      ..lineTo(cx - 10, midY - 4)
      ..lineTo(cx + 10, midY - 4)
      ..close();
    canvas.drawPath(headPath, Paint()..color = color);

    // South tail (pointing down, lighter)
    final tailPath = Path()
      ..moveTo(cx, size.height - 4)
      ..lineTo(cx - 8, midY + 4)
      ..lineTo(cx + 8, midY + 4)
      ..close();
    canvas.drawPath(tailPath, Paint()..color = tailColor);

    // Shaft
    canvas.drawLine(
      Offset(cx, midY - 4),
      Offset(cx, midY + 4),
      Paint()
        ..color = color
        ..strokeWidth = 2,
    );
  }

  @override
  bool shouldRepaint(_ArrowPainter old) => old.isAligned != isAligned;
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
            const SizedBox(height: 4),
            const Text(
              'Location required for Qibla direction',
              style: TextStyle(color: Colors.black38, fontSize: 13),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4FC3F7),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('تفعيل الموقع  |  Enable Location'),
            ),
          ],
        ),
      ),
    );
  }
}
