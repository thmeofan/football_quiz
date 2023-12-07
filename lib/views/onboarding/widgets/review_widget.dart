import 'package:flutter/material.dart';

class ReviewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Container for the review content
        Expanded(
          flex: 55,
          // Adjust the flex factor to allocate more space for the review content
          child: Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'A Remarkable Prediction App!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => Icon(Icons.star, color: Colors.yellow),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'This app isn\'t just an app; it\'s a companion for every football fan. Whether you\'re a casual viewer or a dedicated follower, the app\'s features and community make it a must-have for anyone who loves sport.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        // Text widgets for feedback and ratings
        Expanded(
          flex:
              1, // Adjust the flex factor to allocate space for the feedback text
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'We value your feedback',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Expanded(
          flex:
              1, // Adjust the flex factor to allocate space for the ratings text
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Every day we are getting better due to your ratings and reviews — that helps us protect your accounts.',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
