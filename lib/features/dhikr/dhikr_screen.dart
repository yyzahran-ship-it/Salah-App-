import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dhikr_data.dart';
import 'dhikr_detail_screen.dart';
import 'dhikr_provider.dart';
import 'tasbih_screen.dart';

class DhikrScreen extends ConsumerWidget {
  const DhikrScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          children: [
            // ── Header ────────────────────────────────────────────────
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'الأذكار',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    Text(
                      'Dhikr & Athkar',
                      style: TextStyle(fontSize: 13, color: Colors.black45),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ── Collections grid (fixed height per card to avoid overflow) ─
            GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 168,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: dhikrCollections
                  .map((col) => _CollectionCard(collection: col))
                  .toList(),
            ),

            const SizedBox(height: 16),

            // ── Tasbih counter ─────────────────────────────────────────
            _TasbihCard(),
          ],
        ),
      ),
    );
  }
}

// ─── Collection card ──────────────────────────────────────────────────────────

class _CollectionCard extends ConsumerWidget {
  const _CollectionCard({required this.collection});

  final DhikrCollection collection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(dhikrProgressProvider);
    final completed = ref
        .read(dhikrProgressProvider.notifier)
        .completedInCategory(collection.category);
    final total = collection.items.length;
    final isDone = completed == total && total > 0;

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DhikrDetailScreen(collection: collection),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDone
                ? const Color(0xFF4FC3F7).withValues(alpha: 0.6)
                : const Color(0xFFEEEEEE),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _CategoryIcon(icon: collection.icon, isDone: isDone),
                const Spacer(),
                if (isDone)
                  const Icon(Icons.check_circle,
                      color: Color(0xFF4FC3F7), size: 18),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              collection.titleAr,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              textDirection: TextDirection.rtl,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              collection.titleEn,
              style: const TextStyle(
                color: Colors.black45,
                fontSize: 11,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            // Progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: LinearProgressIndicator(
                value: total > 0 ? completed / total : 0,
                backgroundColor: const Color(0xFFEEEEEE),
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Color(0xFF4FC3F7),
                ),
                minHeight: 3,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              total == 0
                  ? 'أذكار / Dhikr'
                  : '$completed / $total',
              style: const TextStyle(
                color: Colors.black38,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryIcon extends StatelessWidget {
  const _CategoryIcon({required this.icon, required this.isDone});

  final IconCategory icon;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    IconData data;
    switch (icon) {
      case IconCategory.sun:
        data = Icons.wb_sunny_outlined;
      case IconCategory.moon:
        data = Icons.nights_stay_outlined;
      case IconCategory.prayer:
        data = Icons.mosque_outlined;
      case IconCategory.heart:
        data = Icons.favorite_border;
    }

    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isDone
            ? const Color(0xFF4FC3F7).withValues(alpha: 0.12)
            : const Color(0xFFF5F5F5),
      ),
      child: Icon(
        data,
        color: isDone ? const Color(0xFF4FC3F7) : Colors.black45,
        size: 18,
      ),
    );
  }
}

// ─── Tasbih card ──────────────────────────────────────────────────────────────

class _TasbihCard extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(tasbihProvider);

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const TasbihScreen()),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: const Color(0xFF4FC3F7),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF4FC3F7).withValues(alpha: 0.35),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.2),
              ),
              child: const Icon(Icons.touch_app_outlined,
                  color: Colors.white, size: 26),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'المسبحة الرقمية',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  Text(
                    'Tasbih Counter',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$count',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.white70),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
