import 'package:flutter/material.dart';
import '../widgets/roundabout_number.dart';
import '../../model/quiz.dart';
import '../../model/answer.dart';
import '../widgets/app_button.dart';
class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback onRestart;

  const ResultScreen({super.key, required this.quiz, required this.onRestart});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.blue.shade500),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You Answer correct ${quiz.score} of ${quiz.questions.length}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: quiz.answers.length,
              itemBuilder: (context, index) => SingleAnswerView(
                userAnswer: quiz.answers[index],
                questionNumber: index, 
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 150),
            child: AppButton(
              "Restart Quiz",
              onTap: onRestart, 
            ),
          ),
                  SizedBox(height: 30,)

        ],
      ),
    );
  }
}
class SingleAnswerView extends StatelessWidget {
  final Answer userAnswer;
  final int questionNumber;

  const SingleAnswerView({
    super.key,
    required this.userAnswer,
    required this.questionNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        Row(
          children: [
            RoundaboutNumber(
              number: questionNumber + 1,
              color: userAnswer.isCorrect() ? Colors.green : Colors.red,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                userAnswer.question.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
 
        ...userAnswer.question.options.map((option) {
          IconData? markIcon;
          Color? markColor;

          if (option == userAnswer.question.correctAnswer) {
            markIcon = Icons.check;
            markColor = Colors.green;
          } else if (option == userAnswer.selectedAnswer &&
              option != userAnswer.question.correctAnswer) {
            markIcon = Icons.close;
            markColor = Colors.red;
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: markIcon != null
                      ? Icon(markIcon, size: 20, color: markColor)
                      : null,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    option,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: markColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        const SizedBox(height: 10),
      ],
    );
  }
}