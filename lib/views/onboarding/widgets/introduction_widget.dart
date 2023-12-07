import 'package:flutter/material.dart';

class IntroductionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 15,
          // Adjust the flex factor as needed to give more space to the image
          child: Image.asset(
            'assets/banner.png',
            width:
                MediaQuery.of(context).size.width * 0.6, // 60% of screen width
          ),
        ),
        SizedBox(height: 16),
        Flexible(
          flex: 1,
          child: Text(
            'Football Quiz',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Flexible(
          flex: 3, // Adjust the flex factor as needed
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
