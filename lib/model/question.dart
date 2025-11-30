class Question{
  final String id;
  final String title;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.id,
    required this.title,
    required this.options,
    required this.correctAnswer,
  });
}