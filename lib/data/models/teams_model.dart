import 'package:football_quiz/data/models/quiz_model.dart';

class TeamsQuestions extends Question {
  TeamsQuestions(
      {required super.text, required super.options, super.category = 'Teams'});
}

final teamQuestions = [
  TeamsQuestions(
    text:
        'Real Madrid has won the UEFA Champions League more times than any other team.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  TeamsQuestions(
    text:
        'The New England Revolution is a professional football club that competes in Major League Soccer (MLS).',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  TeamsQuestions(
    text: 'Liverpool FCs home colors are blue and white.',
    options: [
      Option(text: 'true', isCorrect: false),
      Option(text: 'false', isCorrect: true),
    ],
  ),
  TeamsQuestions(
    text: 'FC Barcelona and Real Madrids rivalry is known as "El Clásico.',
    options: [
      Option(text: 'true', isCorrect: true),
      Option(text: 'false', isCorrect: false),
    ],
  ),
  TeamsQuestions(
    text:
        'Manchester United has never been relegated from the Premier League since its formation in 1992.',
    options: [
      Option(text: 'true', isCorrect: false),
      Option(text: 'false', isCorrect: true),
    ],
  ),
];
