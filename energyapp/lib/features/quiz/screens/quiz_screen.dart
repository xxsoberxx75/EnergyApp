import 'package:energyapp/components/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';
import '../data/quiz_data.dart';
import '../models/question.dart';
import '../widgets/category_chip.dart';
import '../widgets/answer_option.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late String _selectedCategory;
  int _currentQuestionIndex = 0;
  int _selectedOptionIndex = -1;
  bool _showResult = false;
  int _score = 0;
  bool _scoreFlash = false;
  Color _scoreFlashColor = Colors.transparent;

  List<String> get _categories => quizData.keys.toList();
  List<Question> get _questionsForCategory =>
      quizData[_selectedCategory] ?? const [];
  Question get _currentQuestion => _questionsForCategory[_currentQuestionIndex];

  @override
  void initState() {
    super.initState();
    _selectedCategory = _categories.first;
  }

  void _changeCategory(String category) {
    setState(() {
      _selectedCategory = category;
      _currentQuestionIndex = 0;
      _selectedOptionIndex = -1;
      _showResult = false;
      _score = 0;
    });
  }

  void _selectOption(int index) {
    if (_showResult) return;

    final bool isCorrect = index == _currentQuestion.correctIndex;

    setState(() {
      _selectedOptionIndex = index;
      _showResult = true;

      // Update score
      if (isCorrect) {
        _score++;
      }

      // Trigger score flash animation
      _scoreFlash = true;
      _scoreFlashColor = isCorrect ? Colors.greenAccent : Colors.redAccent;
    });

    // Remove flash after short delay
    Future.delayed(const Duration(milliseconds: 250), () {
      if (mounted) {
        setState(() {
          _scoreFlash = false;
        });
      }
    });
  }

  void _nextQuestion() {
    final isLast = _currentQuestionIndex == _questionsForCategory.length - 1;
    if (isLast) {
      _showScoreDialog();
    } else {
      setState(() {
        _currentQuestionIndex++;
        _selectedOptionIndex = -1;
        _showResult = false;
      });
    }
  }

  void _showScoreDialog() {
    final total = _questionsForCategory.length;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.navy,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: const Text(
          'Quiz finished!',
          style: TextStyle(color: AppColors.white),
        ),
        content: Text(
          'You scored $_score out of $total.\n\nNice work! Try again or change category.',
          style: const TextStyle(color: AppColors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _changeCategory(_selectedCategory); // restart
            },
            child: const Text(
              'Retry',
              style: TextStyle(color: AppColors.white),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Close',
              style: TextStyle(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final total = _questionsForCategory.length;
    final progress = total == 0 ? 0.0 : (_currentQuestionIndex + 1) / total;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.navy, AppColors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Energy Quiz',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // ⭐ REPLACEMENT GOES HERE ↓↓↓
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: _scoreFlash
                            ? _scoreFlashColor.withOpacity(0.85)
                            : AppColors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: _scoreFlash
                            ? [
                                BoxShadow(
                                  color: _scoreFlashColor.withOpacity(0.7),
                                  blurRadius: 20,
                                  spreadRadius: 3,
                                ),
                              ]
                            : [],
                      ),
                      child: Row(
                        children: [
                          AnimatedScale(
                            duration: const Duration(milliseconds: 200),
                            scale: _scoreFlash ? 1.5 : 1.0,
                            child: const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Score: $_score',
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // CATEGORY CHIPS
                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: _categories
                        .map(
                          (c) => CategoryChip(
                            label: c,
                            isSelected: c == _selectedCategory,
                            onTap: () => _changeCategory(c),
                          ),
                        )
                        .toList(),
                  ),
                ),

                const SizedBox(height: 20),

                // QUESTION CARD
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _buildQuestionCard(
                      key: ValueKey(
                        '$_selectedCategory-$_currentQuestionIndex',
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // PROGRESS BAR
                Text(
                  'Question ${_currentQuestionIndex + 1} of $total',
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: AppColors.white.withOpacity(0.2),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.steel,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // ⭐ THIS MUST BE INSIDE THE SCAFFOLD!
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 1),
    );
  }

  Widget _buildQuestionCard({Key? key}) {
    return Container(
      key: key,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.steel,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: SingleChildScrollView(
        // ⭐ FIX HERE
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('⚡', style: TextStyle(fontSize: 30)),
            const SizedBox(height: 8),
            Text(
              _currentQuestion.question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 18),

            // answer options
            ...List.generate(_currentQuestion.options.length, (index) {
              final option = _currentQuestion.options[index];
              return AnswerOption(
                text: option,
                isSelected: index == _selectedOptionIndex,
                isCorrect: index == _currentQuestion.correctIndex,
                showResult: _showResult,
                onTap: () => _selectOption(index),
              );
            }),

            const SizedBox(height: 14),

            if (_showResult) ...[
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '💡  ',
                      style: TextStyle(color: AppColors.white),
                    ),
                    Expanded(
                      child: Text(
                        _currentQuestion.explanation,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _nextQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    'Next question',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
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
