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
  int _score = 0;
  bool _quizCompleted = false;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': '⚡ What should you do during a power cut?',
      'options': ['🏃 Play outside', '🕯️ Light candles safely', '📺 Watch TV'],
      'correctIndex': 1,
      'explanation':
          '💡 During a power cut, always use flashlights or candles safely.',
    },
    {
      'question': '🔌 How do you stay safe during a blackout?',
      'options': [
        '✅ Stay away from electrical appliances',
        '💡 Turn on all lights',
        '📱 Use your phone nonstop',
      ],
      'correctIndex': 0,
      'explanation':
          '🛡️ Stay away from electrical appliances during a blackout.',
    },
    {
      'question': '🔦 Which item helps you during a power outage?',
      'options': ['📺 TV', '🔦 Flashlight', '🍕 Microwave'],
      'correctIndex': 1,
      'explanation': '✨ A flashlight helps you see when the power goes out.',
    },
    {
      'question': '🏠 What should you NOT do during a power outage?',
      'options': [
        '🚪 Open the fridge repeatedly',
        '🔦 Use a flashlight',
        '👨‍👩‍👧 Stay with family',
      ],
      'correctIndex': 0,
      'explanation': '❄️ Keep the fridge closed to keep food cold longer!',
    },
    {
      'question': '📞 Who should you call in an emergency?',
      'options': [
        '🎮 Your friend',
        '👨‍👩‍👧 Your parents or 999',
        '🍕 Pizza delivery',
      ],
      'correctIndex': 1,
      'explanation': '🚨 Call parents or 999 during serious emergencies!',
    },
  ];

  void _selectOption(int index) {
    setState(() {
      _selectedOptionIndex = index;
      _showResult = true;
      if (index == _questions[_currentQuestionIndex]['correctIndex']) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedOptionIndex = -1;
        _showResult = false;
      });
    } else {
      setState(() {
        _quizCompleted = true;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _selectedOptionIndex = -1;
      _showResult = false;
      _score = 0;
      _quizCompleted = false;
    });
  }

  // ⭐ FUN, COLORFUL RESULT SCREEN
  Widget _buildResultScreen() {
    final percentage = (_score / _questions.length * 100).round();
    String emoji;
    String title;

    if (_score == _questions.length) {
      emoji = '🏆';
      title = 'Perfect! You\'re a Super Star! ✨';
    } else if (_score >= _questions.length * 0.6) {
      emoji = '🌈';
      title = 'Great Job! You\'re Awesome! 🎉';
    } else {
      emoji = '💪';
      title = 'Keep Trying! You Can Do It! 🌟';
    }

    return Container(
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 100)),
              const SizedBox(height: 20),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 30),

              // Score Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.orange, width: 2),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Your Score 🎯',
                      style: TextStyle(fontSize: 20, color: Colors.orange),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '$_score / ${_questions.length}',
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    Text(
                      '$percentage%',
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // Try Again Button
              ElevatedButton(
                onPressed: _restartQuiz,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 43, 149, 255),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 32,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Try Again 🔄',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 20),

              // Home Button
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Back Home 🏠',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_quizCompleted) return Scaffold(body: _buildResultScreen());

    final question = _questions[_currentQuestionIndex];
    final total = _questions.length;
    final progress = (_currentQuestionIndex + 1) / total;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 43, 149, 255),
        title: const Text(
          'Kids Safety Quiz 🎓',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 4,
      ),
      body: Column(
        children: [
          // 🟦 FUN PROGRESS BAR
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: const Color.fromARGB(255, 178, 209, 240),
            child: Column(
              children: [
                Text(
                  'Question ${_currentQuestionIndex + 1} of $total 🎈',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 32, 32, 32),
                  ),
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey.shade300,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    const Color.fromRGBO(10, 65, 116, 1),
                  ),
                  minHeight: 8,
                ),
              ],
            ),
          ),

          // ⭐ MAIN CONTENT
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // 🎤 Question Card
                  Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade100,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.yellow.shade700),
                    ),
                    child: Text(
                      question['question'],
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                        height: 1.4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 🎯 Options (New Fun Design)
                  ...List.generate(question['options'].length, (index) {
                    final isSelected = index == _selectedOptionIndex;
                    final isCorrect = index == question['correctIndex'];

                    Color optionColor = Colors.blue.shade100;

                    if (_showResult) {
                      if (isSelected && isCorrect) optionColor = Colors.green;
                      if (isSelected && !isCorrect) optionColor = Colors.red;
                      if (!isSelected && isCorrect)
                        optionColor = Colors.green.shade300;
                    } else {
                      optionColor = isSelected
                          ? Colors.pink.shade200
                          : Colors.blue.shade100;
                    }

                    return GestureDetector(
                      onTap: _showResult ? null : () => _selectOption(index),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: optionColor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.blue.shade700),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Text(
                                String.fromCharCode(65 + index),
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                question['options'][index],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),

                  // 📖 Explanation
                  if (_showResult)
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.orange),
                      ),
                      child: Row(
                        children: [
                          const Text('📘 ', style: TextStyle(fontSize: 30)),
                          Expanded(
                            child: Text(
                              question['explanation'],
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.brown,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 20),

                  // NEXT BUTTON
                  if (_showResult)
                    ElevatedButton(
                      onPressed: _nextQuestion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          43,
                          149,
                          255,
                        ),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 32,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        _currentQuestionIndex < total - 1
                            ? 'Next Question ➡️'
                            : 'See Results 🏁',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
