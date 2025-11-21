// lib/main.dart
import 'package:energyapp/homepage.dart';
import 'package:energyapp/tips.dart';
import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import 'features/quiz/screens/quiz_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔥 Initialize Firebase for Web (Chrome & Edge)
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAjra3Z8HfcaMQS-KKXoRISJUiQLHrgprY",
      appId: "1:570566659864:web:5a9ff53774a44b7448586d",
      messagingSenderId: "570566659864",
      projectId: "energyapp-66c13",
      storageBucket: "energyapp-66c13.firebasestorage.app",
    ),
  );

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
