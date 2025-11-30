import 'package:flutter/material.dart';
import 'package:w9_quiz_app/ui/screens/question_screen.dart';
import 'package:w9_quiz_app/ui/screens/result_screen.dart';
import 'package:w9_quiz_app/ui/screens/welcome_screen.dart';

enum ChangeScreen { welcome, question, result }
class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

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

  @override
  Widget build(BuildContext context) {
    final screens = {
  // ChangeScreen.welcome: WelcomeScreen(
  //    icon: Icons.play_arrow,         
  //   label: "Start Quiz",            
  //   onStart: goToQuestionScreen,
  // ),
  // ChangeScreen.question: QuestionScreen(
  //   onFinish: () {
  //     setState(() {
  //       current = ChangeScreen.result;
  //     });
  //   },
  // ),
  // ChangeScreen.result: ResultScreen(
  //   onRestart: goToWelcomeScreen,
  // ),
};


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Quiz App")),
        body: screens[current]!, 
      ),
    );
  }
}
