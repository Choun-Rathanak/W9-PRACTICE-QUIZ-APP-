import 'package:flutter/material.dart';
import 'package:w9_quiz_app/model/quiz.dart';
import 'package:w9_quiz_app/ui/screens/question_screen.dart';
import 'package:w9_quiz_app/ui/screens/result_screen.dart';
import 'package:w9_quiz_app/ui/screens/welcome_screen.dart';

enum ChangeScreen { welcome, question, result }

class QuizApp extends StatefulWidget {
  const QuizApp({super.key, required this.quiz});
  final Quiz quiz;
  @override 
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  ChangeScreen current = ChangeScreen.welcome;

  void goToQuestionScreen() {
    setState(() {
      current = ChangeScreen.question;
    });

    
  }
  

  void goToWelcomeScreen() {
    setState(() {
      current = ChangeScreen.welcome;
    });
    
  }

  void goToResultScreen() {
    setState(() {
      current = ChangeScreen.result;
    });
 
  }

  Widget renderScreen(ChangeScreen screen) {
    switch (screen) {
      case ChangeScreen.welcome:
        return WelcomeScreen(onStart: goToQuestionScreen);
      case ChangeScreen.question:
        return QuestionScreen(quiz: widget.quiz,onFinish: goToResultScreen);
      case ChangeScreen.result:
        return ResultScreen(quiz: widget.quiz,onRestart: goToWelcomeScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quiz App"),
        ),
        body: renderScreen(current),
      ),
    );
  }
}