import 'package:flutter/material.dart';
import 'package:football_quiz/consts/app_colors.dart';

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
    final color =
        option.text == 'true' ? AppColors.lightBlueColor : AppColors.redColor;

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
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          // Space between options
          padding: const EdgeInsets.all(16.0),
          // Padding inside the container
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.indigo,
                spreadRadius: 4,
                blurRadius: 10,
                offset: Offset(1, 5),
              ),
            ],
            color: color,
            border: Border.all(color: AppColors.whiteColor, width: 1),
            borderRadius: BorderRadius.circular(40), // Rounded corners
          ),
          alignment: Alignment.center,
          child: Text(
            option.text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
