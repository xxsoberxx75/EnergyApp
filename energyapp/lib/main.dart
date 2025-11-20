// lib/main.dart
import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import 'features/quiz/screens/quiz_screen.dart';
import 'tips_page.dart';
import 'homepage.dart'; // ⬅️ IMPORTANT: import HomePage

void main() {
  runApp(const EnergyApp());
}

class EnergyApp extends StatelessWidget {
  const EnergyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home', // ⬅️ HomePage is now the first loaded page
      routes: {
        '/home': (context) => const HomePage(),
        '/dashboard': (context) => const DashboardPage(),
        '/quiz': (context) => const QuizScreen(),
        '/tips': (context) => const CombinedInfoPage(),
      },
    );
  }
}
