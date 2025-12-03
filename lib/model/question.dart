class Question{
  final String title;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.title,
    required this.options,
    required this.correctAnswer,
    
  });
  List<String> get choice => options;
  String get goodChoice => correctAnswer;
}