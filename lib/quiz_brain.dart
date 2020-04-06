import 'question.dart';
import 'package:flutter/material.dart';

class QuizBrain {
  int currentQuestion = 0;
  List<Icon> scoreKeeper = [];

  List<Question> questions = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
  ];

  String getCurrentQuestionText() {
    return questions[currentQuestion].questionText;
  }

  void handleResponse(bool response) {
    Question q = questions[currentQuestion];
    Icon correctIcon = Icon(
      Icons.check,
      color: Colors.green,
    );
    Icon incorrectIcon = Icon(
      Icons.close,
      color: Colors.red,
    );
    Icon resultIcon = q.checkAnswer(response) ? correctIcon : incorrectIcon;
    scoreKeeper.add(resultIcon);
    currentQuestion < 2 ? currentQuestion++ : currentQuestion = 0;
  }
}
