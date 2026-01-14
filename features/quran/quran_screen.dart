import 'package:flutter/material.dart';
import 'package:deen_connect/core/theme/app_colors.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class Surah {
  final int number;
  final String name;
  final String arabicName;
  final String meaning;
  final String type;
  final int totalAyahs;
  final String revelation;

  Surah({
    required this.number,
    required this.name,
    required this.arabicName,
    required this.meaning,
    required this.type,
    required this.totalAyahs,
    required this.revelation,
  });
}

class _QuranScreenState extends State<QuranScreen> {
  final List<Surah> _surahs = [
    Surah(
      number: 1,
      name: 'Al-Fatihah',
      arabicName: 'الفاتحة',
      meaning: 'The Opening',
      type: 'Meccan',
      totalAyahs: 7,
      revelation: 'Meccan',
    ),
    Surah(
      number: 2,
      name: 'Al-Baqarah',
      arabicName: 'البقرة',
      meaning: 'The Cow',
      type: 'Medinan',
      totalAyahs: 286,
      revelation: 'Medinan',
    ),
    Surah(
      number: 3,
      name: 'Aal-E-Imran',
      arabicName: 'آل عمران',
      meaning: 'The Family of Imran',
      type: 'Medinan',
      totalAyahs: 200,
      revelation: 'Medinan',
    ),
    Surah(
      number: 36,
      name: 'Yaseen',
      arabicName: 'يس',
      meaning: 'Yaseen',
      type: 'Meccan',
      totalAyahs: 83,
      revelation: 'Meccan',
    ),
    Surah(
      number: 55,
      name: 'Ar-Rahman',
      arabicName: 'الرحمن',
      meaning: 'The Most Merciful',
      type: 'Medinan',
      totalAyahs: 78,
      revelation: 'Medinan',
    ),
    Surah(
      number: 67,
      name: 'Al-Mulk',
      arabicName: 'الملك',
      meaning: 'The Sovereignty',
      type: 'Meccan',
      totalAyahs: 30,
      revelation: 'Meccan',
    ),
    Surah(
      number: 112,
      name: 'Al-Ikhlas',
      arabicName: 'الإخلاص',
      meaning: 'The Sincerity',
      type: 'Meccan',
      totalAyahs: 4,
      revelation: 'Meccan',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.primary,
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: AppColors.primaryGradient,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 80,
                    bottom: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'The Holy Quran',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Complete Quran with translation and tafsir',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            SizedBox(width: 12),
                            Icon(
                              Icons.search,
                              color: Colors.white70,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'Search Surah or Ayah...',
                                  hintStyle: TextStyle(color: Colors.white70),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Quick Actions
                  Row(
                    children: [
                      Expanded(
                        child: _ActionButton(
                          icon: Icons.play_circle_fill,
                          label: 'Listen',
                          color: Colors.green,
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _ActionButton(
                          icon: Icons.bookmark,
                          label: 'Bookmarks',
                          color: Colors.orange,
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _ActionButton(
                          icon: Icons.history,
                          label: 'Recent',
                          color: Colors.blue,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Featured Surahs
                  const Text(
                    'Featured Surahs',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _FeaturedSurahCard(
                          number: 36,
                          arabicName: 'يس',
                          name: 'Yaseen',
                          ayahs: 83,
                          onTap: () {},
                        ),
                        const SizedBox(width: 12),
                        _FeaturedSurahCard(
                          number: 67,
                          arabicName: 'الملك',
                          name: 'Al-Mulk',
                          ayahs: 30,
                          onTap: () {},
                        ),
                        const SizedBox(width: 12),
                        _FeaturedSurahCard(
                          number: 55,
                          arabicName: 'الرحمن',
                          name: 'Ar-Rahman',
                          ayahs: 78,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Surah List Header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'All Surahs (114)',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.sort,
                          size: 14,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'Order',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Surah List
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final surah = _surahs[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: _SurahCard(surah: surah),
                );
              },
              childCount: _surahs.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: color,
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeaturedSurahCard extends StatelessWidget {
  final int number;
  final String arabicName;
  final String name;
  final int ayahs;
  final VoidCallback onTap;

  const _FeaturedSurahCard({
    required this.number,
    required this.arabicName,
    required this.name,
    required this.ayahs,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0A6D0A), Color(0xFF4CAF50)],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.3),
              blurRadius: 15,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      number.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                const Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 28,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              arabicName,
              style: const TextStyle(
                fontSize: 32,
                fontFamily: 'Uthmanic',
                color: Colors.white,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '$ayahs Ayahs',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SurahCard extends StatelessWidget {
  final Surah surah;

  const _SurahCard({required this.surah});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              surah.number.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surah.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    surah.meaning,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              surah.arabicName,
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'Uthmanic',
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: surah.type == 'Meccan'
                      ? Colors.orange.withOpacity(0.1)
                      : Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  surah.type,
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        surah.type == 'Meccan' ? Colors.orange : Colors.green,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${surah.totalAyahs} Ayahs',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }
}
