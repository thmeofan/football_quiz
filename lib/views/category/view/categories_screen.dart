import 'package:flutter/material.dart';
import 'package:football_quiz/consts/app_text_styles/categories_text_style.dart';
import 'package:football_quiz/data/models/club_history_model.dart';
import 'package:football_quiz/data/models/players_model.dart';
import 'package:football_quiz/data/models/rules_model.dart';
import 'package:football_quiz/data/models/teams_model.dart';
import 'package:football_quiz/views/category/view/quiz_screen.dart';
import 'package:football_quiz/views/category/widgets/category_button.dart';

import '../../../data/models/quiz_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void navigateToQuiz(BuildContext context, List<Question> questions) {
    void resetQuestions() {
      for (var question in questions) {
        question.isLocked = false;
        question.selectedOption = null;
      }
    }

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => QuizScreen(
        questions: questions,
        onRetakeQuiz: resetQuestions,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.transparent.withOpacity(1),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.2,
              ),
              const Text(
                'Choose a category',
                style: CategoriesTextStyle.title,
              ),
              CategoryButton(
                text: 'Rules',
                onTap: () => navigateToQuiz(context, rulesQuestions),
              ),
              CategoryButton(
                text: 'Teams',
                onTap: () => navigateToQuiz(context, teamQuestions),
              ),
              CategoryButton(
                text: 'Football players',
                onTap: () => navigateToQuiz(context, playersQuestions),
              ),
              CategoryButton(
                text: 'Club history',
                onTap: () => navigateToQuiz(context, clubHistoryQuestions),
              )
            ],
          ),
        ),
      ),
    );
  }
}
