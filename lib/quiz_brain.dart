import 'question.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizBrain {
  int currentQuestion = 0;
  int currentScore = 0;
  List<Icon> scoreKeeper = [];

  Icon correctIcon = Icon(
    Icons.check,
    color: Colors.green,
  );
  Icon incorrectIcon = Icon(
    Icons.close,
    color: Colors.red,
  );

  List<Question> _questions = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  bool quizDone() => currentQuestion == _questions.length;

  String getCurrentText() {
    return _questions[currentQuestion].questionText;
  }

  void resetQuiz() {
    currentScore = 0;
    currentQuestion = 0;
    scoreKeeper.clear();
  }

  void handleResponse(BuildContext context, bool response) {
    // Find out if answer was right
    bool result = _questions[currentQuestion].checkAnswer(response);

    // Update things as necessary
    Icon resultIcon = result ? correctIcon : incorrectIcon;
    scoreKeeper.add(resultIcon);
    if (result) {
      currentScore++;
    }

    // Increment question
    currentQuestion++;
    if (quizDone()) {
      Alert(
        context: context,
        type: AlertType.none,
        title: 'Quiz Over',
        desc: 'Final Score: $currentScore',
        buttons: [
          DialogButton(
            child: Text(
              'Reset Quiz',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 200,
          )
        ],
      ).show();
      resetQuiz();
    }
  }
}
