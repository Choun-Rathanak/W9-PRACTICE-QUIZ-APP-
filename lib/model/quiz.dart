import '../model/answer.dart';
import '../model/question.dart';

class Quiz {
  List<Question> questions;
  List<Answer> answers = [];

  Quiz({required this.questions});


  void answerQuestion(int index, String choice) {
    final question = questions[index];


    answers.add(Answer(
      question: question,
      selectedAnswer: choice,
    ));
  }

  void reset() {
    answers.clear();
  }
  int get score => answers.where((a) => a.isCorrect()).length;

  double get percent => (score / questions.length) * 100;

 
  
}
