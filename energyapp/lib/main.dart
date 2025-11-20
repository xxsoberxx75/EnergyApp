// lib/main.dart
import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'features/quiz/screens/quiz_screen.dart';

void main() {
  runApp(const EnergyApp());
}

class EnergyApp extends StatelessWidget {
  const EnergyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Energy Awareness',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const QuizScreen(),
    );
  }
}
