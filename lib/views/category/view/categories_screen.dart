import 'package:flutter/material.dart';
import 'package:football_quiz/data/models/club_history_model.dart';
import 'package:football_quiz/data/models/players_model.dart';
import 'package:football_quiz/data/models/rules_model.dart';
import 'package:football_quiz/data/models/teams_model.dart';
import 'package:football_quiz/views/category/widgets/category_button.dart';

import '../../../util/app_routes.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

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
            fit: BoxFit.cover, // Cover the entire screen area
            colorFilter: ColorFilter.mode(
              Colors.transparent.withOpacity(1),
              BlendMode.dstATop, // Darken the background image
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
                style: TextStyle(color: Colors.white),
              ),
              CategoryButton(
                  text: 'Rules',
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(AppRoutes.quiz, arguments: rulesQuestions);
                  }),
              CategoryButton(
                  text: 'Teams',
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(AppRoutes.quiz, arguments: teamQuestions);
                  }),
              CategoryButton(
                  text: 'Football players',
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(AppRoutes.quiz, arguments: playersQuestions);
                  }),
              CategoryButton(
                  text: 'Club history',
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.quiz,
                        arguments: clubHistoryQuestions);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
