import 'package:flutter/material.dart';
import 'package:deen_connect/features/prayer_times/prayer_times_screen.dart';
import 'package:deen_connect/features/qibla/qibla_screen.dart';
import 'package:deen_connect/features/quran/quran_screen.dart';
import 'package:deen_connect/features/duas/duas_screen.dart';
import 'package:deen_connect/features/tracker/tracker_screen.dart';
import 'package:deen_connect/features/settings/settings_screen.dart';
import 'package:deen_connect/features/notifications/notifications_screen.dart';
import 'package:deen_connect/features/tasbeeh/tasbeeh_screen.dart'; // ✅ ADDED

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeDashboard(),
    const PrayerTimesScreen(),
    const QiblaScreen(),
    const QuranScreen(),
    const DuasScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 193, 163),
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 53, 41, 36),
          borderRadius: BorderRadius.circular(30),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                    index: 0,
                    icon: Icons.home_outlined,
                    activeIcon: Icons.home,
                    label: 'Home'),
                _buildNavItem(
                    index: 1,
                    icon: Icons.access_time_outlined,
                    activeIcon: Icons.access_time,
                    label: 'Prayer'),
                _buildNavItem(
                    index: 2,
                    icon: Icons.explore_outlined,
                    activeIcon: Icons.explore,
                    label: 'Qibla'),
                _buildNavItem(
                    index: 3,
                    icon: Icons.book_outlined,
                    activeIcon: Icons.book,
                    label: 'Quran'),
                _buildNavItem(
                    index: 4,
                    icon: Icons.favorite_outline,
                    activeIcon: Icons.favorite,
                    label: 'Duas'),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              backgroundColor: const Color(0xFF4A3728),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TrackerScreen()),
                );
              },
              child: const Icon(Icons.insights),
            )
          : null,
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    final isActive = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(isActive ? activeIcon : icon, color: Colors.white),
          Text(label,
              style: const TextStyle(color: Colors.white, fontSize: 11)),
        ],
      ),
    );
  }
}

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  final List<Map<String, dynamic>> quickAccessItems = [
    {
      'icon': Icons.explore,
      'label': 'Qibla',
      'screen': 'qibla',
    },
    {
      'icon': Icons.book,
      'label': 'Quran',
      'screen': 'quran',
    },
    {
      'icon': Icons.favorite,
      'label': 'Duas',
      'screen': 'duas',
    },
    {
      'icon': Icons.circle_outlined,
      'label': 'Tasbeeh', // ✅ ADDED
      'screen': 'tasbeeh',
    },
    {
      'icon': Icons.insights,
      'label': 'Tracker',
      'screen': 'tracker',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
        itemCount: quickAccessItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          final item = quickAccessItems[index];

          return GestureDetector(
            onTap: () {
              switch (item['screen']) {
                case 'qibla':
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const QiblaScreen()));
                  break;
                case 'quran':
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const QuranScreen()));
                  break;
                case 'duas':
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const DuasScreen()));
                  break;
                case 'tracker':
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const TrackerScreen()));
                  break;
                case 'tasbeeh': // ✅ ADDED
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const TasbeehScreen()),
                  );
                  break;
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item['icon'], size: 30, color: const Color(0xFF4A3728)),
                const SizedBox(height: 6),
                Text(item['label'], style: const TextStyle(fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }
}
