
class PrayerTime {
  final String name;
  final String arabicName;
  final String time;
  final DateTime dateTime;
  final bool isCurrent;
  final String remainingTime;
  final bool passed;

  PrayerTime({
    required this.name,
    required this.arabicName,
    required this.time,
    required this.dateTime,
    required this.isCurrent,
    required this.remainingTime,
    required this.passed,
  });
}

class Location {
  final double latitude;
  final double longitude;
  final String city;
  final String country;
  final String timezone;

  Location({
    required this.latitude,
    required this.longitude,
    required this.city,
    required this.country,
    required this.timezone,
  });
}

class PrayerCalculationMethod {
  final String id;
  final String name;
  final String description;

  PrayerCalculationMethod({
    required this.id,
    required this.name,
    required this.description,
  });
}