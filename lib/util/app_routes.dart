import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_quiz/data/models/quiz_model.dart';
import 'package:football_quiz/views/category/view/quiz_screen.dart';

import '../blocs/onboarding_cubit/onboarding_cubit.dart';
import '../data/repository/onboarding_repository.dart';
import '../views/home_screen.dart';
import '../views/onboarding/view/onboarding_screen.dart';

abstract class AppRoutes {
  static const home = 'home';
  static const welcome = 'welcome';
  static const categories = 'categories';
  static const progress = 'progress';
  static const news = 'news';
  static const calendar = 'calendar';
  static const settings = 'settings';
  static const quiz = 'quiz';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    final Widget child;

    OnboardingRepository onboardingRepository = OnboardingRepository();
    OnboardingCubit onboardingCubit = OnboardingCubit(onboardingRepository);

    switch (settings.name) {
      case home:
        child = HomeScreen();
      case quiz:
        List<Question> question = settings.arguments as List<Question>;
        child = QuizScreen(questions: question);
      default:
        child = BlocProvider(
          create: (context) => onboardingCubit,
          child: const OnboardingScreen(),
        );
    }
    return MaterialPageRoute(builder: (_) => child);
  }
}
