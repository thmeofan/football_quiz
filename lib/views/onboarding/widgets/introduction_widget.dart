import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_quiz/consts/app_text_styles/onboarding_text_style.dart';

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: size.width * 0.06),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 12.0,
                top: size.width * 0.06,
                right: 12.0,
                bottom: size.width * 0.02),
            child: Image.asset(
              'assets/banner.png',
              height: size.height * 0.3,
            ),
          ),
          const Text(
            'Football Quiz',
            style: OnboardingTextStyle.introduction,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 15.0,
              top: size.width * 0.15,
              right: 15.0,
              bottom: 8,
            ),
            child: const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus.',
              textAlign: TextAlign.center,
              style: OnboardingTextStyle.description,
            ),
          ),
        ],
      ),
    );
  }
}
