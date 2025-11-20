import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({super.key, required this.currentIndex});

  void _navigateTo(BuildContext context, int index) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/homepage');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/dashboard');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/quiz');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/tips');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.blue;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (index) => _navigateTo(context, index),
      selectedItemColor: const Color.fromARGB(255, 16, 247, 0),
      unselectedItemColor: const Color.fromARGB(255, 255, 1, 1),
      items: const [
         BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Homepage',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.gamepad), label: 'Quiz'),
        BottomNavigationBarItem(
          icon: Icon(Icons.health_and_safety),
          label: 'Tips',
        ),
      ],
    );
  }
}
