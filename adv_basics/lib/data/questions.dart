import 'package:adv_basics/models/quiz_question.dart';

const questions = [
  QuizQuestion(
    question: 'Which language is used by Flutter?',
    answers: ['Dart', 'Java', 'Kotlin', 'Swift'], // ✅ Correct: Dart
  ),
  QuizQuestion(
    question: 'Which widget is used for layouts in Flutter?',
    answers: ['Column', 'Button', 'TextField', 'Slider'], // ✅ Correct: Column
  ),
  QuizQuestion(
    question: 'Who developed Flutter?',
    answers: ['Google', 'Facebook', 'Microsoft', 'Apple'], // ✅ Correct: Google
  ),
  QuizQuestion(
    question: 'Which function is the entry point of every Flutter app?',
    answers: ['main()', 'run()', 'start()', 'init()'], // ✅ Correct: main()
  ),
  QuizQuestion(
    question: 'What file contains Flutter app dependencies?',
    answers: [
      'pubspec.yaml',
      'package.json',
      'build.gradle',
      'manifest.xml',
    ], // ✅ Correct: pubspec.yaml
  ),
];
