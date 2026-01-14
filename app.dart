import 'package:flutter/material.dart';
import 'package:deen_connect/core/theme/app_theme.dart';
import 'package:deen_connect/features/splash/splash_screen.dart';
import 'package:flutter/services.dart';

/// ✅ MAIN ENTRY WIDGET (used by main.dart)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeenConnectApp();
  }
}

/// ✅ ACTUAL APP CONFIGURATION
class DeenConnectApp extends StatelessWidget {
  const DeenConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    // System UI Configuration
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'DeenConnect',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
