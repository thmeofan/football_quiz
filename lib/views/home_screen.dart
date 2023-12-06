import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_quiz/views/progress/view/progress_screen.dart';
import 'package:football_quiz/views/settings/view/settings_screen.dart';
import '../consts/app_colors.dart';
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
    const NewsScreen(),
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
                width: 24.0,
                height: 24.0,
                color: currentIndex == 0 ? AppColors.lightBlueColor : null,
              ),
              label: 'Categories'),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/progress.svg',
              width: 24.0,
              height: 24.0,
              color: currentIndex == 1 ? AppColors.lightBlueColor : null,
            ),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/news.svg',
                width: 24.0,
                height: 24.0,
                color: currentIndex == 2 ? AppColors.lightBlueColor : null,
              ),
              label: 'News'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/calendar.svg',
                width: 24.0,
                height: 24.0,
                color: currentIndex == 3 ? AppColors.lightBlueColor : null,
              ),
              label: 'Calendar'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/settings.svg',
                width: 24.0,
                height: 24.0,
                color: currentIndex == 4 ? AppColors.lightBlueColor : null,
              ),
              label: 'Settings'),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: AppColors.lightBlueColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
