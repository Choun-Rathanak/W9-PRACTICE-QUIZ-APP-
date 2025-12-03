import 'package:flutter/material.dart';
import 'package:w9_quiz_app/model/quiz.dart';
import 'ui/quiz_app.dart';
import 'data/sample_questions.dart';


 


  // 1 - Load the quiz data
    Quiz quiz = Quiz(questions: sampleQuestions);
  

  // 2 - Display the quiz
 void main() {
  runApp(QuizApp(quiz: quiz));
}



