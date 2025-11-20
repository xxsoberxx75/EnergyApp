// lib/main.dart
import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import 'quiz.dart';
// import 'pages/tips_page.dart';

void main() {
  runApp(const EnergyApp());
}

class EnergyApp extends StatelessWidget {
  const EnergyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/dashboard',
      routes: {
        '/dashboard': (context) => const DashboardPage(),
        '/quiz': (context) => const QuizPage(),
        // '/tips': (context) => const TipsPage(),
      },
    );
  }
}
