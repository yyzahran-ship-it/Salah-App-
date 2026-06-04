import 'package:flutter/material.dart';
import 'features/dhikr/dhikr_screen.dart';
import 'features/mushaf/mushaf_screen.dart';
import 'features/prayer_times/clock_prayer_screen.dart';
import 'features/prayer_times/prayer_times_screen.dart';
import 'features/qibla/qibla_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;

  static const _screens = [
    ClockPrayerScreen(),
    PrayerTimesScreen(),
    MushafScreen(),
    QiblaScreen(),
    DhikrScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: _SalatukNavBar(
        selectedIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
      ),
    );
  }
}

class _SalatukNavBar extends StatelessWidget {
  const _SalatukNavBar({
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onTap,
      backgroundColor: const Color(0xFF0D1117),
      indicatorColor: const Color(0xFF4FC3F7).withValues(alpha: 0.25),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final isSelected = states.contains(WidgetState.selected);
        return TextStyle(
          color: isSelected ? const Color(0xFF4FC3F7) : Colors.white38,
          fontSize: 11,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        );
      }),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.watch_later_outlined, color: Colors.white38),
          selectedIcon: Icon(Icons.watch_later, color: Color(0xFF4FC3F7)),
          label: 'Clock',
        ),
        NavigationDestination(
          icon: Icon(Icons.format_list_bulleted_outlined, color: Colors.white38),
          selectedIcon:
              Icon(Icons.format_list_bulleted, color: Color(0xFF4FC3F7)),
          label: 'Prayers',
        ),
        NavigationDestination(
          icon: Icon(Icons.menu_book_outlined, color: Colors.white38),
          selectedIcon: Icon(Icons.menu_book, color: Color(0xFF4FC3F7)),
          label: 'Quran',
        ),
        NavigationDestination(
          icon: Icon(Icons.explore_outlined, color: Colors.white38),
          selectedIcon: Icon(Icons.explore, color: Color(0xFF4FC3F7)),
          label: 'Qibla',
        ),
        NavigationDestination(
          icon: Icon(Icons.spa_outlined, color: Colors.white38),
          selectedIcon: Icon(Icons.spa, color: Color(0xFF4FC3F7)),
          label: 'Dhikr',
        ),
      ],
    );
  }
}
