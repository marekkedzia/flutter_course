class QuizQuestion {
  final String content;
  final List<String> answers;
  final int correctAnswer;

  const QuizQuestion(
      {required this.content,
      required this.answers,
      required this.correctAnswer});
}
