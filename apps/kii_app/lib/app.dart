import 'package:flutter/material.dart';

import 'features/home/home_screen.dart';

class KiiApp extends StatelessWidget {
  const KiiApp({super.key});

  static const Color graphite = Color(0xFF111315);
  static const Color surface = Color(0xFF1B1F22);
  static const Color orange = Color(0xFFFF7A1A);

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: orange,
      brightness: Brightness.dark,
      surface: surface,
    );

    return MaterialApp(
      title: 'KII',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: graphite,
        colorScheme: colorScheme,
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: graphite,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
