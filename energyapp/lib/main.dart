import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import 'quiz.dart';
// import 'pages/tips_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
