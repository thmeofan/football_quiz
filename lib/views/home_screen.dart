import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_quiz/views/progress/view/progress_screen.dart';
import 'package:football_quiz/views/settings/view/settings_screen.dart';
import '../consts/app_colors.dart';
import '../data/models/news_model.dart';
import '../util/app_routes.dart';
import 'calendar/view/calendar_screen.dart';

import 'category/view/categories_screen.dart';
import 'news/view/news_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> homeWidgets = [
    const CategoriesScreen(),
    ProgressScreen(),
    NewsScreen(
      newsModel: news,
    ),
    const CalendarScreen(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeWidgets[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/categories.svg',
              width: 80.0,
              height: 40.0,
              color: currentIndex == 0
                  ? AppColors.lightBlueColor
                  : AppColors.lightGrayColor,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/progress.svg',
              width: 80.0,
              height: 40.0,
              color: currentIndex == 1
                  ? AppColors.lightBlueColor
                  : AppColors.lightGrayColor,
            ),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/news.svg',
                width: 80.0,
                height: 40.0,
                color: currentIndex == 2
                    ? AppColors.lightBlueColor
                    : AppColors.lightGrayColor,
              ),
              label: 'News'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/calendar.svg',
                width: 80.0,
                height: 40.0,
                color: currentIndex == 3
                    ? AppColors.lightBlueColor
                    : AppColors.lightGrayColor,
              ),
              label: 'Calendar'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/settings.svg',
                width: 80.0,
                height: 40.0,
                color: currentIndex == 4
                    ? AppColors.lightBlueColor
                    : AppColors.lightGrayColor,
              ),
              label: 'Settings'),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.blueColor,
        unselectedItemColor: AppColors.lightGrayColor,
        selectedItemColor: AppColors.lightBlueColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(
          color: AppColors.lightBlueColor,
        ),
        unselectedLabelStyle: TextStyle(
          color: AppColors.lightGrayColor,
        ),
      ),
    );
  }
}
