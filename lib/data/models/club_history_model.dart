import 'package:football_quiz/data/models/quiz_model.dart';

class ClubHistoryQuestions extends Question {



  ClubHistoryQuestions(  {required super.text, required super.options,super.category='club history',});
}

final clubHistoryQuestions = [
  ClubHistoryQuestions(
    text:
        'Lionel Messi has only ever played for FC Barcelona during his professional club career',
    options: [
      const Option(text: 'true', isCorrect: true),
      const Option(text: 'false', isCorrect: false),
    ],
  ),
  ClubHistoryQuestions(
    text: 'Cristiano Ronaldo has won the FIFA Ballon dOr five times.',
    options: [
      const Option(text: 'true', isCorrect: false),
      const Option(text: 'false', isCorrect: true),
    ],
  ),
  ClubHistoryQuestions(
    text: 'Pelé scored over 1,000 professional career goals',
    options: [
      Option(text: 'true', isCorrect: false),
      Option(text: 'false', isCorrect: true),
    ],
  ),
  ClubHistoryQuestions(
    text:
        'Mia Hamm is a former professional football player known for her record-setting career with the United States Womens National Team.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  ClubHistoryQuestions(
    text: ' Zinedine Zidane was never sent off in a FIFA World Cup match.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
];
