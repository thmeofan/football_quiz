import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_quiz/consts/app_text_styles/onboarding_text_style.dart';

class ReviewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: size.height * 0.3,
              margin: EdgeInsets.symmetric(
                  horizontal: 16, vertical: size.width * 0.12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.08),
                child: Column(
                  children: [
                    const Text(
                      'A Remarkable Prediction App!',
                      textAlign: TextAlign.center,
                      style: OnboardingTextStyle.miniIntro,
                    ),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) => Icon(Icons.star, color: Colors.yellow),
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.02,
                    ),
                    const Text(
                      'This app isn\'t just an app; it\'s a companion for every football fan. Whether you\'re a casual viewer or a dedicated follower, the app\'s features and community make it a must-have for anyone who loves sport.',
                      textAlign: TextAlign.center,
                      style: OnboardingTextStyle.description,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 12,
              child: Image.asset(
                'assets/avatar.png',
                height: size.width * 0.15,
                width: size.width * 0.15,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'We value your feedback',
              style: OnboardingTextStyle.introduction,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
          child: Text(
            'Every day we are getting better due to your ratings and reviews — that helps us protect your accounts.',
            textAlign: TextAlign.center,
            style: OnboardingTextStyle.description,
          ),
        ),
      ],
    );
  }
}
