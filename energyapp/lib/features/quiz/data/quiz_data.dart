// lib/features/quiz/data/quiz_data.dart
import '../models/question.dart';

/// Map<CategoryName, List<Question>>
const Map<String, List<Question>> quizData = {
  'Safety': [
    Question(
      question: 'During a blackout, what should you do first?',
      options: [
        'Unplug sensitive appliances',
        'Stand under a power line',
        'Open the fridge often',
        'Light candles near curtains',
      ],
      correctIndex: 0,
      explanation:
          'Unplug TVs, PCs and other sensitive devices to prevent damage when power returns.',
    ),
    Question(
      question: 'Is it safe to walk near a fallen electric pole?',
      options: [
        'Yes, if it\'s not sparking',
        'Only during the day',
        'No, stay away and call CEB',
        'Yes, if you wear shoes',
      ],
      correctIndex: 2,
      explanation:
          'Always stay far from fallen poles or cables and alert the authorities.',
    ),
  ],
  'Energy': [
    Question(
      question: 'Which appliance usually uses the most electricity?',
      options: ['Phone charger', 'LED bulb', 'Air conditioner', 'Wi-Fi router'],
      correctIndex: 2,
      explanation:
          'Air conditioners consume a lot of power, especially with long nightly use.',
    ),
    Question(
      question: 'What is a good habit for using the geyser?',
      options: [
        'Leave it on all day',
        'Turn it on only when needed',
        'Use it during a blackout',
        'Never switch it off',
      ],
      correctIndex: 1,
      explanation:
          'Turning the geyser on only when needed reduces electricity consumption.',
    ),
  ],
  'Cyclone Tips': [
    Question(
      question: 'Before a cyclone, what should you do with your phone?',
      options: [
        'Leave it half charged',
        'Charge phone and power bank fully',
        'Turn it off and hide it',
        'Put it in the fridge',
      ],
      correctIndex: 1,
      explanation:
          'Fully charged devices keep you connected during long outages.',
    ),
  ],
};
