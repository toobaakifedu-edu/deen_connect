import 'package:flutter/material.dart';
import 'package:deen_connect/core/theme/app_colors.dart';

class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({super.key});

  @override
  State<PrayerTimesScreen> createState() => _PrayerTimesScreenState();
}

class PrayerTime {
  final String name;
  final String arabicName;
  final String time;
  final Color color;
  final String icon;
  final bool isCurrent;
  final String remainingTime;
  final String azaanTime;

  PrayerTime({
    required this.name,
    required this.arabicName,
    required this.time,
    required this.color,
    required this.icon,
    required this.isCurrent,
    required this.remainingTime,
    required this.azaanTime,
  });
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
  final List<PrayerTime> _prayerTimes = [
    PrayerTime(
      name: 'Fajr',
      arabicName: 'الفجر',
      time: '05:15 AM',
      color: AppColors.fajrColor,
      icon: '🌙',
      isCurrent: false,
      remainingTime: 'Passed',
      azaanTime: '05:15 AM',
    ),
    PrayerTime(
      name: 'Sunrise',
      arabicName: 'الشروق',
      time: '06:30 AM',
      color: AppColors.sunriseColor,
      icon: '☀️',
      isCurrent: false,
      remainingTime: 'Passed',
      azaanTime: '-',
    ),
    PrayerTime(
      name: 'Dhuhr',
      arabicName: 'الظهر',
      time: '12:30 PM',
      color: AppColors.dhuhrColor,
      icon: '☀️',
      isCurrent: true,
      remainingTime: 'Passed',
      azaanTime: '12:30 PM',
    ),
    PrayerTime(
      name: 'Asr',
      arabicName: 'العصر',
      time: '03:45 PM',
      color: AppColors.asrColor,
      icon: '⛅',
      isCurrent: false,
      remainingTime: '2h 15m',
      azaanTime: '03:45 PM',
    ),
    PrayerTime(
      name: 'Maghrib',
      arabicName: 'المغرب',
      time: '06:00 PM',
      color: AppColors.maghribColor,
      icon: '🌅',
      isCurrent: false,
      remainingTime: '4h 30m',
      azaanTime: '06:00 PM',
    ),
    PrayerTime(
      name: 'Isha',
      arabicName: 'العشاء',
      time: '07:30 PM',
      color: AppColors.ishaColor,
      icon: '🌙',
      isCurrent: false,
      remainingTime: '6h 00m',
      azaanTime: '07:30 PM',
    ),
  ];

  String _selectedDate = 'Today';
  final List<String> _dates = ['Yesterday', 'Today', 'Tomorrow'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // App Bar
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
                        'Prayer Times',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.white70,
                            size: 18,
                          ),
                          const SizedBox(width: 6),
                          const Expanded(
                            child: Text(
                              'Lahore, Pakistan',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              '18 Dec 2025',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Date Selector
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey[200]!,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: _dates.map((date) {
                    final isSelected = date == _selectedDate;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDate = date;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primary
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              date,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: isSelected
                                    ? Colors.white
                                    : Theme.of(context).textTheme.bodyMedium?.color,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),

          // Next Prayer Card
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Next Prayer',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'ASR',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            '03:45 PM',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 14,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  'Starts in 2h 15m',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 4,
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Center(
                            child: Text(
                              '⛅',
                              style: TextStyle(fontSize: 50),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // All Prayer Times
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final prayer = _prayerTimes[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: _PrayerItem(prayer: prayer),
                );
              },
              childCount: _prayerTimes.length,
            ),
          ),

          // Settings Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Prayer Settings',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _SettingsItem(
                          icon: Icons.notifications,
                          title: 'Azan Notifications',
                          subtitle: 'Get notified 10 minutes before each prayer',
                          value: true,
                          onChanged: (value) {},
                        ),
                        const Divider(height: 24),
                        _SettingsItem(
                          icon: Icons.vibration,
                          title: 'Vibration',
                          subtitle: 'Vibrate on Azan time',
                          value: true,
                          onChanged: (value) {},
                        ),
                        const Divider(height: 24),
                        _SettingsItem(
                          icon: Icons.location_on,
                          title: 'Auto Location',
                          subtitle: 'Use current location for prayer times',
                          value: true,
                          onChanged: (value) {},
                        ),
                        const Divider(height: 24),
                        _SettingsItem(
                          icon: Icons.calculate,
                          title: 'Calculation Method',
                          subtitle: 'Islamic Society of North America (ISNA)',
                          value: null,
                          onChanged: (value) {},
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PrayerItem extends StatelessWidget {
  final PrayerTime prayer;

  const _PrayerItem({required this.prayer});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: prayer.isCurrent
            ? prayer.color.withOpacity(0.1)
            : Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: prayer.isCurrent
            ? Border.all(color: prayer.color, width: 2)
            : null,
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
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: prayer.color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              prayer.icon,
              style: const TextStyle(fontSize: 28),
            ),
          ),
        ),
        title: Row(
          children: [
            Text(
              prayer.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: prayer.isCurrent ? prayer.color : null,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              prayer.arabicName,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Uthmanic',
                color: prayer.isCurrent
                    ? prayer.color
                    : Colors.grey[600],
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              prayer.remainingTime,
              style: TextStyle(
                fontSize: 14,
                color: prayer.isCurrent ? prayer.color : Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            if (prayer.azaanTime != '-')
              Text(
                'Azan: ${prayer.azaanTime}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              prayer.time,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: prayer.isCurrent ? prayer.color : null,
              ),
            ),
            if (prayer.isCurrent)
              Container(
                margin: const EdgeInsets.only(top: 4),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: prayer.color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Current',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool? value;
  final Widget? trailing;
  final Function(bool)? onChanged;

  const _SettingsItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.value,
    this.trailing,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Icon(
              icon,
              color: AppColors.primary,
              size: 20,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        if (value != null)
          Switch(
            value: value!,
            onChanged: onChanged,
            activeThumbColor: AppColors.primary,
          )
        else if (trailing != null)
          trailing!,
      ],
    );
  }
}