import 'package:football_quiz/data/models/quiz_model.dart';

class RulesQuestions extends Question {
  RulesQuestions(
      {required super.text,
      required super.options,
      super.isLocked,
      super.selectedOption,
      super.category = 'rules'});
}

final rulesQuestions = [
  RulesQuestions(
    text:
        'In football, the offside rule applies the moment the ball is played to a player in an offside position.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  RulesQuestions(
    text:
        'A goal kick is awarded when the ball last touches a defender and crosses the goal line without resulting in a goal.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  RulesQuestions(
    text:
        ' A player can be shown a red card and sent off for denying a clear goal-scoring opportunity with a handball.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  RulesQuestions(
    text:
        'If the referee accidentally gets hit by the ball and it changes possession, the play is stopped and restarted with a dropped ball.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  RulesQuestions(
    text:
        'A penalty kick is taken from the penalty spot, which is 10 yards away from the goal line.',
    options: [
      Option(text: 'true', isCorrect: false),
      Option(text: 'false', isCorrect: true),
    ],
  ),
];
