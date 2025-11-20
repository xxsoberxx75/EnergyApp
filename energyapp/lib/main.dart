// lib/main.dart
import 'package:energyapp/homepage.dart';
import 'package:energyapp/tips.dart';
import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import 'features/quiz/screens/quiz_screen.dart';
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
      initialRoute: '/homepage',
      routes: {
        '/homepage': (context) => const HomePage(),
        '/dashboard': (context) => const DashboardPage(),
        '/quiz': (context) => const QuizScreen(),
        '/tips': (context) => const CombinedInfoPage(),
      },
    );
  }
}
