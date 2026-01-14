import 'package:flutter/material.dart';
import 'app.dart';
import 'services/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔔 Initialize local notifications
  await NotificationService.initialize();

  runApp(const MyApp());
}
