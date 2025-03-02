import 'package:flutter/material.dart';

import 'screens/generate_code_page.dart';
import 'screens/home_screen.dart';
import 'screens/scan_code_page.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scanfinity',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routes: {
        "/home": (context) => const HomeScreen(),
        "/generate": (context) => const GenerateCodePage(),
        "/scan": (context) => const ScanCodePage(),
      },
      home: const SplashScreen(),
    );
  }
}
