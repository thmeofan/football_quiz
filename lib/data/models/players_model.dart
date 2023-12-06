import 'package:football_quiz/data/models/quiz_model.dart';

class PlayersQuestions extends Question {
  PlayersQuestions({
    required super.text,
    required super.options,
    super.category = 'players',
  });
}

final playersQuestions = [
  PlayersQuestions(
    text:
        'Lionel Messi has only ever played for FC Barcelona during his professional club career',
    options: [
      Option(text: 'true', isCorrect: false),
      Option(text: 'false', isCorrect: true),
    ],
  ),
  PlayersQuestions(
    text: 'Cristiano Ronaldo has won the FIFA Ballon dOr five times.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  PlayersQuestions(
    text: 'Pelé scored over 1,000 professional career goals',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  PlayersQuestions(
    text:
        'Mia Hamm is a former professional football player known for her record-setting career with the United States Womens National Team.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  PlayersQuestions(
    text: ' Zinedine Zidane was never sent off in a FIFA World Cup match.',
    options: [
      Option(text: 'true', isCorrect: false),
      Option(text: 'false', isCorrect: true),
    ],
  ),
];
