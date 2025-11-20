// lib/features/quiz/models/question.dart
class Question {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  const Question({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}
