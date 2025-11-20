import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class KidsSectionScreen extends StatefulWidget {
  const KidsSectionScreen({super.key});

  @override
  _KidsSectionScreenState createState() => _KidsSectionScreenState();
}

class _KidsSectionScreenState extends State<KidsSectionScreen> {
  int _currentQuestionIndex = 0;
  int _selectedOptionIndex = -1;
  bool _showResult = false;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What should you do during a power cut?',
      'options': ['Play outside', 'Light candles', 'Watch TV'],
      'correctIndex': 1,
      'explanation':
          'During a power cut, always use flashlights or candles safely. Never use an open flame near flammable materials.',
    },
    {
      'question': 'How do you stay safe during a blackout?',
      'options': [
        'Stay away from electrical appliances',
        'Turn on all lights',
        'Use your phone nonstop',
      ],
      'correctIndex': 0,
      'explanation':
          'Stay away from electrical appliances to avoid accidents during a blackout.',
    },
    {
      'question': 'Which item helps you during a power outage?',
      'options': ['TV', 'Flashlight', 'Microwave'],
      'correctIndex': 1,
      'explanation':
          'A flashlight helps you see in the dark when the power goes out.',
    },
  ];

  void _selectOption(int index) {
    setState(() {
      _selectedOptionIndex = index;
      _showResult = true;
    });
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex++;
      _selectedOptionIndex = -1;
      _showResult = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];
    final total = _questions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kids Safety & Awareness'),
        backgroundColor: AppColors.navy,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.flash_on, color: Colors.yellow, size: 34),
                SizedBox(width: 10),
                Text(
                  "Quiz Time!",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Text(
              question['question'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 20),

            ...List.generate(question['options'].length, (index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: ElevatedButton(
                  onPressed: _showResult ? null : () => _selectOption(index),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: index == _selectedOptionIndex
                        ? (index == question['correctIndex']
                              ? Colors.greenAccent
                              : Colors.redAccent)
                        : AppColors.steel,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: Text(question['options'][index]),
                ),
              );
            }),

            const SizedBox(height: 16),

            if (_showResult) ...[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.lightbulb_outline,
                        color: Colors.yellow,
                        size: 30,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          question['explanation'],
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _currentQuestionIndex < total - 1
                      ? _nextQuestion
                      : () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Text(
                    _currentQuestionIndex < total - 1
                        ? 'Next Question'
                        : 'Finish Quiz 🎉',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
