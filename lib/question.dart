class Question {
  String questionText;
  bool questionAnswer;

  Question(this.questionText, this.questionAnswer);

  bool checkAnswer(bool answer) {
    return answer == this.questionAnswer;
  }
}
