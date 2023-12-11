import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_quiz/consts/app_colors.dart';
import 'package:football_quiz/views/onboarding/widgets/introduction_widget.dart';
import 'package:football_quiz/views/onboarding/widgets/review_widget.dart';

import '../../../blocs/onboarding_cubit/onboarding_cubit.dart';
import '../../../util/app_routes.dart';
import '../../widgets/buttons/chosen_action_button_widget.dart';

class OnboardingScreen extends StatefulWidget {
  final bool? isFirstTime;

  const OnboardingScreen({
    Key? key,
    this.isFirstTime,
  }) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final CarouselController _carouselController = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.blueColor,
              AppColors.blackColor,
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            Expanded(
              child: CarouselSlider(
                items: [
                  IntroductionWidget(),
                  ReviewWidget(),
                ],
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: size.height * 0.6,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.25,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(2, (index) {
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index
                              ? AppColors.lightBlueColor
                              : AppColors.darkGreyColor,
                        ),
                      );
                    }),
                  ),
                  // Button
                  ChosenActionButton(
                    text: 'Next',
                    onTap: () async {
                      context.read<OnboardingCubit>().setFirstTime();
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
