import 'package:football_quiz/data/models/quiz_model.dart';

class RulesQuestions extends Question {
  RulesQuestions(
      {required super.text,
      required super.options,
      super.isLocked,
      super.selectedOption,
      super.category = 'Rules'});
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
  RulesQuestions(
    text:
        'A goal is scored when the ball fully crosses the goal line between the goalposts and under the crossbar',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  RulesQuestions(
    text:
        'A player is considered offside if any part of their body is in the opponent\'s half when the ball is played to them.',
    options: [
      Option(text: 'true', isCorrect: false),
      Option(text: 'false', isCorrect: true),
    ],
  ),
  RulesQuestions(
    text:
        'A goal is scored when the ball fully crosses the goal line between the goalposts and under the crossbar.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  RulesQuestions(
    text:
        'A player is considered offside if any part of their body is in the opponent\'s half when the ball is played to them.',
    options: [
      Option(text: 'true', isCorrect: false),
      Option(text: 'false', isCorrect: true),
    ],
  ),
  RulesQuestions(
    text:
        'A match consists of two 45-minute halves with a 15-minute halftime interval.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  RulesQuestions(
    text:
        'The team that wins the coin toss gets to choose which goal to attack in the first half.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  RulesQuestions(
    text:
        'A direct free kick is awarded if a player commits a handball offense.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  RulesQuestions(
    text: 'A penalty kick is taken from 10 yards away from the goal line.',
    options: [
      Option(text: 'true', isCorrect: false),
      Option(text: 'false', isCorrect: true),
    ],
  ),
  RulesQuestions(
    text:
        'An indirect free kick can be scored directly without the ball touching another player.',
    options: [
      Option(text: 'true', isCorrect: false),
      Option(text: 'false', isCorrect: true),
    ],
  ),
  RulesQuestions(
    text:
        'A goalkeeper cannot handle the ball if it has been deliberately kicked to them by a teammate.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  RulesQuestions(
    text:
        'If the ball bursts or becomes defective during a penalty kick, the kick is retaken.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  RulesQuestions(
    text:
        'A player can be sent off before the match starts if they commit violent conduct.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  RulesQuestions(
    text: 'The offside rule does not apply at a goal kick.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  RulesQuestions(
    text:
        'A player must be shown a yellow card before being shown a red card for disciplinary reasons.',
    options: [
      Option(text: 'true', isCorrect: false),
      Option(text: 'false', isCorrect: true),
    ],
  ),
  RulesQuestions(
    text:
        'A throw-in is awarded when the ball crosses the touchline completely, on the ground or in the air.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  RulesQuestions(
    text:
        'Players can be substituted an unlimited number of times during a match.',
    options: [
      Option(text: 'true', isCorrect: false),
      Option(text: 'false', isCorrect: true),
    ],
  ),
  RulesQuestions(
    text:
        'The team that scores the most goals in a match is always declared the winner.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  RulesQuestions(
    text:
        'A corner kick is awarded if the defending team last touches the ball before it crosses their own goal line, not including the goal.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  RulesQuestions(
    text: 'An own goal can be scored directly from a corner kick.',
    options: [
      Option(text: 'true', isCorrect: false),
      Option(text: 'false', isCorrect: true),
    ],
  ),
  RulesQuestions(
    text: 'A goal may be scored directly from a kickoff.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  RulesQuestions(
    text:
        'The referee must stop play immediately if they intend to issue a yellow card.',
    options: [
      Option(text: 'true', isCorrect: false),
      Option(text: 'false', isCorrect: true),
    ],
  ),
  RulesQuestions(
    text: 'Slide tackling is always considered a foul.',
    options: [
      Option(text: 'true', isCorrect: false),
      Option(text: 'false', isCorrect: true),
    ],
  ),
  RulesQuestions(
    text: 'A player cannot be offside from a throw-in.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  RulesQuestions(
    text:
        'If a player receives medical treatment on the pitch, they must leave the field of play afterwards.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  RulesQuestions(
    text:
        'A player is not in an offside position if level with the second-to-last opponent.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  RulesQuestions(
    text:
        'The referee has the authority to change a decision as long as play has not restarted.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  RulesQuestions(
    text:
        'A dropped ball occurs if the referee accidentally touches the ball and it goes directly into the goal.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
];
