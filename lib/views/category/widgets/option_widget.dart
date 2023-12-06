import 'package:flutter/material.dart';

import '../../../data/models/quiz_model.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    super.key,
    required this.question,
    required this.onClickedOption,
  });
  final Question question;
  final ValueChanged<Option> onClickedOption;
// final List<Question> questions;
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Row(
          children: question.options
              .map((option) => buildOption(context, option))
              .toList(),
        ),
      );
  Widget buildOption(BuildContext context, Option option) {
    final isSelected = option == question.selectedOption;

    // Set the color based on the option's value
    final color = option.isCorrect ? Colors.blue : Colors.red;

    // Optionally add different styling if the option is selected
    final borderColor = isSelected ? Colors.white : Colors.transparent;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (!question.isLocked) {
            onClickedOption(option);
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(
              horizontal: 8.0), // Space between options
          padding: const EdgeInsets.all(16.0), // Padding inside the container
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
                color: borderColor, width: 3), // Highlight when selected
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
          alignment: Alignment.center, // Center the text inside the container
          child: Text(
            option.text,
            style: TextStyle(
              color:
                  Colors.white, // Text color that contrasts with the background
              fontWeight: FontWeight.bold, // Optional: make the text bold
            ),
          ),
        ),
      ),
    );
  }
}
