import 'package:w9_quiz_app/model/question.dart';
class Answer {
  final String id;
  final String selectedAnswer;
  final Question question;

  Answer({
    required this.id,
    required this.question,
    required this.selectedAnswer,
  });

  bool isCorrect() => selectedAnswer == question.correctAnswer;
}
