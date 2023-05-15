import 'package:flutter/material.dart';
import 'package:mnotes/presentation/routes/app_router.dart';
import 'package:mnotes/presentation/theme/app_theme.dart';
import 'package:mnotes/settings/app_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //? initial route
  final String _initialRoute = '/login';

  //? debug flag
  final bool _showDebugBanner = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: appTheme,
      initialRoute: _initialRoute,
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: _showDebugBanner,
    );
  }
}
