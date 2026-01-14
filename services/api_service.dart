import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _aladhanBaseUrl = 'https://api.aladhan.com/v1';
  static const String _quranApiBaseUrl = 'https://api.alquran.cloud/v1';
  
  // Prayer Times API
  static Future<Map<String, dynamic>> getPrayerTimes({
    required double latitude,
    required double longitude,
    int method = 1,
    String school = '0',
  }) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$_aladhanBaseUrl/timings?latitude=$latitude&longitude=$longitude&method=$method&school=$school',
        ),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load prayer times: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to API: $e');
    }
  }

  // Qibla Direction API
  static Future<Map<String, dynamic>> getQiblaDirection({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$_aladhanBaseUrl/qibla/$latitude/$longitude',
        ),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load Qibla direction: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to API: $e');
    }
  }

  // Quran Surah List
  static Future<Map<String, dynamic>> getSurahList() async {
    try {
      final response = await http.get(
        Uri.parse('$_quranApiBaseUrl/surah'),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load Surah list: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to API: $e');
    }
  }

  // Specific Surah with Translation
  static Future<Map<String, dynamic>> getSurah(
    int surahNumber, {
    String edition = 'en.asad',
  }) async {
    try {
      final response = await http.get(
        Uri.parse('$_quranApiBaseUrl/surah/$surahNumber/$edition'),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load Surah: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to API: $e');
    }
  }

  // Hijri Calendar
  static Future<Map<String, dynamic>> getHijriDate({
    int? timestamp,
    int adjustment = 0,
  }) async {
    try {
      final url = timestamp != null
          ? '$_aladhanBaseUrl/gToH/$timestamp?adjustment=$adjustment'
          : '$_aladhanBaseUrl/gToH?adjustment=$adjustment';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load Hijri date: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to API: $e');
    }
  }
}