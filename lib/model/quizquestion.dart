class QuizQuestion {
  const QuizQuestion(this.questionText, this.answers);

  final String questionText;
  final List<String> answers;

  List<String> getShuffeledAnswers() {
    var shuffeled = List.of(answers);
    shuffeled.shuffle();
    return shuffeled;
  }
}
