import 'package:flutter/material.dart';

import 'package:w9_quiz_app/model/quiz.dart';
import 'package:w9_quiz_app/ui/widgets/app_button.dart';




class QuestionScreen extends StatefulWidget {
  final Quiz quiz;
  final VoidCallback onFinish;

  const QuestionScreen({
    super.key,
    required this.quiz,
    required this.onFinish,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  String? selectedAnswer;
  bool showResult = false;

  void answerQuestion(String answer) {
    if (showResult) return;

    setState(() {
      selectedAnswer = answer;
      widget.quiz.answerQuestion(currentQuestionIndex, answer);
      showResult = true;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
    

      final lastIndex = widget.quiz.questions.length - 1;

      if (currentQuestionIndex < lastIndex) {
        setState(() {
          currentQuestionIndex++;
          selectedAnswer = null;
          showResult = false;
        });
      } else {
        widget.onFinish();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.quiz.questions[currentQuestionIndex];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                question.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

             
              ...question.choice.map((answer) {
                Color buttonColor = Colors.white;

                if (showResult) {
                  if (answer == question.goodChoice) {
                    buttonColor = Colors.green;
                  } else if (answer == selectedAnswer) {
                    buttonColor = Colors.red;
                  }
                }

                return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                 child: AppButton(
                  answer,
                  onTap: () => answerQuestion(answer),
                  color: buttonColor,
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
