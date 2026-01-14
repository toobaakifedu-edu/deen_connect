import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart' as calendar;
import 'package:http/http.dart' as http;

/// Google Calendar Service
/// NOTE:
/// Google Calendar API does NOT work on Flutter Web.
/// This class safely disables calendar on Web.
class GoogleCalendarService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      calendar.CalendarApi.calendarScope,
    ],
  );

  Future<void> addTasbeehEvent({
    required String tasbeehName,
    required int targetCount,
    required String targetType,
    required DateTime startDate,
  }) async {
    /// 🚫 Disable on Web
    if (kIsWeb) {
      debugPrint('Google Calendar is not supported on Web.');
      return;
    }

    final account = await _googleSignIn.signIn();
    if (account == null) return;

    final authHeaders = await account.authHeaders;
    final client = GoogleAuthClient(authHeaders);
    final calendarApi = calendar.CalendarApi(client);

    final event = calendar.Event(
      summary: 'Tasbeeh: $tasbeehName',
      description:
          'Target: $targetCount\nType: $targetType\nDeen Connect Tasbeeh Tracker',
      start: calendar.EventDateTime(
        dateTime: startDate,
        timeZone: 'Asia/Karachi',
      ),
      end: calendar.EventDateTime(
        dateTime: startDate.add(const Duration(minutes: 30)),
        timeZone: 'Asia/Karachi',
      ),
    );

    await calendarApi.events.insert(event, 'primary');
  }
}

/// HTTP client with Google Auth headers
class GoogleAuthClient extends http.BaseClient {
  final Map<String, String> _headers;
  final http.Client _client = http.Client();

  GoogleAuthClient(this._headers);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll(_headers);
    return _client.send(request);
  }
}
